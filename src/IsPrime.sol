// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract IsPrime {
    function main(uint256 x) external pure returns (bool) {
        assembly {

            if or(lt(x,2),eq(x,2)) {
                mstore(0x00,0x00)
                return(0x00,0x20)
            }

    
            for {let i:= 2 } lt(i,sub(x,1)) {i:=add(i,1)} {
                let res := mod(x,i)
                if eq(res,0) {
                    mstore(0x00,0x00)
                    return(0x00,0x20)
                }

            }

            mstore(0x00,0x01)
            return(0x00,0x20)
    
        }
    }
}
