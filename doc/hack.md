# Hack

## Attacks

### Access Control

An access-control attack exploits missing or flawed authorization—mis-set owners, unchecked roles, or proxy/delegatecall context—to execute privileged actions (mint, withdraw, upgrade).

### Price Oracle Manipulation (?)

A price-oracle manipulation attack falsifies an asset’s on-chain price—e.g., by moving thin-liquidity DEX pools or flash-spiking TWAPs—causing mispriced swaps, loans, or liquidations to siphon value.

### Logic Errors

Logic errors, also known as business logic vulnerabilities, are subtle flaws in smart contracts. They occur when the contract's code does not match its intended behavior.

### Lack of Input Validation

Lack of input validation lets attackers pass malformed or out-of-range params to break invariants, bypass logic, or cause DoS.

### Reentrancy

Reentrancy is when an external call re-enters a contract before it finishes, exploiting inconsistent state, often to call the same function again and drain funds.

### Unchecked External Calls

Unchecked external calls refer to a security flaw where a contract makes an external call to another contract or address without properly checking the outcome of that call.

### Flash Loan Attacks (?)

A flash-loan attack uses uncollateralized, atomic loans to gain huge temporary capital and manipulate protocol state in one transaction—e.g., skew oracles/AMMs, bypass collateral checks, or pair with reentrancy.

### Integer Overflow and Underflow

An overflow/underflow attack exploits integer wraparound when values exceed bounds and loop, letting attackers manipulate balances or bypass checks.

### Insecure Randomness

A randomness attack exploits predictable or manipulable on-chain "randomness" (timestamps, blockhash/prevrandao, oracles) to bias lotteries, mints, or draws.

### Denial of Service

A denial-of-service attack makes a contract unusable by exhausting gas, locking state, or forcing critical calls to revert so others can’t execute.

### Timestamp Dependance

A block-timestamp attack exploits miners/validators nudging block.timestamp to bias time-dependent logic (lotteries, auctions, vesting) or pseudo-randomness that relies on timestamps.

### Front-running (?)

A front-running attack exploits the public mempool: a bot/validator reorders or inserts txs to execute before/around a victim’s trade (e.g., sandwich buy-then-sell) and capture profit.

### Signature replay

A signature replay attack reuses a previously valid signature in a new context. (different tx/chain/time) to repeat an action.

## Keywords

```js
pragma solidity <0.8.0;

// CEI

abi.encodePacked();
address.call();
address.delegatecall();
address.send();
address.transfer();

IA(address);

ecrecover();

blockhash();
blobhash();
gasleft();
selfdestruct();

require();
revert();
assert();

block.number;
block.timestamp;
block.prevrandao;
block.coinbase;
msg.data;
msg.sender;
msg.value;
tx.origin;

modifier;
fallback;
receive;

external;
public;
payable;

for;
unchecked;

assembly;

is;
```
