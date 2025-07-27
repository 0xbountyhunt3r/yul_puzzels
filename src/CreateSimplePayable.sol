// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CreateSimplePayable {
    function main(uint256 dummy, bytes memory deploymentBytecode) external payable returns (address addr) {
        assembly {
            // your code here
            // create a contract using the deploymentBytecode
            // return the address of the contract
            // create it with the msg.value
            // do this as part of create, don't transfer it after
            // hint: use the `create` opcode
            // hint: the bytecode is already in memory

            let data_sz := mload(deploymentBytecode)
            let data_ptr := add(deploymentBytecode,0x20)

            let val := callvalue()
            addr := create(val,data_ptr,data_sz)

            mstore(0x00,addr)
            return(0x00,0x20)
        }
    }
}
