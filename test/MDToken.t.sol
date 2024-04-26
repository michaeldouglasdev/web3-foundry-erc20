// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;

//import {Test} from "lib/forge-std/src/Test.sol";
import {Test} from "forge-std/Test.sol";
import {DeployMDToken} from "../script/DeployMdToken.s.sol";
import {MDToken} from "../src/MDToken.sol";

contract MDTokenTest is Test {
    MDToken public mdToken;
    DeployMDToken public deployer;

    address bob = makeAddr("bob");
    address alice = makeAddr("alice");

    uint256 public constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployMDToken();
        mdToken = deployer.run();

        vm.prank(msg.sender);
        mdToken.transfer(bob, STARTING_BALANCE);
    }

    function testBobBalance() public {
        assertEq(STARTING_BALANCE, mdToken.balanceOf(bob));
    }

    function testAllowances() public {
        uint256 initialAllowances = 1000;

        // BOB approves Alice to spend tokens on her behalf
        vm.prank(bob);
        mdToken.approve(alice, initialAllowances);

        uint256 amount = 500;

        vm.prank(alice);
        mdToken.transferFrom(bob, alice, amount);

        assertEq(mdToken.balanceOf(alice), amount);
        assertEq(mdToken.balanceOf(bob), STARTING_BALANCE - amount);
    }
}
