// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
contract VM{
    address public owner; // address
    mapping(address => uint) public donarBalances;
    constructor(){
         owner=msg.sender; // global variable or it is basically used for the person who is deploying smart contract
         donarBalances[address(this)]=100;
   }
   function getvendingMachineBalance() public view returns (uint){
       return donarBalances[address(this)];
   }
   function restock(uint amount) public {
       require(msg.sender==owner,"you are not owner");
       donarBalances[address(this)]+=amount;
   }
   function purchase(uint amount) public payable{
       require(msg.value>=amount * 2 ether,"you must pay at least 2 ether to donut");
       require(donarBalances[address(this)]>=amount,"not enough donuts");
       donarBalances[address(this)]-=amount;
       donarBalances[msg.sender]+=amount;
   }
}
