# ErrorHandle Smart Contract

This Solidity program demonstrates the use of `require()`, `assert()`, and `revert()` with the help of three functions.

## Description

The `ErrorHandle` smart contract is designed to show how to handle errors in Solidity. It includes functions to deposit and withdraw tokens, transfer tokens between accounts, and divide numbers with error handling mechanisms to ensure the correct execution of operations.

## Getting Started

### Installing

1. Open your web browser and navigate to [Remix IDE](https://remix.ethereum.org/).

### Executing program

1. Create a new file named `ErrorHandle.sol` in the Remix IDE.
2. Copy and paste the following Solidity code into `ErrorHandle.sol`:

    ```solidity
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
    ```

3. Compile the contract:
    * In the Remix IDE, go to the "Solidity Compiler" tab on the left sidebar.
    * Click on the "Compile ErrorHandle.sol" button.

4. Deploy the contract:
    * Go to the "Deploy & Run Transactions" tab on the left sidebar.
    * Select "ErrorHandle" from the contract dropdown menu.
    * Click the "Deploy" button.

5. Interact with the deployed contract:
    * After deployment, you will see the deployed contract under "Deployed Contracts".
    * You can now interact with the functions `deposit`, `transfer`, `divide`, and `withdraw`.

    Step-by-step commands:
    ```sh
    // Deposit tokens
    instance.deposit({value: web3.utils.toWei('1', 'ether')});

    // Transfer tokens
    instance.transfer("recipient_address", web3.utils.toWei('0.5', 'ether'));

    // Divide numbers
    let result = await instance.divide(10, 2);
    console.log(result.toString()); // 5

    // Withdraw tokens
    instance.withdraw(web3.utils.toWei('0.5', 'ether'));
    ```

## Authors

AyushYadav  
harsh200520032@gmail.com

## License

This project is licensed under the [MIT] License - see the LICENSE.md file for details
