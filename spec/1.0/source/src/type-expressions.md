# Type Expressions

**Syntax**

<ul>
    <i>TypeExpression</i> :
    <ul>
        <i>TypeExpression</i><sup>noPrefix</sup><br>
        <b>?</b> <i>TypeExpression</i><sup>noPrefix</sup>
    </ul>
</ul>

<ul>
    <i>TypeExpression</i><sup>noPrefix</sup> :
    <ul>
        <b>*</b><br>
        <i>Identifier</i><br>
        <b>void</b><br>
        <b>&#x5B;</b> <i>TypeExpression</i> <b>&#x5D;</b><br>
        <b>&#x28;</b> <i>TypeExpression</i> <b>&#x29;</b><br>
        <i>TupleTypeExpression</i><br>
        <i>FunctionTypeExpression</i><br>
        <i>TypeExpression</i><sup>noPrefix</sup> <b>.</b> <i>IdentifierName</i><br>
        <i>TypeExpression</i><sup>noPrefix</sup> <i>TypeArguments</i><br>
        <i>TypeExpression</i><sup>noPrefix</sup> <b>?</b><br>
        <i>TypeExpression</i><sup>noPrefix</sup> <b>!</b>
    </ul>
</ul>

<ul>
    <i>TypeExpressionList</i> :
    <ul>
        <i>TypeExpression</i><br>
        <i>TypeExpressionList</i> <b>,</b> <i>TypeExpression</i>
    </ul>
</ul>

<ul>
    <i>TypeArguments</i> :
    <ul>
        <b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> <i>ParameterGreaterThan</i>
    </ul>
</ul>

<ul>
    <i>ParameterGreaterThan</i> :
    <ul>
        <b>&gt;</b><br>
        first greater-than <b>&gt;</b> from the offending token
    </ul>
</ul>

<ul>
    <i>TypeArgumentsList</i> :
    <ul>
        <i>TypeExpression</i><br>
        <i>TypeArgumentsList</i> <b>,</b> <i>TypeExpression</i>
    </ul>
</ul>

<ul>
    <i>TupleTypeExpression</i> :
    <ul>
        <b>&#x5B;</b> <i>TupleElementTypes</i> <b>&#x5D;</b>
    </ul>
</ul>

<ul>
    <i>TupleElementTypes</i> :
    <ul>
        <i><i>TypeExpression</i> <b>,</b> <i>TypeExpression</i></i><br>
        <i><i>TupleElementTypes</i> <b>,</b> <i>TypeExpression</i></i>
    </ul>
</ul>

<ul>
    <i>FunctionTypeExpression</i> :
    <ul>
        <b>function</b> <b>(</b> <i>FunctionTypeParameters</i> <b>)</b> <b>:</b> <i>TypeExpression</i>
    </ul>
</ul>

<ul>
    <i>FunctionTypeParameters</i> :
    <ul>
        «empty»<br>
        <i>FunctionTypeParameter</i><br>
        <i>FunctionTypeParameters</i> <b>,</b> <i>FunctionTypeParameter</i>
    </ul>
</ul>

<ul>
    <i>FunctionTypeParameter</i> :
    <ul>
        <i>TypedIdentifier</i><br>
        <i>FunctionTypeOptionalParameter</i><br>
        <b>...</b> <i>TypedIdentifier</i>
    </ul>
</ul>

<ul>
    <i>TypedIdentifier</i> :
    <ul>
        <i>IdentifierName</i><br>
        <i>IdentifierName</i> <b>:</b> <i>TypeExpression</i>
    </ul>
</ul>

<ul>
    <i>FunctionTypeOptionalParameter</i> :
    <ul>
        <i>IdentifierName</i> <b>?</b><br>
        <i>IdentifierName</i> <b>?</b> <b>:</b> <i>TypeExpression</i>
    </ul>
</ul>

**Verification**

<i>TypeExpression</i> : <i>TypeExpression</i><sup>noPrefix</sup>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TypeExpression</i> : <b>?</b> <i>TypeExpression</i><sup>noPrefix</sup>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup> if it is a nullable type.
* Return a nullable type consisting of the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>*</b>

* Return the any type.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>Identifier</i>

* Let *p* be *ResolveProperty*(*enclosing scope*, undefined, string of <i>Identifier</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *enclosing scope*) is false.
* It is a verify error if *p* is not a type and the rule is not followed by a postfix operator.
* It is a verify error if *p* is a reference value that references a parameterized type and the expression is not followed by <i>TypeArguments</i>.
* Return *p*.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>void</b>

* Return the void type.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TupleTypeExpression</i>

* Return the verification of <i>TupleTypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>FunctionTypeExpression</i>

