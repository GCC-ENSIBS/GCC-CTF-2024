// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IChallenge {
    function vault() external returns(address);
    function uniswapRouter() external returns(address);
    function beyond() external returns(address);
    function WETH() external returns(address);
    function isSolved() external view returns(bool);
}
