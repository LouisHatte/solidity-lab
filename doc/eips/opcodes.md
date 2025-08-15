# Opcodes

## EIP-6: SUICIDE renamed by SELFDESTRUCT

- Rename `SUICIDE` opcode references to `SELFDESTRUCT`.
- Reduce harmful connotations; make language more inclusive for developers.

## EIP-7: DELEGATECALL added

- Introduce `DELEGATECALL`, preserving original `msg.sender` and `msg.value`.
- Run library code in caller’s storage context without transferring value.

## EIP-140: REVERT added

- Add `REVERT` to roll back state and return error data without burning remaining gas.
- Provide explicit, efficient failures instead of opaque, gas-wasting invalid-opcode aborts.

## EIP-141: INVALID added

- Designate opcode `0xfe` as permanent `INVALID` to abort execution.
- Ensure a consistent, reserved abort opcode for tooling and intentional termination.

## EIP-145: SHL, SHR, SAR added

- Add `SHL`, `SHR`, `SAR` bitwise shift opcodes to the EVM.
- Provide efficient, low-gas shifts versus costly arithmetic emulation.

## EIP-211: RETURNDATASIZE RETURNDATACOPY

- Introduce a return-data buffer accessible via `RETURNDATASIZE` and `RETURNDATACOPY`.
- Copy variable-length results simply; avoid expensive two-call size probing and forwarding hacks.

## EIP-214: STATICCALL added

- Add `STATICCALL` to invoke contracts while forbidding any state changes, including in subcalls.
- Enable secure read-only calls so callers can assume state remains unchanged.

## EIP-1014: CREATE2 added

- Add `CREATE2` to deploy contracts at deterministic addresses using a salt and init code hash.
- Enable counterfactual interactions and address precomputation for state channels and deployments.

## EIP-1052: EXTCODEHASH added

- Introduce `EXTCODEHASH` returning the keccak256 hash of a contract’s bytecode.
- Provide cheaper code fingerprinting than EXTCODECOPY for whitelisting or verification.

## EIP-1153: TLOAD, TSTORE added

- Add `TLOAD` and `TSTORE` for per-transaction storage that auto-clears after the transaction ends.
- Cheap, safe inter-call communication (e.g., reentrancy locks) without costly `SSTORE`, `SLOAD`.

## EIP-1344: CHAINID

- Add `CHAINID` opcode returning current chain's `EIP-155` identifier.
- Enable in-contract anti-replay checks for signatures, especially `EIP-712` and Layer 2 schemes.

## EIP-1884: Opcode repricing + SELFBALANCE added

- Raise gas costs for certain opcodes; add `SELFBALANCE` to get contract’s own balance efficiently.
- Price operations fairly, reduce attack vectors, and stabilize block processing times.

## EIP-3198: BASEFEE added

- Add `BASEFEE` opcode `0x48` returning the current block’s base fee.
- Enable dynamic, gas-aware pricing for bounties, gas futures, and fraud-proof challenge timing.

## EIP-3855: PUSH0 added

- Add `PUSH0` `0x5f` opcode that pushes constant zero onto the EVM stack.
- Reduce code size and deployment/runtime gas; discourage zero-hacks.

## EIP-4399: DIFFICULTY replaced with PREVRANDAO

- Replace `DIFFICULTY` with `PREVRANDAO`, returning beacon-chain randomness post-PoS.
- Enable in-protocol randomness and backward compatibility after the Merge; detect PoS via value threshold.

## EIP-5656: MCOPY added

- Add `MCOPY` opcode for efficient memory-to-memory copying with arbitrary offsets/lengths.
- Cut gas and complexity for copies.

## EIP-6049: SELFDESTRUCT deprecation notice

- Deprecate `SELFDESTRUCT`; discourage use; breaking changes likely in future forks.
- Strong consensus to change semantics; warn developers and enable smoother migration.

## EIP-6780: SELFDESTRUCT semantics restricted

- Redefine `SELFDESTRUCT` to only transfer ETH; deletion allowed only during the creating transaction.
- Verkle trees hinder code/storage removal.

## EIP-7516: BLOBBASEFEE added

- Add `BLOBBASEFEE` `0x4a` opcode returning the current block’s blob base fee per `EIP-4844`.
- Let contracts price/settle blob data costs; enable rollup accounting and blob gas futures.
