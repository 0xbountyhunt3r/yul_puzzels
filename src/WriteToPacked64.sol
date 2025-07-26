// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked64 {
    uint64 public someValue1 = 7;
    uint64 public writeHere = 1;
    uint64 public someValue2 = 7;
    uint64 public someValue3 = 7;

    function main(uint256 v) external {

        uint256 mask = type(uint256).max;
        uint256 mask_64 = type(uint64).max;
        uint256 main_mask = 0;
        uint256 mask_128 = type(uint128).max;
        assembly {

            mask_64 := shl(64, mask_64)
            mask_64 := not(mask_64)

            let s := sload(0x00)
            s := and(s, main_mask) // value of writeHere is reset

            let value := shl(64,v)

            s := or(s, value)

            sstore(0x00,s)
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
        }
    }
}
