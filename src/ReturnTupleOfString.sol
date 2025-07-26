// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfString {
    function main() external pure returns (string memory, string memory) {
        bytes32 hello = bytes32("Hello");
        bytes32 rareSkills = bytes32("RareSkills");
        assembly {
            
            mstore(0x00, 0x40)
            mstore(0x20, 0x80)

            mstore(0x40, 5)
            mstore(0x60, hello)

            mstore(0x80, 10)
            mstore(0xa0, rareSkills)

            return(0x00, 0xb0)
            // your code here
            // return the tuple of string: ("Hello", "RareSkills")
        }
    }
}
