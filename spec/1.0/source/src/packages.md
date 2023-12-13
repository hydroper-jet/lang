# Packages

Packages are used to organize properties and classes. For an user to refer to a package's property it must be imported beforehand through an `import` directive or an `use` definition.

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

## Wildcard uses

Directives of the form `public use q.*;` contribute a wildcard use to a package. Wildcard uses are used in name resolution to resolve to names from another package.

```
package org.alias.core {
    public use org.origin.core.*;
}
```