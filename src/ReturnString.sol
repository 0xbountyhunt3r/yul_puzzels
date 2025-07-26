// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnString {
    function main() external pure returns (string memory) {

        bytes32 s = bytes32("Hello, RareSkills"); // len 19
        assembly {

            mstore(0x00, 0x20)
            mstore(0x20, 17)
            mstore(0x40,s)
            return(0x00,0x60)
            // your code here
            // return the exact string: `Hello, RareSkills`
        }
    }
}
