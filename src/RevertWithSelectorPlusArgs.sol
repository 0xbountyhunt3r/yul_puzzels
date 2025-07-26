// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract RevertWithSelectorPlusArgs {
    error RevertData(uint256); // selector: 0xae412287

    function main(uint256 x) external pure {
        uint256 y = x;

        bytes4  selector = RevertData.selector;
        assembly {
     
            mstore(0x00, selector)
            mstore(0x04, y)
            revert(0x00, 0x24)
        }
    }
}
