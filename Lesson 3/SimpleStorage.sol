// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;
// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {

    /*  This gets initialized to 0
        Visibilities: internal, external, public, private
        The default visibility is internal
        Types: bool, int, uint, address, bytes 
    */
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }

    // Types view and pure do not use gas unless they are called from a function that costs gas
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    /* In Solidity, data can be stored in 6 different places, 3 of them can be variables:
        - Stack
        - Memory -> Only exists temporaly
        - Storage -> Exists outside of the function
        - Calldata -> Only exists temporaly, cannot be modified
        - Code
        - Logs

        The variables that are arrays, structs or mappings need a keyword that specifies where it is being saved.
        A string is an array of bytes -> Needs a keyword.
    */
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}