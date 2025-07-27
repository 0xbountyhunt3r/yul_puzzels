// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract BasicBank {
    // emit these
    event Deposit(address indexed depositor, uint256 amount);
    event Withdraw(address indexed withdrawer, uint256 amount);

    error InsufficientBalance();

    mapping(address => uint256) public balances;

    function deposit() external payable {
        bytes32 depositSelector = Deposit.selector;
        assembly {
            let s := balances.slot
            let sender := caller()

            let amount := callvalue()
            mstore(0x00, sender)
            mstore(0x20, s)

            let write_slt := keccak256(0x00, 0x40)
            let bal_before := sload(write_slt)
            let bal_after := add(bal_before, amount)
            sstore(write_slt, bal_after)

            mstore(0x00, amount)
            log2(0x00, 0x20, depositSelector, sender)
            // emit Deposit(msg.sender, msg.value)
            // increment the balance of the msg.sender by msg.value
        }
    }

    function withdraw(uint256 amount) external returns (uint256 bal) {
        bytes32 withdrawSelector = Withdraw.selector;
        bytes4 insufficientBalanceSelector = InsufficientBalance.selector;
        assembly {
            let s := balances.slot
            let sender := caller()

            mstore(0x00, sender)
            mstore(0x20, s)

            let write_slt := keccak256(0x00, 0x40)
            let b := sload(write_slt)

            if gt(amount, b) {
                mstore(0x00, insufficientBalanceSelector)
                revert(0x00, 0x04)
            }

            let new_bal := sub(b, amount)
            sstore(write_slt, new_bal)

            mstore(0x00, amount)
            log2(0x00, 0x20, withdrawSelector, sender)

            mstore(0x00, new_bal)
            return(0x00, 0x20)
            // emit Withdraw(msg.sender, amount)
            // if the balance is less than amount, revert InsufficientBalance()
            // decrement the balance of the msg.sender by amount
            // send the amount to the msg.sender
        }
    }
}
