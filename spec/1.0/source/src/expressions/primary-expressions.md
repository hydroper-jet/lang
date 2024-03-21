# Primary Expressions

**Syntax**

<ul>
    <i>PrimaryExpression</i> :
    <ul>
        <i>NullLiteral</i><br>
        <i>BooleanLiteral</i><br>
        <i>NumericLiteral</i><br>
        <i>StringLiteral</i><br>
        <i>ThisLiteral</i><br>
        <i>RegularExpressionLiteral</i><br>
        <i>QualifiedIdentifier</i><br>
        <i>XMLInitializer</i><br>
        <i>ParenListExpression</i><br>
        <i>ArrayLiteral</i><br>
        <i>ObjectInitializer</i><br>
        <i>EmbedExpression</i>
    </ul>
</ul>

<ul>
    <i>NullLiteral</i> :
    <ul>
        <b>null</b>
    </ul>
</ul>

<ul>
    <i>BooleanLiteral</i> :
    <ul>
        <b>true</b><br>
        <b>false</b>
    </ul>
</ul>

<ul>
    <i>ThisLiteral</i> :
    <ul>
        <b>this</b>
    </ul>
</ul>

**Verification**

<i>PrimaryExpression</i> : <i>NullLiteral</i>

* If the context type is **T?**
  * Return a **null** constant of the context type.
* Return a **null** constant of the **\*** type.

<i>PrimaryExpression</i> : <i>NumericLiteral</i>

* If the context type is **N** or **N?** where **N** is a number type
  * Return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the context type.
* Return a number constant consisting of the <i>NumericLiteral</i> mathematical value of the **Number** type.

<i>PrimaryExpression</i> : <i>StringLiteral</i>

* If the context type is **Char** or **Char?**
  * It is a verify error if the string of <i>StringLiteral</i> does not consist of a single Unicode Scalar Value.
  * Return a **Char** constant of the context type whose value is the first Unicode Scalar Value of the <i>StringLiteral</i> string.
* If the context type is **E** or **E?** where **E** is an **enum**
  * Let *s* be the string of <i>StringLiteral</i>.
  * It is a verify error if **E** contains no **enum** member with a string equals *s*.
  * Return an **enum** constant, of the context type, identifying the **enum** member of **E** with a string equals *s*.
* Return a string constant of the **String** type consisting of the string of <i>StringLiteral</i>.

<i>PrimaryExpression</i> : <i>QualifiedIdentifier</i>

* Let (*qual*, *key*, *disambiguation*) be the result of verifying the nonterminal symbol on right-hand side of the production.
* Let *r* be *ResolveProperty*(*enclosing scope*, *qual*, *key*, *disambiguation*).
* It is a verify error if *r* is undefined.
* It is a verify error if [*PropertyIsVisible*](*r*, *enclosing scope*) is false.
* It is a verify error if *r* is a reference value that references a parameterized type and the expression is not followed by <i>TypeArguments</i>.
* If *r* is a reference value to a constant *c* where c.\[\[*ConstantInitializer*\]\] is not undefined
  * Return *c*.\[\[*ConstantInitializer*\]\]
* Return *r*.

<i>PrimaryExpression</i> : <i>ThisLiteral</i>

* Let *act* be the enclosing activation.
* It is a verify error if *act* is undefined or if *act*\[\[*This*\]\] is undefined.
* Return *act*\[\[*This*\]\].

<i>PrimaryExpression</i> : <i>RegularExpressionLiteral</i>

* Return a value of type **RegExp**.

<i>PrimaryExpression</i> : <i>BooleanLiteral</i>

* If <i>BooleanLiteral</i> is <b>true</b>, return a boolean constant of value **true** of the **Boolean** type.
* Return a boolean constant of value **false** of the **Boolean** type.

<i>PrimaryExpression</i> : <i>ParenListExpression</i><br>
<i>PrimaryExpression</i> : <i>EmbedExpression</i><br>
<i>PrimaryExpression</i> : <i>XMLInitializer</i><br>
<i>PrimaryExpression</i> : <i>ArrayLiteral</i><br>
<i>PrimaryExpression</i> : <i>ObjectInitializer</i>

* Return the result of verifying the nonterminal symbol on right-hand side of the production.

[*PropertyIsVisible*]: #sec-propertyisvisible