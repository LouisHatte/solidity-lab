// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {console2} from "forge-std/console2.sol";

interface IA {
    function read(uint256 slot) external view returns (bytes32);
}

contract C {
    uint256 c = 1;
}

contract B is C {
    uint256 b = 2;
}

contract D {
    uint256 d = 3;
}

contract A is B, D {
    uint256 a1 = 4;

    function read(uint256 slot) external view returns (bytes32 data) {
        assembly {
            data := sload(slot)
        }
    }
}
