# Function expression

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>FunctionExpression</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>function</b> <i>FunctionCommon</i><sup>β</sup></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>function</b> <i>IdentifierName</i> <i>FunctionCommon</i><sup>β</sup></td>
    </tr>
</table>

**Semantics**

The `function` expression results in an object of a function type compliant to the function signature. The language does not perform type inference on function signatures.

```
// 30
trace([10, 20].reduce(function(acc: Number, v: Number): Number (acc + v), 0));
```

A call to a function resulting from a `function` expression has implementation-defined behavior: the number of formal parameters may or may not be restricted to the number of call arguments.

**Verification**

<i>FunctionExpression</i><sup>β</sup> : <b>function</b> <i>FunctionCommon</i><sup>β</sup><br>
<i>FunctionExpression</i><sup>β</sup> : <b>function</b> <i>IdentifierName</i> <i>FunctionCommon</i><sup>β</sup>

* Let *act* be an activation scope.
* Let *signature* be the result of verifying the <i>FunctionSignature</i> symbol within <i>FunctionCommon</i> by passing *act* as the activation scope *act*, therefore contributing properties to *act*.
* Let *f* be a function.
* If the <i>IdentifierName</i> symbol appears
  * Assign *f*\[\[*Name*\]\] = <i>IdentifierName</i> string
* Assign *f*\[\[*IsGenerator*\]\] = true if the `yield` operator appears within the function body or false otherwise
* Assign *f*\[\[*IsAsync*\]\] = true if the `await` operator appears within the function body or false otherwise
* Assign *f*\[\[*Signature*\]\] = *signature*
* Assign *act*\[\[*This*\]\] = (enclosing activation)\[\[*This*\]\] or undefined.
* Assign *act*\[\[*Function*\]\] = *f*
* Assign *f*\[\[*Activation*\]\] = *act*
* If *f*\[\[*Name*\]\] is a non empty string
  * It is a verify error if *act*\[\[*Properties*\]\]\[*f*\[\[*Name*\]\]\] is already defined.
  * Let *thisFunc* be a read-only variable of the *signature* type.
  * Assign *act*\[\[*Properties*\]\]\[*f*\[\[*Name*\]\]\] = *thisFunc*
* Call [*VerifyFunctionBody*](the *FunctionCommon* symbol, *act*, *f*, *signature*)
* Return a `function` value of the *signature* type and *act* activation.

[*VerifyFunctionBody*]: ../definitions/function-definition.md#verifyfunctionbody