//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./interfaces/INZeraAdmin.sol";

contract NZeraAdminModifier{
    address _adminContractAddress;

    constructor(address adminContractAddress){
        _adminContractAddress = adminContractAddress;
    }

    modifier onlyAdmin{
        INZeraAdmin adminContract = INZeraAdmin(_adminContractAddress);
        require(adminContract.isAdmin(msg.sender), "Only admins are allowed to call this method");
        _;
    }
}