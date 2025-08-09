# EVM

## Opcodes

```js
STOP    // stop execution

PUSH0                   // place value 0 on stack
PUSH1,  ...,    PUSH32  // place x byte item on stack
DUP1,   ...,    DUP16   // duplicate xth stack item
SWAP1,  ...,    SWAP16  // exchange 1st and xth stack items

ADD     // a + b
MUL     // a * b
SUB     // a - b
DIV     // a // b (uint)
SDIV    // a // b (int)
MOD     // a % b (uint)
SMOD    // a % b (int)
ADDMOD  // (a + b) % c
MULMOD  // (a * b) % c
EXP     // a^b

LT      // a < b (uint)
GT      // a > b (uint)
SLT     // a < b (int)
SGT     // a > b (int)
EQ      // a == b
ISZERO  // a == 0

AND     // a & b
OR      // a | b
XOR     // a ^ b
NOT     // ~a

KECCAK256 //
```

SIGNEXTEND

BYTE
SHL
SHR
SAR

KECCAK256
ADDRESS
ORIGIN
CALLER
CALLVALUE

CALLDATALOAD
CALLDATASIZE
CALLDATACOPY

CODESIZE
CODECOPY
GASPRICE

EXTCODESIZE
EXTCODECOPY

RETURNDATASIZE
RETURNDATACOPY

EXTCODEHASH
BLOCKHASH
COINBASE
TIMESTAMP
NUMBER
PREVRANDAO
GASLIMIT
CHAINID
SELFBALANCE
BASEFEE
BLOBHASH
BLOBBASEFEE

POP
MLOAD
MSTORE
MSTORE8
SLOAD
SSTORE

JUMP
JUMPI

PC

MSIZE
GAS
JUMPDEST

TLOAD
TSTORE

MCOPY

LOG0
LOG1
LOG2
LOG3
LOG4

CREATE
CALL
CALLCODE

RETURN
DELEGATECALL

CREATE2
STATICCALL

REVERT
INVALID

SELFDESTRUCT
