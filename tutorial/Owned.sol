// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Owned {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not allowed.");
        _;
    }
}