# Aliases

An alias is a symbol that translates to another symbol. Aliases are a result from `type` definitions and alias `import` directives.

```
type Double = Number;
import N2 = p.N1;
// Package alias
import p2 = p.*;
```

Aliases consist of the following internal properties:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the alias. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the alias. |
| \[\[*AliasOf*\]\] | The symbol to which this alias translates. |
| \[\[*ParentDefinition*\]\] | The parent definition of the alias. |
| \[\[*PlainMetadata*\]\] | Plain meta-data attached to the class. |

## Parent definition

When the parent definition of an alias is a package, the alias has a fully package qualified name.

## Meta data

An alias may contain zero or more plain meta-data:

```
[[N1(n2)]]
type T2 = T1;
```

## ResolveAlias()

The internal *ResolveAlias*(*type*) function takes the following steps:

1. If *type* is an alias, return *ResolveAlias*(*type*\[\[*AliasOf*\]\]).
2. Return *type*.