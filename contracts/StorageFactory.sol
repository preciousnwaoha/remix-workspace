// SPDX-License-Identifier: MIT

// Imports, Composition, Intaracting with other Contracts, 

pragma solidity ^0.8.18;

import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public listOfSimpleStorageContracts;


    function creatSimpleStorageContract() public {
        SimpleStorage newSimpleStorage = new SimpleStorage();

        listOfSimpleStorageContracts.push(newSimpleStorage);
    }

    function sfStore(uint256 _index) public {
        // To interact with other contracts
        // You need Address and ABI - Application Binary Interface
        // Or the selector

        SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_index];
        mySimpleStorage.store(_index);

        
    }

    function sfGet(uint256 _index) public view returns(uint256) {
        return listOfSimpleStorageContracts[_index].retrieve();
    }
}