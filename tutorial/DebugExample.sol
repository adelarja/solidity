// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract MyContract {
    string public myString = "Hello world!";
}

contract DebuggerExample {
    uint public myUint;

    function setMyUint(uint _myuint) public {
        myUint = _myuint;
    }
}