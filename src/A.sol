// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {console2} from "forge-std/console2.sol";

interface IA {
    error A_Err(uint256 x);

    function isOne(uint256 x) external pure returns (bool);
}

contract A {
    error A_Err(uint256 x);

    function isOne(uint256 x) external pure returns (bool) {
        if (x == 1) {
            return true;
        } else if (x == 2) {
            require(x != 2, "this is a require error");
        } else if (x == 3) {
            require(x != 3, A_Err(x));
        } else if (x == 4) {
            revert("this is a revert error");
        } else if (x == 5) {
            revert A_Err(x);
        } else if (x == 6) {
            assert(x != 6);
        } else {
            uint8 u0 = 255;
            uint8 u1 = 1;
            uint8 u2 = u0 + u1;
            u2;
        }
        return false;
    }
}
