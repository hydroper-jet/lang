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