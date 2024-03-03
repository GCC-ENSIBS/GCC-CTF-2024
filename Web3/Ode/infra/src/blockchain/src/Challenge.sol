// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

contract Challenge {
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
}