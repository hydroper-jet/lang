# Array initializer

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>ArrayInitializer</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>Elision</i><sub>opt</sub> <b>]</b> <i>InitializerContextType</i><sub>opt</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>ElementList</i> <b>]</b> <i>InitializerContextType</i><sub>opt</sub></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>[</b> <i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <b>]</b> <i>InitializerContextType</i><sub>opt</sub></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>InitializerContextType</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>:</b> <i>TypeExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>Elision</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>,</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i> <b>,</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>ElementList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i><sub>opt</sub> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Elision</i><sub>opt</sub> <i>InitializerRest</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>AssignmentExpression</i><sup>allowIn</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>InitializerRest</i></td>
    </tr>
</table>

**Semantics**

The array initializer may be used to initialize the following context types:

* `*`
* `Object` or `Object?`
* `T` or `T?` where `T` is a tuple type
* `[T]` or `[T]?`
* `E` or `E?` where `E` is a set enumeration

Initializing a context type that is one of { `*`, `Object`, `Object?` } results into an `Array.<*>` object.

The default context type is the `[*]` type (`Array.<*>`).

**Verification**

The context type is either the verification of the type expression in <i>InitializerContextType</i> or the initially given context type.

*VerifyRest*(*r*, `T`) internal function

* Verifying the expression of the <i>InitializerRest</i> nonterminal symbol *r* must return a value where either whose static type includes the `values` proxy that returns `Iterator.<T>` or where whose static type is a subtype of `Iterator.<T>`.

An element item corresponds to either an <i>Elision</i>, <i>AssignmentExpression</i><sup>allowIn</sup> or <i>InitializerRest</i>, from left-to-right.

When verifying *ArrayInitializer*, if the context type is one of { `*`, `Object`, `Object?` }:

* For each element item *elem*
  * If *elem* is <i>InitializerRest</i>
    * *VerifyRest*(*elem*, `*`)
  * Else if *elem* is <i>AssignmentExpression</i><sup>allowIn</sup>
    * Verify *elem*
* Return a value of type `[*]`.

When verifying *ArrayInitializer*, if the context type is `T` or `T?`, where `T` is a tuple type:

* For each element index *i* element item *elem*
  * If *elem* is <i>,</i>
    * Throw a verify error
  * Else if *elem* is <i>InitializerRest</i>
    * Throw a verify error
  * Else if *elem* is <i>AssignmentExpression</i><sup>allowIn</sup>
    * It is a verify error if *i* is equals or greater than the element length of `T`.
    * Limit *elem* to the *i*th element type of `T`.
* Return a value of the context type.

When verifying *ArrayInitializer*, if the context type is `[T]` or `[T]?`:

* For each element item *elem*
  * If *elem* is <i>,</i>
    * Throw a verify error
  * Else if *elem* is <i>InitializerRest</i>
    * *VerifyRest*(*elem*, `T`)
  * Else if *elem* is <i>AssignmentExpression</i><sup>allowIn</sup>
    * Limit *elem* to `T` type.
* Return a value of the context type.

When verifying *ArrayInitializer*, if the context type equals `E` or `E?` where `E` is a set enumeration:

* Let *c* be zero.
* Let *isConst* be true.
* For each element item *elem*
  * If *elem* is <i>,</i>
    * Throw a verify error
  * Else if *elem* is <i>InitializerRest</i>
    * Throw a verify error
  * Else if *elem* is <i>AssignmentExpression</i><sup>allowIn</sup>
    * Let *c1* be the result of limiting *elem* to the `E` type.
    * If *c1* is an `enum` constant and *isConst* is true
      * Assign *c* = bitwise OR(*c*, number of *c1*)
    * Else
      * Assign *isConst* = false
* If *isConst* is true
  * Return an `enum` constant with number *c* and static type as the context type.
* Return a value of the context type.