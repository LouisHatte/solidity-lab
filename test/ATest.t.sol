// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console2} from "forge-std/Test.sol";

import {A, IA} from "src/A.sol";

contract ATest is Test {
    IA a = IA(0x4A679253410272dd5232B3Ff7cF5dbB88f295319);

    function setUp() external {}

    function test_one() external {}
}
