// SPDX-License-Identifier: MIT

// Send ETH, revert, 

pragma solidity ^0.8.20;

import {PriceConverter} from "./PriceConverter.sol";
/*
* Nounce: tx count
* Gas Price: price per uint gas (in wei)
* Gas Limit: 21000
* To: address the tx is sent to
* Value: amount of wei to send
* Data: empty
* v, r, s: components of tx signature
*/

error NotOwner();

contract FundMe {
    using PriceConverter for uint256;

    uint public constant MINIMUM_USD = 5e18;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;

    constructor () {
        i_owner = msg.sender;
    }

    

    function fund() payable public {
        require(msg.value.getConversionRate() >= MINIMUM_USD, "Sender is not owner"); // This call revert
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

   

    /*
    *
    */
    function withdraw() public  onlyOwner {
        for (uint256 fundersIndex = 0; fundersIndex < funders.length; fundersIndex++) {
            address funder = funders[fundersIndex];
            addressToAmountFunded[funder] = 0;
        }

        // reset the array
        funders = new address[](0);

        // transfer
        /*
        * payable(msg.sender).transfer(address(this).balance);
        * Note: (2300 gas, throws error)
        */

        // send
        /*
        * bool sendSuccess = payable(msg.sender).send(address(this).balance);
        * require(sendSuccess, "Send failed");
        * Note: (2300 gas, returns bool)
        */

        // call -  
        /*
        * @returns: (bool sendSuccess, bytes dataReturned) 
        * Note: (transfers all gas or set gas, returns bool)
        */
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
    }

    modifier onlyOwner() {
        // require(msg.sender == i_owner, "Must be owner");
        if (msg.sender != i_owner) { 
            revert NotOwner(); // saves more gas than the require
        }
        _;
    }

    /* WHEN SOMEONE SENDS ETH TO THIS CONTRACT
    * WITHOUT CALLING FUND FUNCTION!
    */
    // call with data
    // fallback (bytes calldata input) external [payable] returns (bytes memory output)
    fallback () external payable  {
        fund();
    }

    // call with no data
    receive() external payable {
        fund();
    }

}