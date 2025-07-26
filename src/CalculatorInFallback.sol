// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract CalculatorInFallback {
    uint256 public result;

    fallback() external {
        // your code here
        // compare the function selector in the calldata with the any of the selectors below, then
        // execute a logic based on the right function selector and store the result in `result` variable.
        // assumming operations won't overflow
        assembly {
            let calldata_word := calldataload(0)

        
            let select := shr(224, calldata_word)

            if eq(select, 0x771602f7) {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(0x00, add(a, b))
                return(0x00, 0x00)
            }

            if eq(select, 0xb67d77c5) {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(0x00, sub(a, b))
                 return(0x00, 0x00)
            }

            if eq(select, 0xc8a4ac9c) {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(0x00, mul(a, b))
                 return(0x00, 0x00)
            }

            if eq(select, 0xa391c15b) {
                let a := calldataload(0x04)
                let b := calldataload(0x24)
                sstore(0x00, div(a, b))
                 return(0x00, 0x00)
            }

            // add(uint256,uint256) -> 0x771602f7 (add two numbers and store result in storage)
            // sub(uint256,uint256) -> 0xb67d77c5 (sub two numbers and store result in storage)
            // mul(uint256,uint256) -> 0xc8a4ac9c (mul two numbers and store result in storage)
            // div(uint256,uint256) -> 0xa391c15b (div two numbers and store result in storage)
        }
    }
}
