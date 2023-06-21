// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployOurToken} from "../script/DeployOurToken.s.sol";
import {OurToken} from "../src/OurToken.sol";

contract ourTokenTest is Test {
    OurToken public ourToken;
    DeployOurToken public deployer;

    address bob = makeAddr("Bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 1000 ether;

    function setUp() public {
        deployer = new DeployOurToken();
        ourToken = deployer.run();

        vm.prank(address(msg.sender));
        ourToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(ourToken.balanceOf(bob), STARTING_BALANCE);
    }

    function testAllowancesWorks() public {
        uint256 initialAllowance = 1000;

        // Bob allows Alice to spend tokens on her behalf
        vm.prank(bob);
        ourToken.approve(alice, initialAllowance);

        uint256 transderAmount = 500;

        vm.prank(alice);
        ourToken.transferFrom(bob, alice, transderAmount);
    }
}
