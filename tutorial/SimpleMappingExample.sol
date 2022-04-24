// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract SimpleMappingExample {
    mapping(uint => bool) public myMapping;
    mapping(address => bool) public myAddressMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAdressTotTrue() public {
        myAddressMapping[msg.sender] = true;
    }
}

