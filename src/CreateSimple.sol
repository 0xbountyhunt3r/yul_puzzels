// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimple {
    function main(bytes memory deploymentBytecode) external returns (address addr) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // hint: use the `create` opcode
            // hint: the bytecode is already in memory
            let ofst := calldataload(0x04)
            let data := calldataload(add(ofst,0x04))


            let size :=mload(deploymentBytecode)
            let data_ptr := add(deploymentBytecode,0x20)

            addr := create(0,data_ptr,size)

            mstore(0x00,addr)
            return(0x00,0x20)

            
        }
    }
}


// So, to get the length, you would use calldataload(ofst). To get the start of the actual data, the address is add(ofst, 0x20). Your code is trying to read from add(ofst, 0x04), which is a misaligned position inside the length word.