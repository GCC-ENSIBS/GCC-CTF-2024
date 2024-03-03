// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IRouter {
    function swapExactTokensForTokens(uint256, uint256, address[] memory, address, uint256) external;
}
