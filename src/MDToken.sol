// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract MDToken is ERC20 {
    constructor(uint256 _initialSupply) ERC20("MD Token", "MD") {
        _mint(msg.sender, _initialSupply);
    }
}
