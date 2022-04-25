// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/contracts/utils/math/SafeMath.sol";

contract Owned {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "you are not allowed");
        _;
    }

}

contract Wallet is Owned {
    mapping(address => uint) public availableFunds;

    using SafeMath for uint;

    modifier onlyIfFunds(uint _amount) {
        require(availableFunds[msg.sender] >= _amount, "Not enough funds");
        _;
    }

    function receiveMoney() public payable onlyOwner {
        availableFunds[msg.sender].add(msg.value);
    }

    function sendMoney(address _to, uint _amount) public payable onlyOwner onlyIfFunds(_amount) {
        availableFunds[_to].add(_amount);
        availableFunds[msg.sender].sub(_amount);
    }

    function transferMoney(address _to, uint _amount) public payable onlyIfFunds(_amount) {
        availableFunds[_to].add(_amount);
        availableFunds[msg.sender].sub(_amount);
    }
    
    function withdrawMoney(uint _amount) public onlyIfFunds(_amount) {
        payable(msg.sender).transfer(_amount);
        availableFunds[msg.sender].sub(_amount);
    }

    receive() external payable {
        receiveMoney();
    }
}