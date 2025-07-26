// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelector {
    error RevertData(); // selector: 0xa3b7e096

    function main() external pure {

        bytes32 selector = bytes32(abi.encodeWithSignature("RevertData()"));
        assembly {
          
            mstore(0x00, selector)
            revert(0x00, 0x04)
        }
    }
}
