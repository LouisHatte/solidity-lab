```js
// ABI-Related Functions
abi.decode()
abi.encode()
abi.encodePacked()
abi.encodeWithSelector()
abi.encodeWithSignature()
abi.encodeCall()

// Members of bytes / string
bytes.concat()
string.concat()

// Members of address
address.balance
address.code
address.codehash
address.call()
address.delegatecall()
address.staticcall()
address.send()
address.transfer()

// Cryptographic & Math Utilities
keccak256()
sha256()
ripemd160()
ecrecover()
addmod()
mulmod()

// Other Functions
blockhash()
blobhash()
gasleft()
selfdestruct()

// Type Information
type(C).name
type(C).creationCode
type(C).runtimeCode
type(I).interfaceId
type(T).min
type(T).max

// Error Handling
error
require()
revert()
assert()

// Events
event, emit, indexed, anonymous

// Block & Transaction Properties
block.number
block.timestamp
block.prevrandao
block.basefee
block.gaslimit
block.coinbase
block.chainid
block.blobbasefee
msg.data
msg.sender
msg.sig
msg.value
tx.origin
tx.gasprice

// Data Types
bool
address / address payable
uint / uint8 ... uint256
int / int8 ... int256
bytes1 ... bytes32
bytes
string
type
struct
enum
mapping

// Core Structure
pragma
import, as, from
using, for, global
contract, interface, library
abstract, is
function, modifier,
constructor, fallback, receive

// Decorartors
external, public, private, internal
pure, view, payable
virtual, override
returns

// Memories
constant, immutable
calldata, memory, storage

// Control Flow
if, else
for, while, do, continue, break
try, catch, Error, Panic
return

// Other keywords
this, super
new, delete
unchecked

// Assembly
assembly, let, function, leave, switch, case, default, for, if, break, continue
```
