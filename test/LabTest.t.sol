// SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
pragma abicoder v2;

import {Test, console2} from "forge-std/Test.sol";
import {Reentrancy, A} from "../src/Lab.sol";

contract LabTest is Test {
    A a;

    function setUp() external {
        a = new A();
    }

    function test_one() external view {
        console2.log(uint256(a.getStorageValue(0)));
    }
}
