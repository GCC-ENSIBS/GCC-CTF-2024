object "Target" {
    code {
        // "https://twitter.com/BeyondBZH"
        sstore(0, 0x68747470733A2F2F747769747465722E636F6D2F4265796F6E64425A48)

        // Deploy the contract
        datacopy(0, dataoffset("transient"), datasize("transient"))
        return(0, datasize("transient"))
    }
    object "transient" {
        code {

            switch selector()
            
            case 0xcafebabe {
                mstore(0,sload(0))
                return(0,0x20)
            }

            default {
                switch eq(calldataload(0), caller())

                // Check if user is equal to caller
                case 1 {
                    tstore(0x20, 0x1337)
                    sstore(0x20, 0x1337)
                    mstore(0x20, 0x1337)
                }

                // Check if user is not equal to caller
                case 0 {
                    switch eq(tload(0x20), sload(0x20))    
                    case 1 {
                            if gt(calldatasize(), 0x20) {
                                // Calculate the offset for the jump instruction on 4 bytes
                                mstore(0, and(calldataload(0),shl(0xe0, 0xffffffff)))
                    
                                // Deploy middle code based on whether memory[0,4] << 2
                                setMiddleCode(shl(2, iszero(iszero(mload(0)))))
                                // call data from calldata to memory to memory[msize()], from calldata[0x04; 0x04+msg.value]
                                calldatacopy(msize(), 0x04, callvalue())
                                // Create a new contract with the bytecode and call it
                                // Store the address in the storage slot 0x1337
                                sstore(0x1337, create(0, 0, msize()))
                            }
                        }
                        
                    case 0 {
                            let success := callcode(gas(), sload(0x1337), 0, 0, 0, 0, 0)
                            if iszero(success) {
                                mstore(0, 0xb53abd53) 
                                revert(0, 0x20) 
                            }
                        }
                }

                default {
                    return(0,0)
                }
            }
            // evm.elf https://github.com/axic/evm.elf/
            function setMiddleCode(p) {     
                mstore(p          , 0x7f454c46010000000000000000004305020003001a0043051a00430504000000)
                mstore(add(p,0x20), 0xeb15604556000000000020000100000000000000000000b94700430500000000)
                mstore(add(p,0x3c), 0xb20dcd80340d93cd805b6c68656c6c6f2c20776f726c640a3d52600c6013f300) // Hardcoded bytecode for the middle code
            }                       

            function selector() -> s {
                s := div(calldataload(0), 0x100000000000000000000000000000000000000000000000000000000)
            }
        }
    }
}
