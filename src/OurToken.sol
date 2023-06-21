// contracts/OurToken.sol
// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title OurToken
 * @dev Implementation of the OurToken ERC20 token.
 */
contract OurToken is ERC20 {
    /**
     * @dev Constructor that initializes the initial supply of tokens and assigns
     * them to the contract deployer.
     * @param initialSupply The initial supply of tokens.
     */
    constructor(uint256 initialSupply) ERC20("OurToken", "OT") {
        _mint(msg.sender, initialSupply);
    }
}