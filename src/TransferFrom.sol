// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract TransferFrom {
    address owner;
    address token;

    constructor(address _token) {
        owner = msg.sender;
        token = _token;
    }

    function main(uint256 amount) external {
        assembly {
            // your code here
            // transferFrom "token" to msg.sender "amount"
            // assume that you are already approved to spend "amount"
            // hint: you will need to sload the address of the token
            // hint: transferFrom has function selector 0x23b872dd and signature "transferFrom(address,address,uint256)"
            let receiver := address()
            let sndr := sload(0x00)
            let tkn := sload(0x01)
    

            mstore(0x00,shl(224,0x23b872dd))
            mstore(0x04,sndr)
            mstore(0x24,receiver)
            mstore(0x44,amount)

            let res := call(gas(), tkn, 0, 0x00,100,0,0)

        }
    }
}

