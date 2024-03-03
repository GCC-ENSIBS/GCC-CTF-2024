// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Beyond is ERC20, Ownable {

    uint256 constant MAX_SUPPLY = 500 ether;
    uint256 mintedAmount;
    ERC20 WETH;

    constructor(address _weth) Ownable(msg.sender) ERC20("Beyond Gold", "BYDG") {
        WETH = ERC20(_weth);
    }

    function mint(address to, uint256 amount) external onlyOwner {
        require(mintedAmount + amount <= MAX_SUPPLY, "Max supply exceeded");
        mintedAmount += amount;
        _mint(to, amount);
    }

    function pullToken(address token, address to) external onlyOwner {
        ERC20(token).transfer(to, ERC20(token).balanceOf(address(this)));
    }

    function buy(uint256 amount) external {
        require(mintedAmount + amount <= MAX_SUPPLY, "Max supply exceeded");
        mintedAmount += amount;
        WETH.transferFrom(msg.sender, address(this), amount);
        _mint(msg.sender, amount);
    }
}
