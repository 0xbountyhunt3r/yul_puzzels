// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract ReadFromDoubleMapping {
    mapping(address user => mapping(address token => uint256)) public balances;

    function setValue(address user, address token, uint256 value) external {
        balances[user][token] = value;
    }

    function main(address user, address token) external view returns (uint256) {
        assembly {

            let s := balances.slot
            let key_1 := token
            let key_2 := user

            mstore(0x00, key_2)
            mstore(0x20, s)

            let initial_hash := keccak256(0x00,0x40)

            mstore(0x00, key_1)
            mstore(0x20, initial_hash)

            let final_s := keccak256(0x00,0x40)

            let bal := sload(final_s)

            mstore(0x00,bal)
            return(0x00,0x20)

            // your code here
            // read and return the `token` balance of `user` in the double mapping `balances`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }
}
