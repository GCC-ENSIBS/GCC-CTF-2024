// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./KatanaSale.sol";

contract Challenge{
    KatanaSale public katanaSale;
    address constant public PLAYER = 0xCaffE305b3Cc9A39028393D3F338f2a70966Cb85;

    constructor () payable {
        katanaSale = new KatanaSale(10 ether, 100);
    }

    function isSolved() public view returns(bool){
        if(katanaSale.balanceOf(PLAYER) >= 60){
            return true;
        }
        return false;
    }

}