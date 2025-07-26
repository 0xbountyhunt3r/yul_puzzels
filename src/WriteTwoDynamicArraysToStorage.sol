// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteTwoDynamicArraysToStorage {
    uint256[] public writeHere1;
    uint256[] public writeHere2;

    function main(uint256[] calldata x, uint256[] calldata y) external {
        assembly {

            let offset := calldataload(0x04)
            let len_x := calldataload(add(offset,0x04))
            let slot1 := writeHere1.slot
            mstore(0x00, slot1)
            let write_ptr_1 := keccak256(0x00,0x20)
            sstore(writeHere1.slot,len_x)
            for{let i:=0} lt(i,len_x) {i := add(i,1)} {
                let element := calldataload(add(add(offset,0x04),0x20))
                offset := add(offset, 0x20)
                sstore(write_ptr_1,element)
                write_ptr_1 := add(write_ptr_1, 1)
            }


            let offset_y := calldataload(0x24)
            let len_y := calldataload(add(offset_y,0x04))
            sstore(writeHere2.slot, len_y)
            let slot2 := writeHere2.slot
            mstore(0x00, slot2)
            let write_ptr_2 := keccak256(0x00,0x20)
            for{let i:=0} lt(i,len_y) {i := add(i,1)} {
                let element := calldataload(add(add(offset_y,0x04),0x20))
                offset_y := add(offset_y, 0x20)
                sstore(write_ptr_2,element)
                write_ptr_2 := add(write_ptr_2, 1)
            }

            // your code her e
            // write the dynamic calldata array `x` to storage variable `writeHere1` and
            // dynamic calldata array `y` to storage variable `writeHere2`
        }
    }
}
