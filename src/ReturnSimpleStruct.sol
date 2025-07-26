// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReturnSimpleStruct {
    // STRUCT
    struct Point {
        uint256 x;
        uint256 y;
    }

    function main(uint256 x, uint256 y) external pure returns (Point memory) {
        assembly {
            // static structs are the one that contains static types, these
            // dont need an offset and are stored directly
            mstore(0x20,x)
            mstore(0x40,y)
            return(0x20,0x40)
            // your code here
            // return the struct: `Point{x,y}`
        }
    }
}
