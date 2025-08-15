// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {console2} from "forge-std/console2.sol";

interface IA {
    function f0(uint256 a, string calldata s) external pure returns (uint256);
}

contract A {
    function f0(uint256, /*a*/ string calldata /*s*/ ) external pure returns (uint256) {
        return 1;
    }
}

contract Hack {
    function callMe() external pure {
        uint256 a = 3;
        string memory s = "hello";
        bytes memory data = abi.encodeCall(IA.f0, (a, s));
        bytes memory data2 = abi.encodeWithSelector(IA.f0.selector, a);
        console2.logBytes(data);
        console2.logBytes(data2);
    }
}
