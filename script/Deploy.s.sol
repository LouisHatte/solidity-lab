// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Script} from "forge-std/Script.sol";

import {A} from "src/A.sol";

contract Deploy is Script {
    function run() external returns (A a) {
        vm.startBroadcast();
        a = new A();
        vm.stopBroadcast();
    }
}
