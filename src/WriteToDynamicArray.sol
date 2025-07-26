// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDynamicArray {
    uint256[] writeHere;

    function main(uint256[] memory x) external {
        assembly {
            let x_start := mload(x)
            let x_len := x_start

            let target := writeHere.slot
            mstore(0x80, target)
            let target2 := keccak256(0x80, 0x20)
            // lets do two loops one to store on memeory and one to write
            let size:=0
            for {
                let i := 0
            } lt(i, x_len) {
                i := add(i, 1)
            } { 
                size :=add(size,1)
                sstore(writeHere.slot,size)
                let element := mload(add(x, 0x20))
                x := add(x, 0x20)
                sstore(target2,element)
                target2 := add(target2,1)
            }

            
            // store the values in the DYNAMIC array `x` in the storage variable `writeHere`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return writeHere;
    }
}
