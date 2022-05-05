// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

contract Ownable {
    address payable _owner;

    constructor() {
        _owner = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(isOwner(), "You are not the owner!");
        _;
    }

    function isOwner() public view returns(bool) {
        return (msg.sender == _owner);
    }
}