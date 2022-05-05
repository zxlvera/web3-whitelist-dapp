
//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Whitelist {

    // Max number of whitelisted addresses allowed
    uint8 public maxWhitelistedAddresses;

    // if address is whitelisted, set to true
    mapping(address => bool) public whitelistedAddresses;

    // numAddressWhiteListed to keep track of how many addresses have been
    // whitelisted
    uint8 public numAddressWhitelisted;

    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
            require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
            require(numAddressWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");
            whitelistedAddresses[msg.sender] = true;
            numAddressWhitelisted += 1;
        }

}
