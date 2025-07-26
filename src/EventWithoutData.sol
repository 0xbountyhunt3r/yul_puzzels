// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity ^0.8.13;

contract EventWithoutData {
    // EMIT ME!!!
    event MyEvent();

    function main() external {

        
    bytes32 eventSig = bytes32(keccak256("MyEvent()"));
        assembly {
            // your code here
            // emit the `MyEvent()` event
            // use `log1` to emit the event with one topic, which is the event's signature hash
            // Hint: Calculate the event signature hash using `keccak256("MyEvent()")`
            log1(0, 0, eventSig)

            // The event hash serves as `topic0` in the log


        }
    }
}
