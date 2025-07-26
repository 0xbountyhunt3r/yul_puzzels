// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract KeccakSecondCalldata {
    function main(uint256, uint256, uint256) external pure returns (bytes32) {
        assembly {
            let arg := calldataload(0x24)
            mstore(0x00,arg)
            let res := keccak256(0x00,0x20)
            mstore(0x00,res)
            return(0x00,0x20)
            // your code here
            // return the keccak hash of the SECOND argument in the calldata
            // Hint: use keccak256(offset, size)
            // solve KeccakFirstCalldata before this problem
        }
    }
}
