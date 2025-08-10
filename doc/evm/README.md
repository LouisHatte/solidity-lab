# EVM

## Opcodes

### Memories

```rust
// stack
PUSH0                   // place value 0 on stack
PUSH1,  ...,    PUSH32  // place x byte item on stack
DUP1,   ...,    DUP16   // duplicate xth stack item
SWAP1,  ...,    SWAP16  // exchange 1st and xth stack items
POP                     // remove 1st item from stack

// calldata
CALLDATALOAD            // msg.data
CALLDATASIZE            // length of msg.data
CALLDATACOPY            // copy msg.data in memory

// memory
MLOAD                   // load word from memory
MSTORE                  // save word to memory
MSTORE8                 // save byte to memory
MSIZE                   // size of active memory
MCOPY                   // copy memory in memory

// storage
SLOAD                   // load word from storage
SSTORE                  // save word to storage

// transient storage
TLOAD                   // load word from transient storage
TSTORE                  // save word to transient storage

// logs
LOG0,   ...,    LOG4    // append log record with x topics
```

### Operations

```rust
ADD         // a + b
MUL         // a * b
SUB         // a - b
DIV         // a // b (uint)
SDIV        // a // b (int)
MOD         // a % b (uint)
SMOD        // a % b (int)
ADDMOD      // (a + b) % c
MULMOD      // (a * b) % c
EXP         // a^b

AND         // a & b
OR          // a | b
XOR         // a ^ b
NOT         // ~a
SHL         // a << b
SHR         // a >> b (uint)
SAR         // a >> b (int)

SIGNEXTEND  // with 0x000000xx, if signBit(xx) == 0: 0x000000xx else 0xffffffxx
BYTE        // retrieve single byte from word
```

### Conditions

```rust
LT          // a < b (uint)
GT          // a > b (uint)
SLT         // a < b (int)
SGT         // a > b (int)
EQ          // a == b
ISZERO      // a == 0

PC          // current instrucion line number
JUMP        // jump at x to a jumpdest
JUMPI       // conditionnaly jump at x to a jumpdest
JUMPDEST    // jump or jumpi destination
```

### Functions

```rust
KECCAK256       // keccak256(bytes)
BLOCKHASH       // blockhash(address)
BLOBHASH        // blobhash(address)
GAS             // gasleft()

CREATE          // create a new account with associated code
CREATE2         // create a new account with associated code at a more predictable address

CALL            // {address}.call()
CALLCODE        // {address}.callcode(), deprecated: use DELEGATECALL
DELEGATECALL    // {address}.delegatecall()
STATICCALL      // {address}.staticcall()

RETURNDATASIZE  // data size returned by last CALL, CALLCODE, DELEGATECALL, STATICCALL
RETURNDATACOPY  // copy data returned by last CALL, CALLCODE, DELEGATECALL, STATICCALL in memory
```

### Halt execution

```rust
STOP            // stop execution
RETURN          // halt execution returning output data
REVERT          // halt execution reverting state changes but returning data and remaining gas
INVALID         // halt execution reverting state changes, but returning 0 and 0 gas, designated invalid instruction
SELFDESTRUCT    // halt execution and register account for later deletion or send all Ether to address
```

### Global values

```rust
ADDRESS         // address(this)
SELFBALANCE     // address(this).balance

ORIGIN          // tx.origin
GASPRICE        // tx.gasprice

CHAINID         // block.chainid
NUMBER          // block.number
TIMESTAMP       // block.timestamp
COINBASE        // block.coinbase (miner address)
PREVRANDAO      // block.prevrandao (random number)
GASLIMIT        // block.gaslimit
BASEFEE         // block.basefee
BLOBBASEFEE     // block.blobbasefee

BALANCE         // {address}.balance
CALLER          // msg.sender
CALLVALUE       // msg.value

CODESIZE        // address(this).code.length
CODECOPY        // copy address(this).code in memory
EXTCODESIZE     // {address}.code.length
EXTCODECOPY     // copy {address}.code in memory
EXTCODEHASH     // {address}.codehash == keccak256({address}.code)
```
