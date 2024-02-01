# Fully qualified names

## Fully qualified name of a property

Properties have a fully qualified name which is a left-to-right combination of each *p*<sub><i>i</i></sub>\[\[*Name*\]\] where *p* is the list of ascending parent definitions and the descending definition and *i* goes from the ascending.

```
package q.f { public var x }
import q.f.x
q.f.x
```

## ResolveFullyQualifiedName(e)

Given a syntax construct *e* consisting of an *Identifier* token followed by one or more **.** *IdentifierName* productions, the internal *ResolveFullyQualifiedName*(*e*) function takes the following steps:

* Let *S* be a string sequence consisting of each name in *E* from left-to-right.
* If *S* matches the fully qualified name of a property *P1* from (current scope)\[\[*Imports*\]\], return *WrapPropertyReference*(*P1*).

```
import com.qux.bar.BarType
com.qux.bar.BarType.BETA
```

* If *S* minus the trailing name matches the fully qualified name of a package *P1* from (current scope)\[\[*OpenPackages*\]\]
  * Let *r* be *ResolveProperty*(*P1*, undefined, trailing name of *S*)
  * If *r* is not undefined and [*PropertyIsVisible*](*r*, *current scope*) is true
    * Return *r*.

```
import com.qux.bar.*
com.qux.bar.BarType.BETA
```

* If *S* minus the trailing name matches the name of a package alias *P1* from (current scope)\[\[*PackageAliases*\]\]
  * Let *r* be *ResolveProperty*(*P1*, undefined, trailing name of *S*)
  * If *r* is not undefined and [*PropertyIsVisible*](*r*, *current scope*) is true
    * Return *r*.

```
import b = com.qux.bar.*
b.BarType.BETA
```

* Return undefined.

If *e* is a different syntax construct, the *ResolveFullyQualifiedName*() function returns undefined.

[*PropertyIsVisible*]: ./visibility.md#propertyisvisible