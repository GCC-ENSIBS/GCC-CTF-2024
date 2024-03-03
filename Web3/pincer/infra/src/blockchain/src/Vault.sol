// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "v2-periphery/interfaces/IUniswapV2Router02.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./VaultFactory.sol";

contract Vault is Ownable {

    VaultFactory factory;
    IUniswapV2Router02 uniswapRouter;
    mapping(address => uint256) depositedAmount;
    uint256 public slippage = 3;

    constructor(
        address _factory,
        address _vaultOwner
    ) Ownable(_vaultOwner) {
        factory = VaultFactory(_factory);
        uniswapRouter = IUniswapV2Router02(factory.UNISWAP_ROUTER());
    }

    function estimateAmountOut(uint256 amountIn, address[] memory path) external view returns(uint256) {
        uint256[] memory amounts = uniswapRouter.getAmountsOut(amountIn, path);
        return amounts[1] - (amounts[1] * slippage / 1000);
    }

    function swap(uint256 amountToSwap, address tokenIn, address tokenOut) external onlyOwner {
        require(tokenIn != tokenOut, "Tokens need to differ");
        require(amountToSwap != 0, "No zero amount");
        require(factory.assetSupported(tokenIn),  "Token in  not supported");
        require(factory.assetSupported(tokenOut), "Token out not supported");
        if(depositedAmount[tokenIn] < amountToSwap) amountToSwap = depositedAmount[tokenIn];
        address[] memory path = new address[](2);
        path[0] = tokenIn;
        path[1] = tokenOut;
        uint256 fees = _calculateFees(amountToSwap);
        IERC20(tokenIn).approve(address(factory), fees);
        factory.sendFees(tokenIn, fees);
        amountToSwap -= fees;
        IERC20(tokenIn).approve(address(uniswapRouter), type(uint256).max);
        uniswapRouter.swapExactTokensForTokens(amountToSwap, this.estimateAmountOut(amountToSwap, path), path, address(this), block.timestamp);
    }

    function depositAsset(address token, uint256 amount) external onlyOwner {
        require(factory.assetSupported(token), "Token to deposit not supported");
        depositedAmount[token] += amount;
        IERC20(token).transferFrom(msg.sender, address(this), amount);
    }

    function withdrawAsset(address token, uint256 amount) external onlyOwner {
        require(factory.assetSupported(token), "Token to withdraw not supported");
        depositedAmount[token] -= amount;
        IERC20(token).transfer(msg.sender, amount);
    }

    function setSlippage(uint256 newSlippage) external {
        slippage = newSlippage;
    }

    function _calculateFees(uint amount) internal view returns(uint256 fees) {
        fees = amount * factory.FEES() / 100;
    }

}
