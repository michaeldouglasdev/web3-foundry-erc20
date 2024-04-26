// SPDX-License-Identifier: MIT

pragma solidity 0.8.20;
import {Script} from "forge-std/Script.sol";
import {MDToken} from "../src/MDToken.sol";

contract DeployMDToken is Script {
    uint256 public constant INITIAL_SUPPLY = 1000 ether;

    function run() public returns (MDToken) {
        vm.startBroadcast();
        MDToken token = new MDToken(INITIAL_SUPPLY);
        vm.stopBroadcast();

        return token;
    }
}
