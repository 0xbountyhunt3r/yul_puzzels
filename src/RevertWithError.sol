// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;


error Err(string provided);
contract RevertWithError {
    function main() external pure {

    
        assembly {
            let selector := 0x08c379a0 
            let message := "RevertRevert"
            let messageLength := 0x0c

            // mstore(0x00, selector)
            // mstore(0x04, 0x20)
            // mstore(0x24, messageLength)
            // mstore(0x44, message)
            // // revert the function with an error of type `Error(string)`
            // // use "RevertRevert" as error message
            // // Hint: The error type is a predefined four bytes. See https://www.rareskills.io/post/try-catch-solidity

            // revert(0x00,0x64)

            mstore(0x00, message)
            revert(0x00, 0x0c)
        }
    }
}
