// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PaymentSplitter {
    function main(address[] calldata recipients) external payable {
        assembly {
            let ofst := calldataload(0x04)

            let ptr := add(ofst, 0x04)
            let arr_len := calldataload(ptr)

            let bal := selfbalance()
            let share := div(bal, arr_len)
            let g := gas()
            for {
                let i := 0
            } lt(i, arr_len) {
                i := add(i, 1)
            } {
                ptr := add(ptr,0x20)
                let to := calldataload(ptr)
              
                let res := call(g, to, share, 0, 0, 0, 0)
            }
            // your code here
            // send the entire contract balance to the recipients
            // each recipient gets balance / recipients.length
        }
    }
}
