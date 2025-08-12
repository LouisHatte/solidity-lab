```js
// Solidity is only one EVM language (90% mainnet)
// A second one would be Vyper

// Compilation process
file.sol -> solc compiler -> (code.bin, code.abi)

// Tx fields
nonce
gasPrice
gasLimit
to
value
data
v, r, s

// Setup the free memory pointer
0x00–0x3f = scratch space for hashing methods
0x40–0x5f = currently allocated memory size, aka free memory pointer
0x60-0x7f = zero slot
0x80 = allocated memory starts here

// Init code summary
// 1. Set up the free memory pointer (which wasn't used)
// 2. Cause a revert if wei was sent in the transaction
// 3. Set up storage locations with initial non-zero values
// 4. Return a pointer to the contract code and length of code to be stored on the blockchain

// Function execution summary
// 1. Set up the free memory pointer
// 2.1 Go through a jump table and jump to the correct function
// 2.2 If not, goes to fallback/receive
// 2.3 If not reverts
// 3. Get arguments with masks
// 4. Execute the function logic
// 5. Stop or return data

// Solidity Metadata

```
