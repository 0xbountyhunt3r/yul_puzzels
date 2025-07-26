// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract MaxOfArray {
    function main(uint256[] memory arr) external pure returns (uint256) {
        assembly {

            let length := mload(arr)
            let max := 0


            for{let i := 0} lt(i,length) {i := add(i,1)} {
                let element := mload(add(arr,0x20))
                if gt(element,max) {
                    max := element
                }

                arr := add(arr, 0x20)
            }

            mstore(0x00,max)
            return(0x00,0x20)
            // your code here
            // return the maximum value in the array
            // revert if array is empty
        }
    }
}
