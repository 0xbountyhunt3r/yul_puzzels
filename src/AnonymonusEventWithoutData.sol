// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AnonymonusEventWithoutData {
    // EMIT ME!!!
    event MyEvent();

    function main() external {

        bytes32 data = bytes32(keccak256("0x"));
        assembly {
            // your code here
  
            log0(0x00,0x00)
        }
    }
}
