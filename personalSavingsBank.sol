// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 <0.9.0;

contract SavingsBank
{
    function deposit() public payable
    {
        require(msg.value > 0, "Put some value to deposit");
    }
    function getBalance() public view returns(uint)
    {
       return address(this).balance; 
    }
    function withdraw(uint _amount) public
    {
        require(_amount > 0, "Amount must be greater than 0");
        require(address(this).balance>=_amount, "Insufficient Balance");

        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed.");
    }
}