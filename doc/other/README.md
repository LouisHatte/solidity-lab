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

# Errors

- `require` use `REVERT` opcode, refund gas, used for simple checks
- `revert`, use `REVERT` opcode, refund gas, used for complex checks
- `assert` use `REVERT` opcode, refund gas, used for bug detection

# Events

- `event E() anonymous`, use `LOG0` opcode (0 topic)
- `event E()`, use `LOG1` opcode (1 topic: `keccak256("E()")`)
- `event E(indexed)` use `LOG2` opcode (2 topics)
- `event E(indexed, indexed)` use `LOG3` opcode (3 topics)
- `event E(indexed, indexed, indexed)` use `LOG4` opcode (4 topics)

# Send Ether

- `call`, forward `x gas`, `return (bool success, bytes memory data)`
- `send`, vulnerable, forward `2300 gas` only, `return (bool success)`
- `transfer`, vulnerable, forward `2300 gas` only, `revert` on failure

# fallback & receive

# Inheritance

- constructor?
- storage layout?
- virtual contract?
- override, virtuale?

# Interface

```solidity
// can inherit interfaces only
interface IA is IB {
    struct Struct {
        uint256 u;
    }
    enum Enum { Status0 }
    event Event(address indexed from, uint256 value) anonymous;
    error Err(address a);

    // functions must be external
    function f1(address a) external returns (uint256);
    function f2() external pure;
    function f3() external view;
    function f4() external payable;
}
```

# Library

```solidity
// can't inherit
library L {
    uint256 constant A = 1;
    // can't declare immutable variables
    // can't declare state variables

    struct Struct {
        uint256 u;
    }
    enum Enum { State0 }
    event Event();
    error Err();

    modifier m() {
        _;
    }

    // can't define constructor
    // can't define receive
    // can't define fallback

    function f1() external {}
    function f2() public {}
    // WARNING: in a library, an internal function gets inlined into contracts using it
    // So internal library functions are callable by any contract
    function f3() internal {}
    function f4() private {}

}
```

# Contract

```solidity
interface IA {}
contract B {}
abstract contract C {}

// can inherit interfaces, contracts and abstract contracts
contract A is IA, B, C {}
```
