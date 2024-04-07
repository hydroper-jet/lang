# Packages

Packages as denoted by the **package** keyword are used to organize properties and classes.

For an user to refer to a package's property it must be imported beforehand through an **import** directive.

```
package { public const j = Infinity }
package x.y { public const w = 10 }

trace(j)

import x.y.*
trace(w)
trace(x.y.w)
```

The fully qualified name of an imported package's property shadows any variable name in scope as described in the [Fully Qualified Names](#sec-fully-qualified-names) section.

```
package x.y { public const w = 10 }
class X { const y = new XY }
class XY { const w = Infinity }

import x.y.*
const x = new X
trace(x)
trace(x.y.w == 10)
```

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the package. |
| \[\[*Parent*\]\] | Optional parent package. |
| \[\[*Properties*\]\] | Properties of the package. |
| \[\[*UsePackages*\]\] | Packages contributed by **use package** directives. |
| \[\[*Subpackages*\]\] | The subpackages of the package. |

## Top-Level Package

The top-level package is an unnamed package from which subsequent packages are defined.

```
package {}
```

## Use Packages

Directives of the form **use package q.\*;** contribute an use package to a package. Use packages are used in name resolution to resolve to names from another package.

```
package a1.n1 { use package o1.n1.* }
```

## Subpackages

A package may have zero or more subpackages. The top-level package contains the topmost packages as subpackages.

```
package q1 {}
package q1.q2 {}
package q1.q2.qN {}
```