// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

contract ManualToken {
    mapping(address => uint256) private s_balances;
    function name() public pure returns (string memory) {
        return "Manual Token";
    }

    function totalSupply() public pure returns (uint256) {
        return 100 ether;
    }

    function decimals() public pure returns (uint8) {
        return 18;
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }
}
