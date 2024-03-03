// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {AboveNFT} from "./AboveNFT.sol";

error ReceiverIsContract();
error AlreadyMinted();
error InvalidPrice();
error NotEligible();

contract BeyondNFT is ERC721, Ownable {

    AboveNFT public above;
    uint256 immutable private MAX_SUPPLY = 100;
    uint256 immutable private MINT_PRICE = 1 ether;
    uint256 public currentTokenId;
    mapping(address => bool) public hasMinted;
    mapping(address => bool) public isEligible;

    constructor() ERC721("Beyond", "BYD") Ownable(msg.sender) {}

    function mint() external payable {
        if(_isContract(msg.sender)) revert ReceiverIsContract();
        if(hasMinted[msg.sender]) revert AlreadyMinted();
        if(msg.value != MINT_PRICE) revert InvalidPrice();
        currentTokenId++;
        hasMinted[msg.sender] = true;
        if(currentTokenId <= 5) {
            isEligible[msg.sender] = true;
        }
        _safeMint(msg.sender, currentTokenId);
    }

    function claimSpecialPrize() external {
        if(!isEligible[msg.sender]) revert NotEligible();
        above.mint(msg.sender);
        isEligible[msg.sender] = false;
    }

    function setAboveAddress(address _above) external onlyOwner {
        above = AboveNFT(_above);
    }

    function _isContract(address sender) internal view returns(bool) {
        uint256 size;
        assembly {
            size := extcodesize(sender)
        }
        if(size == 0) return false;
        return true;
    }
}
