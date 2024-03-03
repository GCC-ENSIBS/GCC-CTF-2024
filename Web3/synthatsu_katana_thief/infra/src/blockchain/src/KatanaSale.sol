// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract KatanaSale {
    
    address public beyond;
    uint256 public katanaPrice;
    uint256 public katanaSold;
    string public name = "one-katana";
    string public symbol = "KTN";
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;

    event Sold(address buyer, uint256 amount);

    constructor(uint256 _katanaPrice, uint256 _totalSupply) {
        beyond = msg.sender;
        katanaPrice = _katanaPrice;
        totalSupply = _totalSupply;
    }

    function transfer(address to, uint256 value) external {
        require(balanceOf[msg.sender] >= value, "Insufficient balance");
        balanceOf[msg.sender] -= value;
        balanceOf[to] += value;
    }

    function becomeBeyond(string memory passPhrase) external {
        require (keccak256(abi.encode(passPhrase)) == keccak256(abi.encode("I will check out @BeyondBZH and @gcc_ensibs on X")));
        beyond = msg.sender;
    }

    function buyKatana(uint256 _numberOfKatana) external payable {
        require(msg.value == _numberOfKatana * katanaPrice, "Incorrect Ether value");
        katanaSold += _numberOfKatana;
        balanceOf[msg.sender] += _numberOfKatana;
        emit Sold(msg.sender, _numberOfKatana);
    }

    function endSale() external {
        require(msg.sender == beyond, "Only a true Beyond can end the sale");
        balanceOf[msg.sender] += totalSupply - katanaSold;
    }
}