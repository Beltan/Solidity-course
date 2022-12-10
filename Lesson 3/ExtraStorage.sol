// SPDX-License-Identifier: MIT

pragma solidity 0.8.7;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage {

    // To modify a function you need the keyword override and mark the original function with virtual
    function store(uint256 _favoriteNumber) public override {
        favoriteNumber = _favoriteNumber + 5;
    }
}