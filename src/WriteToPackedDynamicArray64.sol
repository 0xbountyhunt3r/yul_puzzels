// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToPackedDynamicArray64 {
    uint64[] public writeHere;

    function main(
        uint64 v1,
        uint64 v2,
        uint64 v3,
        uint64 v4,
        uint64 v5
    ) external {
        uint256 v1_ = v1;
        uint256 v2_ = v2;
        uint256 v3_ = v3;
        uint256 v4_ = v4;
        uint256 v5_ = v5;

        assembly {
            let s := writeHere.slot
            sstore(s, 5)
            mstore(0x00, s)
            let target := keccak256(0x00, 0x20)

            let packed := 0

            packed := or(packed, v1_)

            v2_ := shl(64, v2_)
            packed := or(packed, v2_)

            v3_ := shl(128, v3_)
            packed := or(packed, v3_)

            v4_ := shl(192, v4_)
            packed := or(packed, v4_)

            sstore(target, packed)
            target := add(target, 1)
            sstore(target, v5_)
            // your code here
            // write the code to store v1, v2, v3, v4, and v5 in the `writeHere` array in sequential order.
            // Hint: `writeHere` is a dynamic array, so you will need to access its length and use `mstore` or `sstore`
            // appropriately to push new values into the array.
        }
    }
}
