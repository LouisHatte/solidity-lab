# Storage

- Storage variables can be `private`, `internal`, or `public`, not `external`
- `mapping` can only be used in storage
- Length of dynamic types can be determined and changed at runtime

## String <= 31 bytes || Bytes <= 31 bytes

```solidity
// s.length:    slot 0, uint8(bytes1(slotValue << (31 * 8))) / 2
// s[0]:        slot 0, bytes1(slot0 << (0 * 8))
// s[1]:        slot 0, bytes1(slot0 << (30 * 8))
// s[n]:        slot 0, bytes1(slot0 << (n * 8))
contract A {
    string s;
}
```

## String > 31 bytes || Bytes > 31 bytes

```solidity
// s.length:    slot 0
// s[0]:        slot keccak256(abi.encodePacked(uint256(0))), bytes1(slot << (0 * 8))
// s[31]:       slot keccak256(abi.encodePacked(uint256(0))), bytes1(slot << (31 * 8))
// s[32]:       slot keccak256(abi.encodePacked(uint256(0))) + 1, bytes1(slot << (0 * 8))
// s[n]:        slot keccak256(abi.encodePacked(uint256(0))) + (n / 32), bytes1(slot << ((n % 32) * 8))
contract A {
    string s;
}
```

## Dynamic Array

```solidity
// a.length:    slot 0
// a[0]:        slot keccak256(abi.encodePacked(0))
// a[1]:        slot keccak256(abi.encodePacked(0)) + 1
// a[n]:        slot keccak256(abi.encodePacked(0)) + n
contract A {
    uint256[] a;
}
```

## Mapping

```solidity
// m[key]:          slot keccak256(abi.encodePacked(uint256(key), uint256(0)))
contract A {
    mapping(uint256 => uint256) m;
}

// mm[key1][key2]:  slot keccak256(abi.encodePacked(uint256(key2), keccak256(abi.encodePacked(uint256(key1), uint256(0)))))
contract B {
    mapping(uint256 => mapping(uint256 => uint256)) mm;
}
```

## Layout

```solidity
contract A {
    struct S {
        uint256 a;
        uint128 b;
        uint128 c;
    }

    enum E {
        State1,
        State2,
        State3
    }

    type T is uint256;

    uint256 a; //           slot 0
    int256 b; //            slot 1

    uint128 c; //           slot 2
    uint128 d; //           slot 2

    bool e; //              slot 3
    bool f; //              slot 3

    bytes32 g; //           slot 4

    address h; //           slot 5
    address payable i; //   slot 6

    E j; //                 slot 6
    E k; //                 slot 6
    T l; //                 slot 7
    S m; //                 slot 8, 9

    uint256[2] n; //        slot 10, 11
}
```

## Inheritance

```solidity
contract C {
    uint256 c = 1; // slot 0
}

contract B is C {
    uint256 b = 2; // slot 1
}

contract D {
    uint256 d = 3; // slot 2
}

contract A is B, D {
    uint256 a = 4; // slot 3
}
```
