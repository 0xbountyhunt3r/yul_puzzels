// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToFixedArray {
    uint256[5] writeHere;

    function main(uint256[5] memory x) external {

    
        assembly {
            x := sub(x,0x20)
            for {let i:= 0} lt(i,5) { i := add(i,1)} {
                let element := mload(add(x,0x20))
                sstore(i,element)
                x := add(x,0x20)
            }
            // your code here
            // store the values in the fixed array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[5] memory) {
        return writeHere;
    }
}
