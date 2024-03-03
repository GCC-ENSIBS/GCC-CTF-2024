// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Script.sol";

interface IKatanaSale {
    function becomeBeyond(string memory passPhrase) external;
    function endSale() external;
}

interface IChallenge {
    function katanaSale() external view returns(address);
}

contract Solve is Script {

    // Put the Challenge address below
    IChallenge challenge = IChallenge(0x0AC748BC83c9B230489359A834fbc520522A7b9A);

    function run() public {
        vm.startBroadcast();

        IKatanaSale katanaSale = IKatanaSale(challenge.katanaSale());
        katanaSale.becomeBeyond("I will check out @BeyondBZH and @gcc_ensibs on X");
        katanaSale.endSale();

        vm.stopBroadcast();
    }
}
