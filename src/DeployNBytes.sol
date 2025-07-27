// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract DeployNBytes {
    function main(uint256 size) external returns (address) {
        assembly {
            // This puzzle assumes `size` will be less than 256.

            // --- 1. Construct the 12-byte initialization script in memory ---
            // This script's job is to copy `size` bytes of code from an offset of 12
            // and return it. This returned code will become the new contract's runtime code.

            mstore8(0x00, 0x60)
            mstore8(0x01, size)

            mstore8(0x02, 0x60)
            mstore8(0x04, 0x0c)

            mstore8(0x04, 0x60)
            mstore8(0x05, 0x00)

            mstore8(0x06, 0x39)

            mstore8(0x07, 0x60)
            mstore8(0x08, size)

            mstore8(0x09,0x60)
            mstore8(0x0a,0x00)
            mstore8(0x0b,0xf3)

            // --- 2. Create the contract ---
            // The deployment bytecode consists of the 12-byte init script followed by
            // `size` bytes of runtime code. We don't care what the runtime code is,
            // as the hint says, so we can leave that part of memory as zeros.
            // The total length of the deployment code is 12 + size.
            let new_addr := create(0, 0x00, add(12, size))

            mstore(0x00, new_addr)
            return(0x00, 0x20)
        }
    }
}
