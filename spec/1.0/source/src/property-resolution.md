# Property resolution

## ResolveProperty()

The internal *ResolveProperty*(*base*, *qual*, *key*) function takes a *base* object, a *qual* qualifier value and a *key* value, and resolves to a reference value. *ResolveProperty* takes the following steps:

1. If *base* is a value whose type is one of \{ `XML`, `XMLList` \}, return *XMLReferenceValue*(*base*, *qual*, *key*).
2. If *base* is a scope, return *ResolveScopeProperty*(*base*, *qual*, *key*).
3. If *base* is a value whose type is `*` or if *key* is not a `String` or `Number` constant
    1. Return *DynamicReferenceValue*(*base*, *qual*, *key*)
4. Return undefined if *qual* is not undefined.
5. If *base* is a `class` or `enum`
    1. Return undefined if *key* is not a `String` constant.
    2. While *base* is not undefined
        1. Let *r* be the symbol in *base*\[\[*StaticProperties*\]\] whose key is equals *key*.
        2. Return *StaticReferenceValue*(*base*, *r*) if *r* is not undefined.
        3. Assign *base* = *base*\[\[*BaseClass*\]\]
    3. Return undefined.
6. If *base* is the `import.meta` value
    1. Return undefined if *key* is not a `String` constant.
    2. If *key* equals `env`, return the `import.meta.env` symbol.
    3. If *key* equals `output`, return the `import.meta.output` special value.
    4. Return undefined.
7. If *base* is the `import.meta.env` value
    1. Return undefined if *key* is not a `String` constant.
    2. Let *evDict* be the result of loading environment variables.
    3. Let *ev* be *evDict*\[*key*\]
    4. If *ev* is not undefined, return a `String` constant consisting of the *ev* string.
    5. Return undefined.
8. If *base* is a value
    1. Return undefined if the type of *base* is `void` or a nullable type.
    2. If *key* is a `String` constant
        1. For each descending *type* in the type hierarchy of *base*
            1. For each (*propName*, *prop*) in *type*\[\[*Prototype*\]\]
                1. If *propName* is equals *key*, return *InstanceReferenceValue*(*base*, *prop*).
    3. For each descending *type* in the type hierarchy of *base*
        1. Let *proxy* be *FindPropertyProxy*(*type*)
        2. If *proxy* is not undefined
            1. If the first parameter type of *proxy* is equals the type of *key* or if the type of *key* is a subtype of the first parameter type of *proxy*
                1. Return *ProxyReferenceValue*(*base*, *proxy*)
    4. If *key* is a `Number` constant value and *base* is of a tuple type
        1. Let *key* be *ToUInt32*(*key*)
        2. Assuming *key* to be a zero-based index, if the *key* index is not out of bounds of the element sequence of the tuple type of *base*
            1. Return *TupleReferenceValue*(*base*, *key*).
    5. Return undefined.
9. If *base* is a `package`
    1. Return undefined if *key* is not a `String` constant.
    2. Let *r* be a symbol in *base*\[\[*Properties*\]\] whose key is equals *key*.
    3. Return *WrapPropertyReference*(*ResolveAlias*(*r*)) if *r* is not undefined.
    4. For each *p* in *base*\[\[*RedirectPackages*\]\]
        1. Let *r* be *ResolveProperty*(*p*, undefined, *key*)
        2. Return *r* if it is not undefined.
    5. Return undefined.
10. If *base* is a package set
    1. Return undefined if *key* is not a `String` constant.
    2. For each *p* in *base*\[\[*Packages*\]\]
        1. Let *r* be *ResolveProperty*(*p*, undefined, *key*)
        2. Return *r* if it is not undefined.
    3. Return undefined.
11. Return undefined.

## FindPropertyProxy()

The internal *FindPropertyProxy*(*type*) function takes the following steps:

1. Return undefined if *type* does not contain \[\[*Proxies*\]\].
2. Return a function of *type*\[\[*Proxies*\]\] whose key equals `getProperty`.

## ResolveScopeProperty()

The internal *ResolveScopeProperty*(*base*, *qual*, *key*) takes the following steps:

1. If *base* is a `with` scope
    1. If the static type of *base*\[\[*Object*\]\] is one of the types \{ `*`, `XML`, `XMLList` \}
        1. Return *DynamicScopeReferenceValue*(*base*, *qual*, *key*)
    2. Let *r* be *ResolveProperty*(*base*\[\[*Object*\]\], *qual*, *key*)
    3. Return *r* if it is not undefined.
2. If *base* is a filter operator scope
    1. Return *DynamicScopeReferenceValue*(*base*, *qual*, *key*).
3. Let *r* be undefined.
4. If *qual* is undefined and *key* is a `String` constant
    1. Assign *r* = a symbol of *base*\[\[*Properties*\]\] whose key equals *key*.
5. If *r* is not undefined
    1. Assign *r* = *WrapPropertyReference*(*ResolveAlias*(*r*))
    2. Return *r*
6. If *base* is an activation scope and *base*\[\[*This*\]\] is not undefined
    1. Assign *r* = *ResolveProperty*(*base*\[\[*This*\]\], *qual*, *key*)
    2. Return *r* if it is not undefined.
7. If *base* is a `class` scope or `enum` scope
    1. Assign *r* = *ResolveProperty*(*base*\[\[*Class*\]\], *qual*, *key*)
8. Let *amb* be undefined.
9. If *base* is a `package` scope
    1. Assign *amb* = *ResolveProperty*(*base*\[\[*Package*\]\], *qual*, *key*)
    2. It is an ambiguous reference error if *r* is not undefined
    3. Assign *r* = *amb*
10. If *qual* is undefined and *key* is a `String` constant
    1. For each *p* in *base*\[\[*Imports*\]\]
        1. If *p*\[\[*Name*\]\] equals *key*
            1. Assign *amb* = *WrapPropertyReference*(*ResolveAlias*(*p*))
            2. It is an ambiguous reference error if *r* is not undefined
            3. Assign *r* = *amb*
11. For each *op* in *base*\[\[*OpenPackages*\]\]
    1. Assign *amb* = *ResolveProperty*(*op*, *qual*, *key*)
    2. It is an ambiguous reference error if *r* is not undefined
    3. Assign *r* = *amb*
12. If *r* is undefined and *base*\[\[*ParentScope*\]\] is not undefined
    1. Return *ResolveScopeProperty*(*base*\[\[*ParentScope*\]\], *qual*, *key*)
13. Return *r*

## WrapPropertyReference()

The internal *WrapPropertyReference*(*prop*) function takes the following steps:

1. If *prop* is a type and *prop* is either the void type (`void`), the any type (`*`), a function type, a tuple type or a nullable type
    1. Return *TypeAsReferenceValue*(*prop*)
2. Let *parent* be *prop*\[\[*ParentDefinition*\]\]
3. If *parent* is a `class` or `enum`, return *StaticReferenceValue*(*parent*, *prop*)
4. If *parent* is a `package`, return *PackageReferenceValue*(*parent*, *prop*)
5. Assert that *parent* is a scope.
6. Return *ScopeReferenceValue*(*parent*, *prop*)

[*ResolveAlias*]: aliases.md#resolvealias