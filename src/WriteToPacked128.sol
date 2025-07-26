// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPacked128 {
    uint128 public writeHere = 1;
    uint128 public someValue = 7;

    function main(uint256 v) external {
        uint256 value = v;
        uint256 max256 = type(uint256).max;

        assembly {
            let mask := shr(128,max256) // top most 128 bit are 0s
            let num := sload(0x00)
            num := and(num, mask) // now top most value of write here is 0
            let val := shl(128,value)
            let new_val := or(num,val)

            sstore(0,new_val)
            // your code here
            // change the value of `writeHere` storage variable to `v`
            // be careful not to alter the value of `someValue` variable
            // Hint: storage slots are arranged sequentially. Determine the storage slot of `writeHere`
            // and use `sstore` to modify only the `writeHere` variable.
        }
    }
}
