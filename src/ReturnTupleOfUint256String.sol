// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnTupleOfUint256String {
    function main() external pure returns (uint256, string memory) {

        bytes32 rare = bytes32("RareSkills");

        assembly {

            mstore(0x00,420)
            mstore(0x20,0x40)
            mstore(0x40,10)
            mstore(0x60, rare)
            return(0x00,0x80)
            // your code here
            // return the tuple of (uint256 and string): (420, "RareSkills")
        }
    }
}
