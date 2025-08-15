// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console2} from "forge-std/Test.sol";

import {A, Hack} from "src/Lab.sol";

contract LabTest is Test {
    A a;
    Hack hack;

    function setUp() external {
        a = new A();
        hack = new Hack();
    }

    function test_one() external view {
        hack.callMe();
    }
}
