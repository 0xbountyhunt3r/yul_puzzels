// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AbsoluteValue{

  function main(int256 x) external pure returns (uint256) {


      assembly {
          let sign_mask := shl(255,0x01)
          if slt(x,0) {
          let sign := slt(x,0)
          let mask := sub(0,sign)
          let abs_x := xor(add(x, mask), mask)

          mstore(0x00, abs_x)
          return(0x00,0x20)

          }

          mstore(0x00,x)
          return(0x00,0x20)
      }
  }
}
