# Postfix expressions

**Semantics**

*Property operator*: For an expression *E* consisting of a non qualified identifier followed by one or more property operators of non qualified identifier and the left-to-right name sequence *S* of *E*:

* If *S* matches the full package name of a property *P1* from the current scope \[\[*Imports*\]\] internal property, the expression resolves to *WrapPropertyReference*(*P1*).

```
import com.qux.bar.BarType
com.qux.bar.BarType.BETA
```

* If *S* minus the trailing name matches the full package name of a package *P1* from the current scope \[\[*OpenPackages*\]\] internal property
  * Let *r* be *ResolveProperty*(*P1*, undefined, trailing name of *S*)
  * If *r* is not undefined, the expression *E* resolves to *r*.

```
import com.qux.bar.*
com.qux.bar.BarType.BETA
```

* If *S* minus the trailing name matches the name of a package alias *P1* from the current scope \[\[*PackageAliases*\]\] internal property
  * Let *r* be *ResolveProperty*(*P1*, undefined, trailing name of *S*)
  * If *r* is not undefined, the expression *E* resolves to *r*.

```
import b = com.qux.bar.*
b.BarType.BETA
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>PostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>ShortNewExpression</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>FullPostfixExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>PrimaryExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>MetaProperty</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullNewExpression</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>SuperExpression</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>NonNull</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>QueryOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> [no line break] <b>++</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> [no line break] <b>--</b></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>FullPostfixExpression</i> <i>OptionalChaining</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>NonNull</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>!</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>OptionalChaining</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>QualifiedIdentifier</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>Brackets</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>?.</b> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>PropertyOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>NonNull</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>Arguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>TypeArguments</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>QueryOperator</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>OptionalChaining</i> <i>OptionalChaining</i></td>
    </tr>
</table>