// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "./Beyond.sol";
import "./VaultFactory.sol";
import "./Vault.sol";
import "./interfaces/IWETH.sol";
import "v2-periphery/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Challenge {

    IUniswapV2Router02 public immutable uniswapRouter = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
    address public immutable WETH = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public immutable MINAMINAO = 0x710ACb69aCa6aD658633A50D5e0CFFA52Dc7Bf07;
    address public immutable PLAYER = 0xCaffE305b3Cc9A39028393D3F338f2a70966Cb85;
    Beyond public beyond;
    VaultFactory public factory;
    Vault public vault;
    uint256 constant INITIAL_DEPOSIT = 100 ether;

    constructor() payable {
        require(msg.value >= INITIAL_DEPOSIT * 2);

        beyond = new Beyond(WETH);
        beyond.mint(address(this), INITIAL_DEPOSIT + 50 ether);

        factory = new VaultFactory(address(uniswapRouter));
        factory.setAssetSupport(WETH, true);
        factory.setAssetSupport(address(beyond), true);

        vault = Vault(factory.createVault());
        
        IWETH(WETH).deposit{value : INITIAL_DEPOSIT + 50 ether}();

        IWETH(WETH).approve(address(uniswapRouter), INITIAL_DEPOSIT);
        beyond.approve(address(uniswapRouter), INITIAL_DEPOSIT);
        uniswapRouter.addLiquidity(
            WETH, address(beyond),
            INITIAL_DEPOSIT, INITIAL_DEPOSIT,
            INITIAL_DEPOSIT, INITIAL_DEPOSIT, 
            address(this), block.timestamp
        );

        IWETH(WETH).approve(address(vault), 50 ether);
        beyond.approve(address(vault), 50 ether);
        vault.depositAsset(WETH, 50 ether);
        vault.depositAsset(address(beyond), 50 ether);

        vault.transferOwnership(MINAMINAO);
        factory.transferVault(MINAMINAO);

        (bool success,) = MINAMINAO.call{value : 55 ether}("");
        require(success, "Failed to send ETH to Minaminao");

        (success,) = PLAYER.call{value : 500 ether}("");
        require(success, "Failed to send ETH to Player");
    }

    function isSolved() external view returns(bool) {
        if(
            beyond.balanceOf(address(vault)) <= 20 ether &&
            IERC20(WETH).balanceOf(address(vault)) <= 20 ether
        ) {
            return true;
        }
        return false;
    }

}
