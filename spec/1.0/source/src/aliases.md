# Aliases

An alias is a symbol that translates to another symbol. Aliases are a result from **type** definitions and certain **import** directives.

```
type D = Number
import N1 = q.N
import q1 = q.*
```

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the alias. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the alias. |
| \[\[*AliasOf*\]\] | The symbol to which this alias translates. |
| \[\[*Parent*\]\] | The parent definition of the alias. |
| \[\[*Metadata*\]\] | Meta-data attached to the class. |

## Meta-data

An alias may contain zero or more meta-data:

```
[N1(n2)]
type T2 = T1
```

## Internal Functions

<sectionLabel>sec-resolvealias</sectionLabel>

### ResolveAlias()

The internal *ResolveAlias*(*type*) function takes the following steps:

1. If *type* is an alias, return *ResolveAlias*(*type*.\[\[*AliasOf*\]\]).
2. Return *type*.