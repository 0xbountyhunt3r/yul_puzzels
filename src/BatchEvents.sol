// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BatchEvents {
    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, uint256 num);


    function main(address[] memory emitters, bytes32[] memory ids, uint256[] memory nums) external {
        bytes32 sig = bytes32(keccak256("MyEvent(address,bytes32,uint256)"));
        assembly {

            // * whenever you load an offset with calldata, add 0x04 to get the correct offset
            let emitters_ofst := add(calldataload(0x04),0x04)
            let ids_ofst := add(calldataload(0x24),0x04)
            let nums_ofst := add(calldataload(0x44),0x04)

            let start_of_emitters := calldataload(emitters_ofst)
            let start_of_ids := calldataload(ids_ofst)
            let start_of_nums := calldataload(nums_ofst)

            let len := start_of_emitters

            let ptr := 0
            ptr := add(ptr,0x20)
            for{let i:=0} lt(i,len) {i := add(i,1)} {
                let emitter := calldataload(add(emitters_ofst,ptr))
                let id := calldataload(add(ids_ofst,ptr))
                let num := calldataload(add(nums_ofst,ptr))
                ptr := add(ptr,0x20)

                mstore(0x00,num)
                log3(0x00,0x20,sig,emitter,id)
            }
            // your code here
            // emit the `MyEvent(address,bytes32,uint256)` event
            // Assuming all arrays (emitters, ids, and nums) are of equal length.
            // iterate over the set of parameters and emit events based on the array length.
        }
    }
}
