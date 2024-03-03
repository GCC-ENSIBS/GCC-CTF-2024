// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./Vault.sol";

contract VaultFactory is Ownable {

    mapping(address => address) public vaults;
    mapping(address => bool) public assetSupported;
    mapping(address => uint256) public rewardsPot;
    mapping(address => uint256) public swapNumber;
    address[3] public currentWinners;
    address public immutable UNISWAP_ROUTER;
    uint256 public constant FEES = 2;

    constructor(address _uniswapRouter) Ownable(msg.sender) {
        UNISWAP_ROUTER = _uniswapRouter;
    }

    function createVault() external returns(address) {
        require(vaults[msg.sender] == address(0), "Vault already created");
        Vault _vault = new Vault(address(this), msg.sender);
        vaults[msg.sender] = address(_vault);
        return address(_vault);
    }

    function transferVault(address to) external {
        require(vaults[msg.sender] != address(0), "Vault not created");
        require(vaults[to] == address(0), "User already has a vault");
        vaults[to] = vaults[msg.sender];
        delete vaults[msg.sender];
    }

    function setAssetSupport(address asset, bool supported) external onlyOwner {
        assetSupported[asset] = supported;
    }

    function sendFees(address token, uint256 amount) external {
        require(vaults[Vault(msg.sender).owner()] != address(0), "Fees not coming from a vault");
        address vaultOwner = Vault(msg.sender).owner();
        rewardsPot[token] += amount;
        swapNumber[vaultOwner]++;
        _updateCurrentWinners(vaultOwner);
        IERC20(token).transferFrom(msg.sender, address(this), amount);
    }

    function distributeRewards(address token) external onlyOwner {
        uint256 toDistribute = rewardsPot[token] / (currentWinners.length + 1);
        for(uint8 i ; i < currentWinners.length ; ++i) {
            rewardsPot[token] -= toDistribute;
            swapNumber[currentWinners[i]] = 0;
            IERC20(token).transfer(currentWinners[i], toDistribute);
        }
        _pullAsset(token, owner(), toDistribute);
    }

    function _pullAsset(address token, address to, uint256 amount) internal {
        IERC20(token).transfer(to, amount);
    }

    function _updateCurrentWinners(address user) internal {
        uint256 userSwaps = swapNumber[user];
        uint256 winnerSwaps;
        for(uint8 i ; i < currentWinners.length ; ++i) {
            winnerSwaps = swapNumber[currentWinners[i]];
            if(userSwaps > winnerSwaps) {
                for(uint8 j = i + 1 ; j < currentWinners.length ; ++j) {
                    currentWinners[j] = currentWinners[j - 1];
                }
                currentWinners[i] = user;
                break;
            }
        }
    }

}
