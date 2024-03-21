# Scopes

Lexical scopes, called solely scopes, are used to represent available lexical names during lexical name lookup.

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Parent*\]\] | The parent scope from which the scope is subsequent. |
| \[\[*Properties*\]\] | Properties of the scope. **import** directives that alias a property contribute to this attribute. |
| \[\[*Imports*\]\] | Set of package imported properties. Holds **non aliased** properties imported from packages. |
| \[\[*OpenPackages*\]\] | Set of open packages. Holds **non aliased** opened packages. |
| \[\[*PackageAliases*\]\] | Set of package aliases. Includes package aliases resulting from the **import** directive. |

## Base Scope Creation

When creating the base scope of a program, let it be subsequent of the unique scope *s*.

* Contribute the top-level package to *s*.\[\[*OpenPackages*\]\].
* Contribute the **jet.lang** package to *s*.\[\[*OpenPackages*\]\].

## With Scope

### Internal Properties

The **with** scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Object*\]\] | The object specified in the **with** statement. |

## Filter Operator Scope

The filter operator scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Base*\]\] | The base object of the filter operator. |

## Activation Scope

The activation scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Function*\]\] | The function to which this scope belongs. |
| \[\[*This*\]\] | The object returned by the **this** literal. |

## Class Scope

The **class** scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Class*\]\] | The enclosing class. |

## Enum Scope

The **enum** scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Class*\]\] | The enclosing **enum**. |

## Interface Scope

The **interface** scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Interface*\]\] | The enclosing **interface**. |

## Package Scope

The **package** scope extends the internal properties of a scope as described in the following table.

| Property | Description |
| -------- | ----------- |
| \[\[*Package*\]\] | The enclosing package. |