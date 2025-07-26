// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteDynamicArrayToStorage {
    uint256[] public writeHere;

    function main(uint256[] calldata x) external {
        assembly {

            let offset := calldataload(0x04)
            let arr_data_start := calldataload(add(offset,0x04))
            let len := arr_data_start
            sstore(writeHere.slot, len)

     
            let s := writeHere.slot
            mstore(0x00, s)
            let write_from := keccak256(0x00, 0x20)

            for {
                let i := 0
            } lt(i, len) {
                i := add(i, 1)
            } {
                let element := calldataload(add(add(offset,0x04),0x20))
                sstore(write_from, element)
                write_from := add(write_from, 1)
                offset := add(offset, 0x20)
            }
            // your code here
            // write the dynamic calldata array `x` to storage variable `writeHere`
        }
    }
}
