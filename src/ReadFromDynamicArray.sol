// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArray {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(uint256 index) external view returns (uint256) {
        assembly {
            // Get the storage slot 'p' of the `readMe` array variable.
            

            // The data for a dynamic storage array starts at keccak256(p).
            // To compute the hash, we must first store `p_slot` in memory.
            mstore(0x00, readMe.slot)
          
            // The slot of the desired element is the data start slot + the index.
            // We load the value directly from that calculated storage slot.
            let element_val := sload(add(keccak256(0x00, 0x20), index))

            // Return the value.
            mstore(0x00, element_val)
            return(0x00, 0x20)

            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Assume `index` is <= to the length of readMe
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
