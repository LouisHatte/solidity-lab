# Binary

## Keeping bits (&)

```solidity
uint kept = x & mask;

// 1111 0000    (mask)
// &
// 0011 1100    (x = 60)
// 0011 0000
```

## Clearing bits (~&)

```solidity
uint withoutBits = x & ~mask;

// 1111 0000    (mask)
// ~
// 0000 1111
// &
// 0011 1100    (x = 60)
// 0000 1100
```

## Setting bits (|)

```solidity
uint withBits = x | mask;

// 1111 0000    (mask)
// |
// 0011 1100    (x = 60)
// 1111 1100
```

## Toggling bits (^)

```solidity
uint toggled = x ^ mask;

// 1111 0000    (mask)
// ^
// 0011 1100    (x = 60)
// 1100 1100
```

## Checking if a number is odd (impair) or even (pair)

```solidity
bool isEven = (x & 1) == 0;

// 1000 0100    (x = 132)
// &
// 0000 0001    (1)
// 0000 0000    even

// 1001 1011    (x = 155)
// &
// 0000 0001    (1)
// 0000 0001    odd
```

## Extracting the lowest n bits

```solidity
uint lowBits = x & ((1 << n) - 1);

// 0000 0001    (1)
// <<
// 0000 0100    (n = 4)
// 0001 0000
// -
// 0000 0001    (1)
// 0000 1111
// &
// 0011 1100    (x = 60)
// 0000 1100
```

## Clearing the lowest n bits

```solidity
uint cleared = x & (~((1 << n) - 1));

// 0000 0001    (1)
// <<
// 0000 0100    (n = 4)
// 0001 0000
// -
// 0000 0001    (1)
// 0000 1111
// ~
// 1111 0000
// &
// 0011 1100    (x = 60)
// 0011 0000
```

## Checking if a specific bit is set

```solidity
bool isSet = (x & (1 << n)) != 0;

// 0000 0001    (1)
// <<
// 0000 0100    (n = 4)
// 0001 0000
// &
// 0011 1100    (x = 60)
// 0001 0000    set

// 0000 0001    (1)
// <<
// 0000 0000    (n = 0)
// 0000 0001
// &
// 0011 1100    (x = 60)
// 0000 0000    not set
```

## Swapping two numbers without a temp variable

```solidity
a ^= b;
b ^= a;
a ^= b;

// 0011 1100    (a = 60)
// ^
// 1000 0100    (b = 132)
// 1011 1000    (a2)
// ^
// 1000 0100    (b)
// 0011 1100    (b2 = 60)
// ^
// 1011 1000    (a2)
// 1000 0100    (a3 = 132)
```
