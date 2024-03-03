// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/Challenge.sol";

contract Deploy is Script {

    function run() public {
        vm.startBroadcast();

        Challenge challenge = new Challenge{value : 1000 ether}();
        console.log("Challenge deployed at :", address(challenge));

        vm.stopBroadcast();
    }
}
