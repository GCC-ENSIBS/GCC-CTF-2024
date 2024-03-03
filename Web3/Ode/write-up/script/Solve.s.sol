// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import "forge-std/Script.sol";

interface IChallenge {
    function target() external view returns(address);
    function isSolved() external returns(bool);
}

contract Solve is Script {

    Exploit exploit;
    
    function run() public {
        vm.startBroadcast();
        
        IChallenge challenge = IChallenge(0x36057429744111b8f801cBf1D754C52d9f5e8C53);
        vm.label(challenge.target(), "challenge");
        exploit = new Exploit{value : 0.1 ether}(challenge.target());

        exploit.attack1();

        /* Exploit(0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512).attack2();
        require(challenge.isSolved()); */

        vm.stopBroadcast();
    }
}

contract Exploit{
    address target;

    constructor(address _target) payable {
        target = _target;
    }

    function attack1() external {
        // set the transient storage 0x20
        target.call(abi.encode(address(this)));

        // set the bytecode of addr thanks to the equality tload(0x20) and sload(0x20)
        address addr = target;
        assembly {
            let ptr := mload(0x40)
            mstore(ptr,           0x610060565b7f77576861742061626f7574203078356320262030783562203f60)
            mstore(add(ptr,0x20), 0x00550000000060005260206000f3000000000000000000000000000000000000)
            pop(call(gas(), addr, 0x30, ptr, add(ptr, 0x29), 0, 0))
        }
    }

    function attack2() external {
        // reset the transient storage and execute the delegatecode
        target.call("");
    }
}

/* contract Challenge {
    address public target;

    constructor() {
        // Using bytecode to deploy is just a way to workaround bytecode deployment in foundry
        bytes memory bytecode =
            hex"7c68747470733a2f2f747769747465722e636f6d2f4265796f6e64425a485f5561016261002e5f396101625ff3fe61000761013a565b63cafebabe81146100b957335f351460018114610029575f8114610040575f80f35b61133760205d6113376020556113376020526100b3565b60205460205c146001811461005b575f8114610093576100b1565b602036111561008e5763ffffffff60e01b5f35165f526100805f51151560021b6100c8565b3460045937595f80f0611337555b6100b1565b5f805f805f611337545af2806100af5763b53abd535f5260205ffd5b505b505b506100c2565b5f545f5260205ff35b50610161565b7f7f454c46010000000000000000004305020003001a0043051a0043050400000081527feb15604556000000000020000100000000000000000000b9470043050000000060208201527fb20dcd80340d93cd805b6c68656c6c6f2c20776f726c640a3d52600c6013f300603c82015250565b5f7c01000000000000000000000000000000000000000000000000000000005f3504905090565b";
        address addr;
        assembly {
            addr := create(0, add(bytecode, 0x20), mload(bytecode))
            if iszero(addr) { revert(0, 0) }
        }

        target = addr;
    }


    function isSolved() external returns (bool solved) {
        (, bytes memory ret) = target.call(hex"cafebabe");
        
        string memory answer = hex"0000000000000000576861742061626F7574203078356320262030783562203F";
        assembly {
            solved := eq(mload(add(ret, 0x20)),mload(add(answer,0x20)))
        }

        return solved;
    }
} */
