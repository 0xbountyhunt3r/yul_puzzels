// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDynamicArrayAndRevertOnFailure {
    uint256[] readMe;

    function setValue(uint256[] calldata x) external {
        readMe = x;
    }

    function main(int256 index) external view returns (uint256) {
        bytes32 selector = bytes32(abi.encodeWithSignature("Panic(uint256)"));
        assembly {
            let s := readMe.slot
            let len := sload(s)

            if or(gt(index, len), eq(len, index)) {
                mstore(0x00, selector)
                mstore(0x04, 0x32)
                revert(0x00, 0x24)
            }

            mstore(0x00, s)
            let loc := keccak256(0x00, 0x20)

            let target := add(loc, index)

            mstore(0x00, sload(target))
            return(0x00, 0x20)
            // your code here
            // read the value at the `index` in the dynamic array `readMe`
            // and return it
            // Revert with Solidity panic on failure, use error code 0x32 (out-of-bounds or negative index)
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
