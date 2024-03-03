// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {BeyondNFT} from "./BeyondNFT.sol";
import {AboveNFT} from "./AboveNFT.sol";

contract Challenge {

    BeyondNFT public beyond;
    AboveNFT public above;
    address constant public PLAYER = 0xCaffE305b3Cc9A39028393D3F338f2a70966Cb85;

    constructor() payable {
        beyond = new BeyondNFT();
        above = new AboveNFT();
        beyond.setAboveAddress(address(above));
        above.setBeyondAddress(address(beyond));
    }

    function isSolved() public view returns(bool) {
        uint256 totalSupply = above.tokenId();
        uint256 tokensOwned;
        for(uint256 i = 1 ; i <= totalSupply ; i++) {
            if(above.ownerOf(i) == PLAYER) tokensOwned++;
        }
        if(tokensOwned > 5) return true;
        return false;
    }
}
