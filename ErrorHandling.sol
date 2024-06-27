// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandle {
    mapping(address => uint) public balances;

    function deposit(uint amount) public {
        balances[msg.sender] += amount;
    }

    function transfer(address to, uint amount) public {
        require(amount <= balances[msg.sender], "Insufficient balance");
        
        balances[msg.sender] -= amount;
        balances[to] += amount;

    }

    function divide(uint numerator, uint denominator) public pure returns (uint) {
        assert(denominator != 0);
        
        return numerator / denominator;
    }
    
    function withdraw(uint amount) public {
        if (amount > balances[msg.sender]) {
            revert("Insufficient balance");
        }
        
        balances[msg.sender] -= amount;
    }
}
