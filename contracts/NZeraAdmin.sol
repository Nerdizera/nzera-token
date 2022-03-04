//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./interfaces/INZeraAdmin.sol";

contract NZeraAdmin is INZeraAdmin{
    address[] private _admins;

    constructor(){
        _admins.push(msg.sender);
    }

    function grant(address admin) public override {
        require(exists(msg.sender), "Caller must be an admin");
        _admins.push(admin);
    }

    function revoke(address admin) public override{
        require(exists(msg.sender), "Caller must be an admin");
        require(admin != msg.sender, "Admin cannot revoke yourself");

        for(uint256 i = 0; i < _admins.length; i++){
            if(_admins[i] == admin){
                _admins[i] = address(0);
            }
        }
    }

    function isAdmin(address admin) public view override returns(bool){
        return exists(admin);
    }

    function getAdmins() public view override returns(address[] memory){
        return _admins;
    }

    function exists(address admin) private view returns(bool){
        for(uint256 i = 0; i < _admins.length; i++){
            if(_admins[i] == admin){
                return true;
            }
        }

        return false;
    }
}