# Visibility

A visibility is either `public`, `private`, `protected` or `internal`:

| Visibility | Description |
| ---------- | ----------- |
| `public` | The `public` visibility indicates that a property is accessible from anywhere. |
| `private` | The `private` visibility indicates that a property is accessible from within a class block. |
| `protected` | The `protected` visibility indicates that a property is accessible from the block of a class and any subclasses. |
| `internal` | The `internal` visibility indicates that a property is accessible from the enclosing package, excluding subpackages. |

* When a property is not `public`, it is not allowed for such property to be found at runtime.
* When a property is not `public`, it is not contained in the runtime type information.

## PropertyIsVisible()

The internal *PropertyIsVisible*(*prop*, *scope*) function takes the following steps:

1. If *prop* is a value
    1. If *prop* is a *StaticReferenceValue*(*base*, *prop1*)
        1. Assign *prop* = *prop1*
    2. Else if *prop* is an *InstanceReferenceValue*(*base*, *prop1*)
        1. Assign *prop* = *prop1* 
    3. Else if *prop* is a *PackageReferenceValue*(*base*, *prop1*)
        1. Assign *prop* = *prop1*
    4. Else return true.
2. Let *v* be *prop*\[\[*Visibility*\]\]
3. If *v* is `public`, return true.
4. If *v* is `internal`
    1. Let *p* be undefined.
    2. Let *p1* be *prop*\[\[*ParentDefinition*\]\]
    3. While *p1* is defined
        1. If *p1* is a `package`
            1. Assign *p* = *p1*
            2. Exit loop
        2. Assign *p1* = *p1*\[\[*ParentDefinition*\]\]
    4. If *p* is undefined
        1. Return true.
    5. While *scope* is defined
        1. If *scope* is a `package` scope and *scope*\[\[*Package*\]\] equals *p*
            1. Return true.
        2. Assign *scope* = *scope*\[\[*ParentScope*\]\]
    6. Return false.
5. If *v* is `private`
    1. Let *t* be undefined.
    2. Let *p* be *prop*\[\[*ParentDefinition*\]\]
    3. While *p* is defined
        1. If *p* is a `class` or `enum`
            1. Assign *t* = *p*
            2. Exit loop
        2. Assign *p* = *p*\[\[*ParentDefinition*\]\]
    4. If *t* is undefined
        1. Return false
    5. While *scope* is defined
        1. If *scope* is a `class` scope or `enum` scope and *scope*\[\[*Class*\]\] equals *t*
            1. Return true.
        2. Assign *scope* = *scope*\[\[*ParentScope*\]\]
    6. Return false.
6. If *v* is `protected`
    1. Let *t* be undefined.
    2. Let *p* be *prop*\[\[*ParentDefinition*\]\]
    3. While *p* is defined
        1. If *p* is a `class` or `enum`
            1. Assign *t* = *p*
            2. Exit loop
        2. Assign *p* = *p*\[\[*ParentDefinition*\]\]
    4. If *t* is undefined
        1. Return false
    5. While *scope* is defined
        1. If *scope* is a `class` scope or `enum` scope
            1. Let *scopeClass* be *scope*\[\[*Class*\]\]
            2. If *scopeClass* equals *t* or *scopeClass* is a subtype of *t*
                1. Return true.
        2. Assign *scope* = *scope*\[\[*ParentScope*\]\]
    6. Return false.
7. Return false.