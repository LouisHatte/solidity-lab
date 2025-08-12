// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test, console2} from "forge-std/Test.sol";

import {A, IA} from "src/A.sol";

contract ATest is Test {
    IA a = IA(0x4A679253410272dd5232B3Ff7cF5dbB88f295319);

    function setUp() external {}

    function test_one() external {
        try new A() returns (A x) {
            x;
            // console2.log(x);
            // } catch Error(string memory reason) {
            // require(bool, string)
            // revert(string)
            // console2.log("Error");
            // console2.log(reason);
            // } catch Panic(uint256 errCode) {
            // assert(bool)
            // console2.log("Panic");
            // console2.log(errCode);
        } catch (bytes memory lowerLevelData) {
            // require(bool, error)
            // revert(error)
            console2.log("Low level");
            console2.logBytes(lowerLevelData);
        }
    }
}
