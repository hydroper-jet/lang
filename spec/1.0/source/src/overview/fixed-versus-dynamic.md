# Fixed versus dynamic

There are two types of properties: *fixed* and *dynamic* properties. Fixed properties shadow dynamic properties by default.

Fixed properties are these statically defined by a class. Dynamic properties are these resulting from property accessor proxies.

Classes such as `Map` use dynamic properties in high frequency.

```
const o = { x: 10 }
o.x++
```

## Explicit disambiguation

Explicit disambiguation between accessing fixed and dynamic properties is possible by using the reserved Jet for XML qualifiers `fixed` and `dynamic`.

```
o.fixed::x
o.dynamic::x
```