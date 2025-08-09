// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console2} from "forge-std/Test.sol";

import {A, IA} from "src/Tricks.sol";

contract TricksTest is Test {
    IA a = IA(0xB7f8BC63BbcaD18155201308C8f3540b07f84F5e);

    function setUp() external {}

    function test_a() external view {
        uint256 a = 0;
        uint256 b = 1;
        console2.log(b / a);
    }
}
