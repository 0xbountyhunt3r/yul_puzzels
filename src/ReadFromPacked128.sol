// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromPacked128 {
    uint128 someValue;
    uint128 readMe;

    function setValue(uint128 v1, uint128 v2) external {
        someValue = v1;
        readMe = v2;
    }

    function main() external view returns (uint256) {
        assembly {

            let num := sload(0x00)
            let unpacked := shr(128,num)
            mstore(0x00, unpacked)
            return(0x00,0x20)

        }
    }
}
