//SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

interface INZeraAdmin{
    function grant(address admin) external;

    function revoke(address admin) external;

    function isAdmin(address admin) external view returns(bool);

    function getAdmins() external view returns(address[] memory);
}