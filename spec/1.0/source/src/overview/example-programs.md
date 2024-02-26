# Example programs

## Basic syntax

```
trace("Hello, world")

function isEven(argument: Number): Boolean (argument % 2 == 0)

trace(isEven(11))
```

## Package aliasing

Packages are used to organize properties into a namespace. In addition, the language allows to redirect accesses to other packages within a package through the `use` directive, allowing the user to use an abbreviation prefix to resolve to a property from a series of packages.

```
package q1.y1 {
    public use y1.n1.*
    public use y1.n2.*
    public use y1.n3.*
}
import y1 = q1.y1.*
new y1.W

const y1: Number = 10
```

In the above program, the `y1` constant may be shadowed by the `y1` package alias in certain occasions: when a property defined in the `y1` package alias matches with the identifier name of a property accessed from the dot operator in the `y1` base.