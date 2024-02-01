# Packages

Packages as denoted by the `package` keyword are used to organize properties and classes. For an user to refer to a package's property it must be imported beforehand through an `import` directive.

```
// Top-level package
package { public const j = Infinity }

// "x.y" package
package x.y { public const w = 10 }

// Infinity
trace(j)

// 10
import x.y.*
trace(w)
trace(x.y.w)
```

The fully qualified name of an imported package's property shadows any variable name in scope as described in the [Fully qualified names](fully-qualified-names.md) section.

```
package x.y { const w = 10 }
class X { const y = new XY }
class XY { const w = Infinity }

import x.y.*

const x = new X

// [object X]
trace(x)

// 10 (not Infinity)
trace(x.y.w)
```

Packages consist of the following internal properties:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the package. |
| \[\[*ParentDefinition*\]\] | Optional parent package. |
| \[\[*Properties*\]\] | Properties of the package as a dictionary from string to symbol. |
| \[\[*RedirectPackages*\]\] | The redirect packages of the package. |
| \[\[*Subpackages*\]\] | The subpackages of the package. |

## Redirect packages

Directives of the form `public use q.*;` contribute a redirect package to a package. Redirect packages are used in name resolution to resolve to names from another package.

```
package org.alias.core {
    public use org.origin.core.*;
}
```

## Subpackages

A package may have zero or more subpackages. The top-level package contains the topmost packages as subpackages.

```
// Subpackage of top-level package
package q1 {}
// Subpackage of "q1"
package q1.q2 {}
// Subpackage of "q1.q2"
package q1.q2.qN {}
```