# Object Initializer

**Syntax**

<ul>
    <i>ObjectInitializer</i> :
    <ul>
        <b>{</b> <i>FieldList</i> <b>}</b>
    </ul>
</ul>

<ul>
    <i>FieldList</i> :
    <ul>
        «empty»<br>
        <i>NonEmptyFieldList</i><br>
        <i>NonEmptyFieldList</i> <b>,</b>
    </ul>
</ul>

<ul>
    <i>NonEmptyFieldList</i> :
    <ul>
        <i>InitializerField</i><br>
        <i>InitializerRest</i><br>
        <i>NonEmptyFieldList</i> <b>,</b> <i>InitializerField</i><br>
        <i>NonEmptyFieldList</i> <b>,</b> <i>InitializerRest</i>
    </ul>
</ul>

<ul>
    <i>InitializerRest</i> :
    <ul>
        <b>...</b> <i>AssignmentExpression</i><sup>allowIn</sup>
    </ul>
</ul>

<ul>
    <i>InitializerField</i> :
    <ul>
        <i>FieldName</i> <b>:</b> <i>AssignmentExpression</i><sup>allowIn</sup><br>
        <i>IdentifierName</i>
    </ul>
</ul>

<ul>
    <i>FieldName</i> :
    <ul>
        <i>IdentifierName</i><br>
        <i>Brackets</i><br>
        <i>StringLiteral</i><br>
        <i>NumericLiteral</i>
    </ul>
</ul>

**Semantics**

The object initializer may be used to initialize the following types:

* **\***
* **Object**
* **Map.&lt;K, V>**
* Set enumerations
* Classes containing the **\[Literal]** meta-data

Initializing a type that is one of { **\***, **Object**, **Object?** } results into a **Map.&lt;\*, \*>** object.

The default context type is the **Map.&lt;\*, \*>** type.

**Verification**

A field item is either an *InitializerRest* or an <i>InitializerField</i>, from left-to-right.

*ObjectInitializer*

* Let *ctxType* be the initially given context type or **Map.&lt;\*, \*>** otherwise.
* Match the nonterminal symbol with *AnyOrObject*(*ctxType*).
* Otherwise match the nonterminal symbol with *Map*(*ctxType*).
* Otherwise match the nonterminal symbol with *SetEnum*(*ctxType*).
* Otherwise match the nonterminal symbol with *LiteralClass*(*ctxType*).
* Otherwise throw a verify error.

*ResolveShorthand*(*IdentifierName*) internal function

* Let *r* be *ResolveProperty*(enclosing scope, undefined, *IdentifierName* string).
* Throw a verify error if *r* is undefined.
* Throw a verify error if *PropertyIsVisible*(*ref*, enclosing scope) is false.
* Throw a verify error if *r* is a reference value that references a parameterized type.
* Return *r*

*ResolveInstanceVariable*(**C**, *name*) internal function

* Let *variable* be a non-inherited instance variable of **C** whose \[\[*Name*\]\] equals the *name* string.
* Throw a verify error if *variable* is undefined.
* Throw a verify error if *PropertyIsVisible*(*variable*, enclosing scope) is false.
* Return *variable*.

*AnyOrObject*(*ctxType*) internal verification

* If *ctxType* is not one of { **\***, **Object**, **Object?**, **Map.&lt;\*, \*>**, **Map.&lt;\*, \*>?** }, return match failure.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to **Map.&lt;\*, \*>**.
  * Else if the *field* is a shorthand field *IdentifierName*
    * Call *ResolveShorthand*(*IdentifierName*).
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Verify the *Brackets* symbol.
    * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
* Return a value of the *ctxType* type.

*Map*(*ctxType*) internal verification

* If *ctxType* is not **M** or **M?**, where **M** is **Map.&lt;K, V>**, return match failure.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to **Map.&lt;K, V>**.
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to **V**.
    * Throw a verify error if **K** is not one of { **\***, **Object**, **String** }.
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to **K**.
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol
      * Throw a verify error if **K** is not one of { **\***, **Object**, **String** }.
    * Else if the <i>FieldName</i> of *field* is a *StringLiteral* symbol
      * Throw a verify error if **K** is not one of { **\***, **Object**, **String** }.
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Throw a verify error if **K** is not one of { **\***, **Object**, **Number** }.
    * Limit the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to **V**.
* Return a value of the *ctxType* type.

*SetEnum*(*ctxType*) internal verification

* If *ctxType* is not **E** or **E?**, where **E** is a set enumeration, return match failure.
* Let *c* be zero.
* Let *isConst* be true.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Let *c1* be the result of limiting the type of the expression of *field* to **E**.
    * If *c1* is an **enum** constant and *isConst* is true
      * Assign *c* = bitwise OR(*c*, number of *c1*)
    * Else assign *isConst* = false
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to **Boolean**.
    * Let *member* be an enumeration member of **E** whose string equals the *IdentifierName* string
    * Throw a verify error if *member* is undefined.
    * If *shortRef* is a boolean constant and *isConst* is true
      * If *shortRef* boolean is true
        * Assign *c* = bitwise OR(*c*, number of *member*)
      * Else assign *c* = erase bits of (number of *member*) from *c* if all bits are included
    * Else assign *isConst* = false
  * Else
    * Let *c1* be the result of limiting the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to **E**.
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to **String**.
      * Assign *isConst* = false
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol or a *StringLiteral* symbol
      * Let *member* be an enumeration member of **E** whose string equals the string of the *IdentifierName* symbol or *StringLiteral* symbol.
      * Throw a verify error if *member* is undefined.
      * If *c1* is a boolean constant and *isConst* is true
        * If *c1* boolean is true
          * Assign *c* = bitwise OR(*c*, number of *member*)
        * Else assign *c* = erase bits of (number of *member*) from *c* if all bits are included
      * Else assign *isConst* = false
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Throw a verify error.
* If *isConst* is true
  * Return an **enum** constant with number *c* and static type as *ctxType*.
* Return a value of the *ctxType* type.

*LiteralClass*(*ctxType*) internal verification

* If *ctxType* is not **C** or **C?**, where **C** is a **class** and **C**\[\[*AllowLiteral*\]\] is true, return match failure.
* Let *missing* be a set containing all non optional non-inherited instance variables of **C**.
* For each field item *field*
  * If *field* is *InitializerRest*
    * Limit the type of the expression of *field* to **C**.
    * Assign *missing* = empty set
  * Else if the *field* is a shorthand field *IdentifierName*
    * Let *variable* be *ResolveInstanceVariable*(**C**, *IdentifierName* string).
    * Remove *variable* from the *missing* set.
    * Let *shortRef* be *ResolveShorthand*(*IdentifierName*).
    * Limit the static type of *shortRef* to *variable*\[\[*Type*\]\].
  * Else
    * If the <i>FieldName</i> of *field* is a *Brackets* symbol
      * Limit the type of the *Brackets* expression to **String**.
      * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
      * Assign *missing* = empty set
    * Else if the <i>FieldName</i> of *field* is an *IdentifierName* symbol or a *StringLiteral* symbol
      * Let *variable* be *ResolveInstanceVariable*(**C**, *IdentifierName* string or *StringLiteral* string).
      * Remove *variable* from the *missing* set.
      * Limit the type of the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField* to *variable*\[\[*Type*\]\].
    * Else if the <i>FieldName</i> of *field* is a *NumericLiteral* symbol
      * Verify the <i>AssignmentExpression</i><sup>allowIn</sup> symbol of the *InitializerField*.
      * Throw a verify error.
* Throw a verify error if *missing* is a non empty set.
* Return a value of the *ctxType* type.