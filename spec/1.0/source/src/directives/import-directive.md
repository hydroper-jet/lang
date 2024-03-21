# Import Directive

**Syntax**

<ul>
    <i>ImportDirective</i> :
    <ul>
        <b>import</b> <i>PackageName</i> <b>. *</b><br>
        <b>import</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i><br>
        <b>import</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>. *</b><br>
        <b>import</b> <i>Identifier</i> <b>=</b> <i>PackageName</i> <b>.</b> <i>IdentifierName</i>
    </ul>
</ul>

**Semantics**

An **import p.\*;** directive contributes the **p** package to (*enclosing scope*).\[\[*OpenPackages*\]\].

```
package p { public var x }
import p.*
p.x
x
```

An **import p.x;** directive contributes the **x** property of the **p** package to (*enclosing scope*).\[\[*Imports*\]\]. It is a verify error if [*PropertyIsVisible*](**p.x**, *enclosing scope*) is false.

```
package p { public var x }
import p.x
p.x
x
```

An **import p2 = p1.\*;** directive contributes an alias **p2** of the package **p1** to (*enclosing scope*).\[\[*PackageAliases*\]\].

```
package p1 { public var x }
import p2 = p1.*
var x
p2.x
x
```

An **import y = p.x;** directive assigns (*enclosing scope*).\[\[*Properties*\]\]\[**y**\] an alias **y** of the **x** property of the **p** package.

* It is a verify error if (*enclosing scope*).\[\[*Properties*\]\]\[**y**\] already exists before the assignment.
* It is a verify error if [*PropertyIsVisible*](**p.x**, *enclosing scope*) is false.

```
package p { public var x }
import y = p.x
y
```

[*PropertyIsVisible*]: #sec-propertyisvisible