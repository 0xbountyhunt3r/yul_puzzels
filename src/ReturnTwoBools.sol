// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTwoBools {
    function main(bool a, bool b) external pure returns (bool, bool) {
        assembly {
            // Load the boolean arguments from calldata. As per ABI, they are
            // already represented as 32-byte words (0 or 1).
            let val_a := calldataload(0x04)
            let val_b := calldataload(0x24)

            // To return multiple values, we must place them sequentially in memory.
            // Each value occupies a full 32-byte slot.

            // Store the first boolean in memory at position 0x00.
            mstore(0x00, val_a)

            // Store the second boolean in memory at the next slot, 0x20.
            mstore(0x20, val_b)

            // Return the memory segment containing our tuple.
            // It starts at 0x00 and has a total size of 64 bytes (2 * 32 bytes).
            return(0x00, 0x40)
        }
    }
}
