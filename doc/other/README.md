# Cast

- From `boolean` to `T`, a condition is used for any `T`

- From `uintX` to `intY` has an intermediate `uintY`
- From `intX` to `uintY` has an intermediate `intY`

- From `bytesX` to `bytesY` has no intermediate

- From `bytesX` to `uintY` has an intermediate `uint{X * 8}`
- From `bytesX` to `intY` has an intermediate `uint{X * 8} -> int{X * 8}`

- From `uintX` to `bytesY` has an intermediate `uint{Y * 8}`
- From `intX` to `bytesY` has an intermediate `int{Y * 8} -> uint{Y * 8}`

- From `address` to `uint160` has no intermediate
- From `address` to `bytes20` has no intermediate

- From `contract A` to `interface IA` has an intermediate `address`

- Truncating `uintX` or `intX` loses leftmost bytes
- Truncating `bytesX` loses rightmost bytes

# Units

- `1 wei == 1`
- `1 gwei == 10^9 wei`
- `1 ether == 10^18 wei`

# Allocation Syntaxe

```solidity
// string
string memory s = "str";

// uint256[]
uint256[2] memory u;
uint256[] memory u2 = new uint256[](2);

// uint256[][]
uint256[][] memory u3 = new uint256[][](2);
for (uint256 i = 0; i < 2; ++i) {
    u3[i] = new uint256[](2);
}

// bytes
bytes memory b = hex"6869";
bytes memory b2 = new bytes(2);
b2[0] = 0x68;
b2[1] = 0x69;

// struct
S memory o = S({a: 1});
S memory o2 = S(1);

// custom type
T[] memory t = new T[](2);

// contract
A a = new A();
```

# Custom Type

```solidity
type Timestamp is uint40;

using {isZero, gt as >} for Timestamp global;

function isZero(Timestamp t) pure returns (bool) {
    return Timestamp.unwrap(t) == 0;
}

function gt(Timestamp t1, Timestamp t2) pure returns (bool) {
    return Timestamp.unwrap(t1) > Timestamp.unwrap(t2);
}
```

# Other

4 types of memory:

- calldata (input)
- memory (during function call)
- storage (saved on the blockchain)
- transient storage (during function call with storage properties)
