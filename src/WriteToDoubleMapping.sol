// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract WriteToDoubleMapping {
    mapping(address user => mapping(address token => uint256 value)) public balances;

    function main(address user, address token, uint256 value) external {
        assembly {

            let key1 := user
            let key2 := token
            let s := balances.slot

            mstore(0x00,key1)
            mstore(0x20,s)
            mstore(0x20,keccak256(0x00,0x40))
            mstore(0x00,key2)
            let target := keccak256(0x00,0x40)
            sstore(target, value)



            // your code here
            // set the `value` for a `user` and a `token`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
