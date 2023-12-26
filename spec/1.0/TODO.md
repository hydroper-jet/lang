# To do

## Variable bindings

* [ ] Remember of supporting variable shadowing for activation-scoped variables, which creates new scopes after each variable.

## Lexical reference

* [ ] Remember of *PropertyIsVisible* assertion

## Property operator

* [ ] Remember of *PropertyIsVisible* assertion
* [ ] Fully package qualified names shadow any matching variable names within a dot operator chain consisting of identifiers
  * Consider \[\[*Imports*\]\]
  * Consider \[\[*OpenPackages*\]\]

## Qualified identifier

* [ ] Make sure to use *IdentifierName* instead of *Identifier* wherever appllicable and describe that any context expecting a keyword takes the place of such *IdentifierName*.

## ResolveAlias

*ResolveAlias*(t) must be used in these places:

* [ ] Fully package qualified names