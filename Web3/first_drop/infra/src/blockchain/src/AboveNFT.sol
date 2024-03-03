// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

error OnlyBeyond();

contract AboveNFT is ERC721, Ownable {

    uint256 public tokenId;
    address private beyond;

    constructor() ERC721("Above", "ABV") Ownable(msg.sender) {}

    function mint(address receiver) external onlyBeyond {
        tokenId++;
        _safeMint(receiver, tokenId);
    }

    function setBeyondAddress(address _beyond) external onlyOwner {
        beyond = _beyond;
    }

    modifier onlyBeyond() {
        if(msg.sender != beyond) revert OnlyBeyond();
        _;
    }
}
