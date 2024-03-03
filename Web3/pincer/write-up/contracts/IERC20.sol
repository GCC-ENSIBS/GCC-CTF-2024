// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

interface IERC20 {
    function approve(address,uint256) external;
    function deposit() external payable; // only used for WETH
    function balanceOf(address) external view returns(uint256);
    function transfer(address,uint256) external;
    function buy(uint256) external;
}
