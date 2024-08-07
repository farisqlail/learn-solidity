// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//simple setter getter data
// contract SimpleStorage {
//     string public message;

//     function setMessage(string memory newMessage) public {
//         message = newMessage;
//     }

//     function getMessage() public view returns (string memory) {
//         return message;
//     }
// }

contract SimpleCounter {
    int private count;

    function setCount(int newCount) public {
        count = newCount;
    }

    function getCount() public view returns (int) {
        return count;
    }

    function increment() public {
        count += 1;
    }

    function decrement() public {
        count -= 1;
    }
}