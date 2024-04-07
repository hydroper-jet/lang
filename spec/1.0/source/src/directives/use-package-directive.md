# Use Package Directive

The **use package** directive is used to export definitions from another package to the enclosing package.

```
package p1 {}
package p2 { use package p1.* }
```

**Syntax**

<ul>
    <i>UsePackageDirective</i> :
    <ul>
        <b>use package</b> <i>PackageName</i> <b>. *</b><br>
        <b>use package</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i><br>
        <b>use package</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i>
    </ul>
</ul>

**Semantics**

An **use** directive must be directly enclosed by a **package** block.

A **use package p.\*;** directive contributes the **p** package to (enclosing package).\[\[*UsePackages*\]\].

```
package p1 { public var x }
package p2 { use package p1.* }
```

A **use package p.x;** directive assigns (enclosing packages).\[\[*Properties*\]\].\[**x**\] an alias **x** of the **x** property of the **p** package.

* It is a verify error if (enclosing packages).\[\[*Properties*\]\].\[**x**\] is already defined before the assignment.
* It is a verify error if [*PropertyIsVisible*](**p.x**, enclosing scope) is false.

```
package p1 { public var x }
package p2 { use package p1.x }
```

A **use package y = p.x;** directive assigns (enclosing package).\[\[*Properties*\]\].\[**y**\] an alias **y** of the **x** property of the **p** package.

* It is a verify error if (enclosing package).\[\[*Properties*\]\].\[**y**\] is already defined before the assignment.
* It is a verify error if [*PropertyIsVisible*](**p.x**, enclosing scope) is false.

```
package p1 { public var x }
package p2 { use package y = p1.x }
```

[*PropertyIsVisible*]: #sec-propertyisvisible
