# Property resolution

<!--

* Dynamic resolution for:
  * `*`, `XML`, `XMLList`
* Resolving property by number value always uses {proxy::getProperty, proxy::setProperty, proxy::deleteProperty}
* Fully package qualified names shadow any matching variable names
* Consider package wildcard uses in lexical references

-->

## ResolveProperty()

The internal *ResolveProperty*(*base*, *qual*, *key*) function takes a *base* object, a *qual* qualifier value and a *key* value, and resolves to a reference value. *ResolveProperty* takes the following steps:

1. If the type o *base* is one of \{ `XML`, `XMLList` \}, return *XMLReferenceValue*(*base*, *qual*, *key*).
2. If *base* is a scope, return *ResolveScopeProperty*(*base*, *qual*, *key*).
3. If *base* is a value whose type is `*`
    1. Return *DynamicReferenceValue*(*base*, *qual*, *key*)
4. Throw a verify error if *qual* is defined.
5. If *base* is a `class` or `enum`
    1. It is a verify error if *key* is not a `String` value.
    2. While *base* is defined
        1. Let *r* be the symbol in *base*\[\[*StaticProperties*\]\] whose key is equals *key*.
        2. Return *StaticReferenceValue*(*base*, *r*) if *r* is defined.
        3. Assign *base* = *base*\[\[*SuperClass*\]\]
    3. Return undefined.
6. If *base* is a value
    1. Return undefined if the type of *base* is `undefined`.
    3. If *key* is a `String` value
        1. For each descending *type* in the type hierarchy of *base*
            1. For each *prop* in *type*\[\[*Prototype*\]\]
                1. If *prop*\[\[*Name*\]\] is equals *key*, return *InstanceReferenceValue*(*base*, *prop*).
    4. For each descending *type* in the type hierarchy of *base*
        1. Let *proxy* be *FindPropertyProxy*(*type*)
        2. If *proxy* is defined
            1. If the first parameter type of *proxy* is equals the type of *key* or if the type of *key* is a subtype of the first parameter type of *proxy*
                1. Return *ProxyReferenceValue*(*base*, *proxy*)
    4. Return undefined.
7. If *base* is a package
    1. Return undefined if *key* is not a `String` value.
    2. Let *r* be a symbol in *base*\[\[*Properties*\]\] whose key is equals *key*.
    3. Return *WrapPropertyIntoValue*(*ResolveAlias*(*r*)) if *r* is defined.
    4. For each *p* in *base*\[\[*WildcardUses*\]\]
        1. Let *r* be *ResolveProperty*(*p*, undefined, *key*)
        2. Return *r* if it is defined.
    5. Return undefined.
8. Return undefined.

## FindPropertyProxy()

The internal *FindPropertyProxy*(*type*) function takes the following steps:

1. Return undefined if *type* does not contain \[\[*Proxies*\]\].
2. Return a function of *type*\[\[*Proxies*\]\] whose key equals `getProperty`.

## ResolveScopeProperty()

The internal *ResolveScopeProperty*(*base*, *qual*, *key*) takes the following steps:

1. If *base* is a `with` scope or filter operator scope, return *DynamicScopeReferenceValue*(*base*, *qual*, *key*).
2. Throw a verify error if either *qual* is defined or *key* is not a `String` value.
3. Let *r* be a symbol of *base*\[\[*Properties*\]\] whose key equals *key*.
4. If *r* is defined
    1. ?
5. ?

## WrapPropertyIntoValue()

The internal *WrapPropertyIntoValue*(*prop*) takes the following steps:

1. Let *parent* be *prop*\[\[*ParentDefinition*\]\]
2. If *parent* is a `class` or `enum`, return *StaticReferenceValue*().
3. ?

[*ResolveAlias*]: aliases.md#resolvealias