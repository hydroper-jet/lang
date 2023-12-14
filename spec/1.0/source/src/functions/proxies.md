# Proxies

A proxy is a function containing the `proxy` attribute, enclosed by a `class` or `enum` block. The name of a proxy must be one of the several proxy names listed in this section.

* [positive](#positive)
* [negate](#negate)
* [bitwiseNot](#bitwiseNot)
* [add](#add)
* [subtract](#subtract)
* [multiply](#multiply)
* [divide](#divide)
* [remainder](#remainder)
* [power](#power)
* [bitwiseAnd](#bitwiseAnd)
* [bitwiseXor](#bitwiseXor)
* [bitwiseOr](#bitwiseOr)
* [shiftLeft](#shiftLeft)
* [shiftRight](#shiftRight)
* [shiftRightUnsigned](#shiftRightUnsigned)
* [delegate](#delegate)
* [to](#to)

## positive

```
class C {
    proxy function positive(): T {}
}
```

## negate

```
class C {
    proxy function negate(): T {}
}
```

## bitwiseNot

```
class C {
    proxy function bitwiseNot(): T {}
}
```

## add

```
class C {
    proxy function add(right: C): T {}
}
```

## subtract

```
class C {
    proxy function subtract(right: C): T {}
}
```

## multiply

```
class C {
    proxy function multiply(right: C): T {}
}
```

## divide

```
class C {
    proxy function divide(right: C): T {}
}
```

## remainder

```
class C {
    proxy function remainder(right: C): T {}
}
```

## power

```
class C {
    proxy function power(right: C): T {}
}
```

## bitwiseAnd

```
class C {
    proxy function bitwiseAnd(right: C): T {}
}
```

## bitwiseXor

```
class C {
    proxy function bitwiseXor(right: C): T {}
}
```

## bitwiseOr

```
class C {
    proxy function bitwiseOr(right: C): T {}
}
```

## shiftLeft

```
class C {
    proxy function shiftLeft(right: C): T {}
}
```

## shiftRight

```
class C {
    proxy function shiftRight(right: C): T {}
}
```

## shiftRightUnsigned

```
class C {
    proxy function shiftRightUnsigned(right: C): T {}
}
```

## delegate

```
class C {
    proxy function delegate(): T {}
}
```

## to

* The `to` proxy adds explicit conversion from the enclosing class to the type it returns.
* The `to` proxy may be defined multiple times.

```
class C {
    proxy function to(): T {}
}
```