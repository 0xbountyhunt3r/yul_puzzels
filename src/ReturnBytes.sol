// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnBytes {
    function main(address a, uint256 b) external pure returns (bytes memory) {
        assembly {
            
            let a_ := calldataload(0x04)
            let b_ := calldataload(0x24)
            // You can use 'a' and 'b' directly. The compiler handles
            // loading them from calldata and ensures they are correctly formatted.
            mstore(0x00, a)
            mstore(0x20, b)


            // Return the 64-byte block of raw data.
            return(0x00, 0x60)
        }
    }
}
