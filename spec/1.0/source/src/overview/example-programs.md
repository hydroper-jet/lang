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
package com.mycompany.myproject.rhino {
    public use rhino.core.*
    public use rhino.feed.*
    public use rhino.server.*
    public use rhino.util.*
}
import rh = com.mycompany.myproject.rhino.*
new rh.Server

const rh: Number = 10
```

In the above program, the `rh` constant may be shadowed by the `rh` package alias in certain occasions: when a property defined in the `rh` package alias matches with the identifier name of a property accessed from the dot operator in the `rh` base.