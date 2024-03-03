// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Challenge.sol";
import "../src/Beyond.sol";
import "../src/Vault.sol";
import "../src/interfaces/IWETH.sol";

contract Minaminao is Script {

    Challenge challenge = Challenge(address(1));

    function run() public {
        vm.startBroadcast();
        Vault vault = challenge.vault();
        Beyond beyond = challenge.beyond();
        IWETH weth = IWETH(challenge.WETH());
        address tokenIn;
        address tokenOut;
        if(beyond.balanceOf(address(vault)) >= weth.balanceOf(address(vault))) {
            tokenIn = address(beyond);
            tokenOut = address(weth);
        }
        else {
            tokenIn = address(weth);
            tokenOut = address(beyond);
        }
        uint256 amountIn = IERC20(tokenIn).balanceOf(address(vault));
        require(vault.slippage() <= 5, "Non tolerable slippage");
        vault.swap(amountIn, tokenIn, tokenOut);
        vm.stopBroadcast();
    }
}