* Return the verification of <i>FunctionTypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>&#x5B;</b> <i>TypeExpression</i> <b>&#x5D;</b>

* Return an array type consisting of the verification result of <i>TypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <b>&#x28;</b> <i>TypeExpression</i> <b>&#x29;</b>

* Return the verification result of <i>TypeExpression</i>.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <b>.</b> <i>IdentifierName</i>

* Let *p* be [*ResolveFullyQualifiedName*](#sec-resolvefullyqualifiedname)(type expression).
* If *p* is not undefined
  * Return *p*.
* Let *base* be the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.
* Let *p* be *ResolveProperty*(*base*, undefined, string of <i>IdentifierName</i>)
* It is a verify error if *p* is undefined.
* It is a verify error if [*PropertyIsVisible*](*p*, *enclosing scope*) is false.
* It is a verify error if *p* is a reference value that references a parameterized type and the expression is not followed by <i>TypeArguments</i>.
* Return *p*.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <i>TypeArguments</i>

* Let *base* be the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.
* It is a verify error if *base* is not a type with \[\[*TypeParameters*\]\].
* It is a verify error if *base*\[\[*TypeParameters*\]\] is empty.
* Let *a* be the verification sequence of <i>TypeArguments</i>.
* Return a type substitution in *base* with *a* as type arguments.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <b>?</b>

* Return the verification result of <i>TypeExpression</i><sup>noPrefix</sup> if it is a nullable type.
* Return a nullable type consisting of the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TypeExpression</i><sup>noPrefix</sup> : <i>TypeExpression</i><sup>noPrefix</sup> <b>!</b>

* Return a non nullable type from the verification result of <i>TypeExpression</i><sup>noPrefix</sup>.

<i>TupleTypeExpression</i> : <b>&#x5B;</b> <i>TupleElementTypes</i> <b>&#x5D;</b>

* Let *e* be an empty list.
* For each *e*<sub>0</sub> <i>TypeExpression</i> in <i>TupleElementTypes</i>
  * Append to *e* the verification result of *e*<sub>0</sub>
* Return a tuple type consisting of the element types *e*.

<i>FunctionTypeExpression</i> : <b>function</b> <b>(</b> <i>FunctionTypeParameters</i> <b>)</b> <b>:</b> <i>TypeExpression</i>

* It is a verify error if <i>FunctionTypeParameters</i> is not a sequence of zero or more <i>TypedIdentifier</i> followed by zero or more <i>FunctionTypeOptionalParameter</i> followed by optional <b>...</b> <i>TypedIdentifier</i>.
* Let *p*<sub>0</sub> be an empty list.
* Let *p*<sub>1</sub> be an empty list.
* Let *p*<sub>2</sub> be undefined.
* For each <i>TypedIdentifier</i> as *typedId* in <i>FunctionTypeParameters</i>
  * Let (*name*, *type*) be the verification of *typedId*.
  * Contribute (*name*, *type*) to *p*<sub>0</sub>.
* For each <i>FunctionTypeOptionalParameter</i> as *optParam* in <i>FunctionTypeParameters</i>
  * Let (*name*, *type*) be the verification of *optParam*.
  * Contribute (*name*, *type*) to *p*<sub>1</sub>.
* If <i>FunctionTypeParameters</i> contains <b>...</b> <i>TypedIdentifier</i> as *typeId*
  * Let (*name*, *type*) be the verification of *typedId*.
  * It is a verify error if *type* is not the `Array` type.
  * Assign *p*<sub>2</sub> = (*name*, *type*)
* Let *returnType* be the verification of <i>TypeExpression</i> preceded by the <b>:</b> result type prefix.
* Return a function type consisting of required parameters *p*<sub>0</sub>, optional parameters *p*<sub>1</sub>, rest parameter *p*<sub>2</sub> and return type *returnType*.

<i>TypedIdentifier</i> : <i>IdentifierName</i><br>
<i>FunctionTypeOptionalParameter</i> : <i>IdentifierName</i> <b>?</b>

* It is a verify error if no context type is given.
* Return (string of <i>IdentifierName</i>, context type)

<i>TypedIdentifier</i> : <i>IdentifierName</i> <b>:</b> <i>TypeExpression</i><br>
<i>FunctionTypeOptionalParameter</i> : <i>IdentifierName</i> <b>?</b> <b>:</b> <i>TypeExpression</i>

* Return (string of <i>IdentifierName</i>, verification of <i>TypeExpression</i>)

<i>TypeArguments</i> : <b>.</b> <b>&lt;</b> <i>TypeArgumentsList</i> <i>ParameterGreaterThan</i>

* Return the verification of each <i>TypeExpression</i> in <i>TypeArgumentsList</i> in a sequence.

[*PropertyIsVisible*]: #sec-propertyisvisible