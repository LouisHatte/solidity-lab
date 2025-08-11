// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console2} from "forge-std/Test.sol";

import {A, IA} from "src/Tricks.sol";

contract TricksTest is Test {
    IA a = IA(0x9A9f2CCfdE556A7E9Ff0848998Aa4a0CFD8863AE);

    function setUp() external {}

    function test_a() external view {
        console2.logBytes32(a.read(0));
        console2.logBytes32(a.read(1));
        console2.logBytes32(a.read(2));
        console2.logBytes32(a.read(3));
        console2.logBytes32(a.read(4));
    }
}
