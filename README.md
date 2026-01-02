
---

## SavingsBank — Solidity Smart Contract

This contract allows users to deposit Ether into the contract, while only the contract owner is allowed to withdraw funds. It includes basic validation to prevent invalid deposits and withdrawals and demonstrates ownership-based access control in Solidity.

---

## Overview

The contract accepts deposits by anyone through the `deposit` function and stores the funds in the contract balance. The `withdraw` function allows only the owner to withdraw a specified amount. Anyone can view the contract balance using `getBalance`.


---

## Ownership Logic

Ownership is assigned when the contract is deployed.

```solidity
owner = msg.sender;
```

The account that deploys the contract becomes the owner.

The `onlyOwner` modifier restricts certain functions:

```solidity
modifier onlyOwner() {
    require(msg.sender == owner, "Only owner can use this function");
    _;
}
```

How it works:

1. When a function marked with `onlyOwner` is called, the modifier runs first.
2. It checks whether `msg.sender` is the owner.
3. If the caller is not the owner, the transaction reverts.
4. If the caller is the owner, execution continues at `_`.

This ensures that only the owner can perform actions such as withdrawing funds.

---

## Functions

### `deposit() public payable`

Allows anyone to deposit Ether into the contract.
Requires `msg.value` to be greater than zero.

### `getBalance() public view`

Returns the total Ether currently stored in the contract.

### `withdraw(uint _amount) public onlyOwner`

Allows only the owner to withdraw a specified amount of Ether.

Validation checks include:

* The withdrawal amount must be greater than zero.
* The contract must have sufficient balance.
* The transfer must complete successfully.

Funds are transferred to the owner using:

```solidity
(bool success, ) = owner.call{value: _amount}("");
require(success, "Transfer failed.");
```

---

## Key Points

* Ownership is assigned at deployment and tied to the deploying address.
* Only the owner can withdraw funds.
* Anyone can deposit Ether.
* The contract balance is publicly viewable.
* Ether transfers include success verification.

---

