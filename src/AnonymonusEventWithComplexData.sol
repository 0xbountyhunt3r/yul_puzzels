// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract AnonymonusEventWithComplexData {
    enum Gender {
        Male,
        Female,
        Trans
    }

    struct Person {
        string name;
        uint256 age;
        Gender gender;
    }

    // EMIT ME!!!
    event MyEvent(address indexed emitter, bytes32 indexed id, Person person);

    function main(address emitter, bytes32 id, Person memory person) external {
        assembly {
            let person_data_ofs := calldataload(0x44)
            let struct_base_ptr := add(0x04, person_data_ofs)

            let name_relative_ofst := calldataload(struct_base_ptr)
            let age := calldataload(add(struct_base_ptr, 0x20))
            let gender := calldataload(add(struct_base_ptr, 0x40))
            // name itself is an offset to the length and data of the stirng

            let name_data_ptr := add(struct_base_ptr, name_relative_ofst)
            let name_len := calldataload(name_data_ptr)
            let name := calldataload(add(name_data_ptr, 0x20))
            // your code here
            // emit the `MyEvent(address,bytes32,(string,uint256,uint8))` event.

            // Anonymous events don't have the event signature (topic0) included.
            // Hint: how the `Person` struct is encoded in mem:
            //          - string offset
            //          - string length offset
            //          - age
            //          - gender
            //          - name length
            //          - name
            
         //   log3(0x00,0x20,0x00,emitter,id)

          mstore(0x00, 0x20) // <- offset to struct data
          mstore(0x20,0x60) //
          mstore(0x40, age)
          mstore(0x60, gender)
          mstore(0x80, name_len)
          mstore(0xa0, name)

          log3(0x00, 0xC0, 0x0, emitter, id)

        }
    }
}
