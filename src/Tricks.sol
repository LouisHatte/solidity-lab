// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {console2} from "forge-std/console2.sol";

interface IA {
    function read(uint256 index) external view returns (bytes32);
}

type Timestamp is uint40;

using {gt as >, isZero} for Timestamp global;

function gt(Timestamp t1, Timestamp t2) pure returns (bool) {
    return Timestamp.unwrap(t1) > Timestamp.unwrap(t2);
}

function isZero(Timestamp t) pure returns (bool) {
    return Timestamp.unwrap(t) == 0;
}

contract A {
    function read(uint256 index) external view returns (bytes32 content) {
        assembly {
            content := sload(index)
        }
    }
}
