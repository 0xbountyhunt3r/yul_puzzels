// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract Tenary {
    uint256 public result;

    function main(uint256 a, uint256 b, uint256 c) external {
        assembly {

            if gt(a,b){
                sstore(0x00,0x0a)
                return(0x00,0x00)
            }

            if gt(b,c){
                sstore(0x00,add(0x0a,0x0a))
                return(0x00,0x00)
            }

            sstore(0x00,add(0x0a,add(0x0a,0x0a)))
        }
    }
}
