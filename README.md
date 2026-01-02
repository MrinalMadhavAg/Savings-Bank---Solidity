
---

# SavingsBank Smart Contract

This contract implements a very simple shared private Ether vault. Users can deposit Ether into the contract, check the total contract balance, and withdraw Ether from it.

The contract does not track user-specific balances. All deposited Ether is stored in a single shared pool.

---

## Functions

### `deposit()`

Payable function that allows anyone to send Ether to the contract.

* Requires `msg.value > 0`
* The Ether sent is added to the contract’s balance

```solidity
require(msg.value > 0, "Put some value to deposit");
```

---

### `getBalance()`

Returns the total Ether held by the contract.

```solidity
return address(this).balance;
```

Returned value is in wei.

---

### `withdraw(uint _amount)`

Allows the caller to withdraw Ether from the contract balance.

* `_amount` must be greater than zero
* Contract must have enough balance
* Sends `_amount` to `msg.sender`

```solidity
(bool success, ) = payable(msg.sender).call{value: _amount}("");
require(success, "Transfer failed.");
```

---
