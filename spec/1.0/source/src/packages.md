# Packages

Packages as denoted by the `package` keyword are used to organize properties and classes. For an user to refer to a package's property it must be imported beforehand through an `import` directive or an `use` definition.

```
// Top-level package
package {
    public const globalProperty: Number = Infinity;
}

// "org.x.y" package
package org.x.y {
    public const xyProperty: Number = 10;
}

// Infinity
trace(globalProperty);

// 10
import org.x.y.*;
trace(xyProperty);
trace(org.x.y.xyProperty);
```

The fully package qualified name of an imported package's property shadows any variable name in scope:

```
public class Org {
    public const x: OrgX = new OrgX;
}
public class OrgX {
    public const y: OrgY = new OrgY;
}
public class OrgY {
    public const xyProperty: Number = Infinity;
}

import org.x.y.*;

const org = new Org;

// [object Org]
trace(org);

// 10 (not Infinity)
trace(org.x.y.xyProperty);
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