# Property resolution

## ResolveProperty()

The internal *ResolveProperty*(*base*, *qual*, *key*) function takes a *base* object, a *qual* qualifier value and a *key* value, and resolves to a reference value. *ResolveProperty* takes the following steps:

1. If *base* is a value whose type is one of \{ `XML`, `XMLList` \}, return *XMLReferenceValue*(*base*, *qual*, *key*).
2. If *base* is a scope, return *ResolveScopeProperty*(*base*, *qual*, *key*).
3. If *base* is a value whose type is `*`
    1. Return *DynamicReferenceValue*(*base*, *qual*, *key*)
4. Return undefined if *qual* is not undefined.
5. If *base* is a `class` or `enum`
    1. Return undefined if *key* is not a `String` value.
    2. While *base* is not undefined
        1. Let *r* be the symbol in *base*\[\[*StaticProperties*\]\] whose key is equals *key*.
        2. Return *StaticReferenceValue*(*base*, *r*) if *r* is not undefined.
        3. Assign *base* = *base*\[\[*SuperClass*\]\]
    3. Return undefined.
6. If *base* is a value
    1. Return undefined if the type of *base* is `void` or `null`.
    2. If *key* is a `String` value
        1. For each descending *type* in the type hierarchy of *base*
            1. For each *prop* in *type*\[\[*Prototype*\]\]
                1. If *prop*\[\[*Name*\]\] is equals *key*, return *InstanceReferenceValue*(*base*, *prop*).
    3. For each descending *type* in the type hierarchy of *base*
        1. Let *proxy* be *FindPropertyProxy*(*type*)
        2. If *proxy* is not undefined
            1. If the first parameter type of *proxy* is equals the type of *key* or if the type of *key* is a subtype of the first parameter type of *proxy*
                1. Return *ProxyReferenceValue*(*base*, *proxy*)
    4. If *key* is a `Number` value and *base* is of a tuple type
        1. Let *key* be *ToUInt32*(*key*)
        2. Assuming *key* to be a zero-based index, if the *key* index is not out of bounds of the element sequence of the tuple type of *base*
            1. Return *TupleReferenceValue*(*base*, *key*).
    5. Return undefined.
7. If *base* is a `package`
    1. Return undefined if *key* is not a `String` value.
    2. Let *r* be a symbol in *base*\[\[*Properties*\]\] whose key is equals *key*.
    3. Return *WrapPropertyReference*(*ResolveAlias*(*r*)) if *r* is not undefined.
    4. For each *p* in *base*\[\[*RedirectPackages*\]\]
        1. Let *r* be *ResolveProperty*(*p*, undefined, *key*)
        2. Return *r* if it is not undefined.
    5. Return undefined.
8. If *base* is a package set
    1. Return undefined if *key* is not a `String` value.
    2. For each *p* in *base*\[\[*Packages*\]\]
        1. Let *r* be *ResolveProperty*(*p*, undefined, *key*)
        2. Return *r* if it is not undefined.
    3. Return undefined.
9. If *base* is the `import.meta` symbol
    1. Return undefined if *key* is not a `String` value.
    2. If *key* equals `env`, return the `import.meta.env` symbol.
    3. If *key* equals `output`, return the `import.meta.output` special value.
    4. Return undefined.
10. If *base* is the `import.meta.env` symbol
    1. Return undefined if *key* is not a `String` value.
    2. Let *evDict* be the result of loading environment variables.
    3. Return *evDict*\[*key*\]
11. Return undefined.

## FindPropertyProxy()

The internal *FindPropertyProxy*(*type*) function takes the following steps:

1. Return undefined if *type* does not contain \[\[*Proxies*\]\].
2. Return a function of *type*\[\[*Proxies*\]\] whose key equals `getProperty`.

## ResolveScopeProperty()

The internal *ResolveScopeProperty*(*base*, *qual*, *key*) takes the following steps:

1. If *base* is a `with` scope
    1. If *base*\[\[*Object*\]\] is of one of the types \{ `*`, `XML`, `XMLList` \}
        1. Return *DynamicScopeReferenceValue*(*base*, *qual*, *key*)
    2. Let *r* be *ResolveProperty*(*base*\[\[*Object*\]\], *qual*, *key*)
    3. Return *r* if it is not undefined.
2. If *base* is a filter operator scope
    1. Return *DynamicScopeReferenceValue*(*base*, *qual*, *key*).
3. Throw a verify error if either *qual* is not undefined or *key* is not a `String` value.
4. Let *r* be undefined.
5. If *qual* is not defined
    1. Assign *r* = a symbol of *base*\[\[*Properties*\]\] whose key equals *key*.
6. If *r* is not undefined
    1. Assign *r* = *WrapPropertyReference*(*ResolveAlias*(*r*))
    2. Return *r*
7. If *base* is an activation scope and *base*\[\[*This*\]\] is not undefined
    1. Assign *r* = *ResolveProperty*(*base*\[\[*This*\]\], *qual*, *key*)
    2. Return *r* if it is not undefined.
8. If *base* is a `class` or `enum` scope
    1. Assign *r* = *ResolveProperty*(*base*\[\[*Class*\]\], *qual*, *key*)
9. Let *amb* be undefined.
10. If *base* is a `package` scope
    1. Assign *amb* = *ResolveProperty*(*base*\[\[*Package*\]\], *qual*, *key*)
    2. It is an ambiguous reference error if *r* is not undefined
    3. Assign *r* = *amb*
11. If *qual* is not defined
    1. For each *p* in *base*\[\[*Imports*\]\]
        1. If *p*\[\[*Name*\]\] equals *key*
            1. Assign *amb* = *WrapPropertyReference*(*ResolveAlias*(*p*))
            2. It is an ambiguous reference error if *r* is not undefined
            3. Assign *r* = *amb*
12. For each *op* in *base*\[\[*OpenPackages*\]\]
    1. Assign *amb* = *ResolveProperty*(*op*, *qual*, *key*)
    2. It is an ambiguous reference error if *r* is not undefined
    3. Assign *r* = *amb*
13. If *r* is not defined and *base*\[\[*ParentScope*\]\] is not undefined
    1. Return *ResolveScopeProperty*(*base*\[\[*ParentScope*\]\], *qual*, *key*)
14. Return *r*

## WrapPropertyReference()

The internal *WrapPropertyReference*(*prop*) function takes the following steps:

1. Let *parent* be *prop*\[\[*ParentDefinition*\]\]
2. If *parent* is a `class` or `enum`, return *StaticReferenceValue*(*parent*, *prop*)
3. If *parent* is a `package`, return *PackageReferenceValue*(*parent*, *prop*)
4. Assert that *parent* is a scope.
5. Return *ScopeReferenceValue*(*parent*, *prop*)

[*ResolveAlias*]: aliases.md#resolvealias