// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract SimpleStorage {
    uint256 myFavoriteNumber;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }

    Person[] public listOfPeople;

    mapping(string => uint256) public nameToFavoriteNumber;

    function addPerson(string memory _name, uint256 _favNum) public {
        // Person storage newPerson = ;

        listOfPeople.push(Person( _favNum, _name));
        nameToFavoriteNumber[_name] = _favNum;
    }

    function store(uint256 _num) public virtual {
        myFavoriteNumber = _num;
    }

    function retrieve() view public returns(uint256) {
        return myFavoriteNumber;
    }

}