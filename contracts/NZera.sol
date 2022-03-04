//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

import "./interfaces/INZera.sol";
import "./NZeraAdminModifier.sol";

contract NZera is INZera, NZeraAdminModifier, ERC20{
    constructor(address adminContractAddress) 
    NZeraAdminModifier(adminContractAddress) 
    ERC20("Nerdzera Token", "NZERA"){

    }

    function mint(address account, uint256 amount) public onlyAdmin override {
        require(account != address(0), "Account address is invalid");
        require(amount > 0, "Amount must be greater than 0");
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) public onlyAdmin override {
        require(account != address(0), "Account address is invalid");
        require(amount > 0, "Amount must be greater than 0");
        _burn(account, amount);
    }
}