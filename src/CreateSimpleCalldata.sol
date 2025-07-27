// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimpleCalldata {
    function main(bytes calldata deploymentBytecode) external returns (address) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: use calldatacopy to copy the deploymentBytecode to memory

            let ofst := calldataload(0x04)

            let ptr_to_data := 0
            ptr_to_data := add(ptr_to_data, ofst)
            ptr_to_data := add(ptr_to_data,0x04)
            let sz := calldataload(ptr_to_data)
            calldatacopy(0x00,add(ptr_to_data,0x20),sz)
            
            let res := create(0,0x00,sz)

            mstore(0x00,res)
            return(0x00,0x20)
       }
    }
}