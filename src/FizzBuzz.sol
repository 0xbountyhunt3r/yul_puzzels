// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract FizzBuzz {
    function main(uint256 num) external pure returns (string memory) {
        bytes32 fizz = bytes32("fizz");
        bytes32 buzz = bytes32("buzz");
        bytes32 fizzbuzz = bytes32("fizzbuzz");
        bytes32 none = bytes32("");

        assembly {
            if and(iszero(mod(num, 5)), iszero(mod(num, 3))) {
                mstore(0x00, 0x20)
                mstore(0x20, 8)
                mstore(0x40, fizzbuzz)
                return(0x00, 0x60)
            }

            if iszero(mod(num, 3)) {
                mstore(0x00, 0x20)
                mstore(0x20, 4)
                mstore(0x40, fizz)
                return(0x00, 0x60)
            }

            if iszero(mod(num, 5)) {
                mstore(0x00, 0x20)
                mstore(0x20, 4)
                mstore(0x40, buzz)
                return(0x00, 0x60)
            }

            // your code here
            // if `num` is divisible by 3 return the word "fizz",
            // if divisible by 5 with the word "buzz",
            // if divisible by both 3 and 5 return the word "fizzbuzz",
            // else return an empty string "".

            // Assume `num` is greater than 0.

            mstore(0x00, 0x20)
            mstore(0x20, 0)
            mstore(0x40, none)
            return(0x00, 0x60)
        }
    }
}
