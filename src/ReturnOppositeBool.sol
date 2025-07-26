// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnOppositeBool {
    function main(bool _bool) external pure returns (bool) {
        assembly {

            let val := calldataload(0x04)

            if iszero(val) {
                mstore(0x00,0x01)
                return(0x00,0x20)
            }

            mstore(0x00,0x00)
            return(0x00,0x20)
            
            // your code here
            // return the opposite of `_bool`
        }
    }
}
