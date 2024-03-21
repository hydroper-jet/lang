# Identifiers

**Syntax**

```
x
*
q::x
q::[k]     ;
(q)::x     ;
(q)::[k]   ;
@x
@[k]
@q::x
@q::[k]
@(q)::x
@(q)::[k]
```

The qualifier identifiers **fixed** and **dynamic** are context keywords used for indicating a property disambiguation.

```
o.fixed::x
o.dynamic::x
```

<ul>
    <i>PropertyIdentifier</i> :
    <ul>
        <i>Identifier</i> [when keywords are enabled]<br>
        <i>IdentifierName</i> [when keywords are disabled]<br>
        <b>*</b>
    </ul>
</ul>

<ul>
    <i>Qualifier</i> :
    <ul>
        <i>PropertyIdentifier</i>
    </ul>
</ul>

<ul>
    <i>SimpleQualifiedIdentifier</i> :
    <ul>
        <i>PropertyIdentifier</i><br>
        <i>Qualifier</i> <b>::</b> <i>PropertyIdentifier</i><br>
        <i>Qualifier</i> <b>::</b> <i>Brackets</i>
    </ul>
</ul>

<ul>
    <i>ExpressionQualifiedIdentifier</i> :
    <ul>
        <i>ParenExpression</i> <b>::</b> <i>PropertyIdentifier</i><br>
        <i>ParenExpression</i> <b>::</b> <i>Brackets</i>
    </ul>
</ul>

<ul>
    <i>NonAttributeQualifiedIdentifier</i> :
    <ul>
        <i>SimpleQualifiedIdentifier</i><br>
        <i>ExpressionQualifiedIdentifier</i>
    </ul>
</ul>

<ul>
    <i>QualifiedIdentifier</i> :
    <ul>
        <b>@</b> <i>Brackets</i><br>
        <b>@</b> <i>NonAttributeQualifiedIdentifier</i><br>
        <i>NonAttributeQualifiedIdentifier</i>
    </ul>
</ul>

**Verification**

The *Identifier* and *IdentifierName* productions of *PropertyIdentifier* result into a string consisting of the respective identifier characters. The <b>*</b> production of *PropertyIdentifier* results into the <b>*</b> string.

* Let *disambiguation* be **default**.

The qualifier *PropertyIdentifier* preceding the <b>::</b> punctuator is treated as follows:

* If it is equals **fixed** or **dynamic**
  * Assign *disambiguation* = string of *PropertyIdentifier*
* Else
  * Let *qid* be the translation of it into a *PrimaryExpression* **:** *QualifiedIdentifier*.
  * Verify *qid* as such production limited to the **Namespace** type.
  * Let the qualifier be the value of *qid*.

The qualifier *ParenExpression* preceding the <b>::</b> punctuator is treated as follows:

* Limit the *ParenExpression* symbol to the **Namespace** type.

*Brackets* must be of the **String** type.

Verifying *QualifiedIdentifier* results into a (*qual*, *key*, *disambiguation*) group consisting of an optional qualifier **Namespace** object, a key **String** value and *disambiguation* respectively.

**Evaluation**

The qualifier *PropertyIdentifier* preceding the <b>::</b> punctuator translates to a *PrimaryExpression* **:** *QualifiedIdentifier* and is evaluated as such production.