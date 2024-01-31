# Use directive

The `use` directive is used to export definitions from another package to the enclosing package.

```
package p1 {}
package p2 { public use p1.* }
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>UseDirective</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>PackageName</i> <b>. *</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>use</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i></td>
    </tr>
</table>

**Semantics**

An `use` directive must be directly enclosed by a `package` scope and must contain the `public` attribute.

A `public use p.*` directive contributes the `p` package to (enclosing package)\[\[*RedirectPackages*\]\].

```
package p1 { public var x }
package p2 { public use p1.* }
```

A `public use p.x` directive assigns (enclosing packages)\[\[*Properties*\]\]\[**x**\] an alias **x** of the `x` property of the `p` package.

* It is a verify error if (enclosing packages)\[\[*Properties*\]\]\[**x**\] is already defined before the assignment.
* It is a verify error if [*PropertyIsVisible*](**p.x**, current scope) is false.

```
package p1 { public var x }
package p2 { public use p1.x }
```

A `public use y = p.x` directive assigns (enclosing package)\[\[*Properties*\]\]\[**y**\] an alias **y** of the `x` property of the `p` package.

* It is a verify error if (enclosing package)\[\[*Properties*\]\]\[**y**\] is already defined before the assignment.
* It is a verify error if [*PropertyIsVisible*](**p.x**, current scope) is false.

```
package p1 { public var x }
package p2 { public use y = p1.x }
```

[*PropertyIsVisible*]: ../visibility.md#propertyisvisible