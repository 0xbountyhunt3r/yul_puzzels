// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract PushToDynamicArray {
    uint256[] pushToMe = [23, 4, 19, 3, 44, 88];

    function main(uint256 newValue) external {
        assembly {
            
            let curr_len := sload(pushToMe.slot)
            let new_len := add(curr_len,1)
            sstore(pushToMe.slot, new_len)

            mstore(0x00,pushToMe.slot)
            let data_start := keccak256(0x00,0x20)

            let target_ := add(data_start,curr_len)

            sstore(target_, newValue)
            // your code here
            // push the newValue to the dynamic array `pushToMe`
            // Hint: https://www.rareskills.io/post/solidity-dynamic
        }
    }

    function getter() external view returns (uint256[] memory) {
        return pushToMe;
    }
}
