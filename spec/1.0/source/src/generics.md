# Generics

The language supports generic types and functions attached with a sequence of type parameters. 

```
class C.<T> {}
function f.<T>(): void {}
```

**Syntax**

<table>
    <tr>
        <td colspan="2"><i>TypeParameters</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><b>. &lt;</b> <i>TypeParameterList</i> <b>&gt;</b></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeParameterList</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeParameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>TypeParameterList</i> <b>,</b> <i>TypeParameter</i></td>
    </tr>
</table>

<table>
    <tr>
        <td colspan="2"><i>TypeParameter</i></td>
    </tr>
    <tr>
        <td>&nbsp;</td><td><i>Identifier</i></td>
    </tr>
</table>

## Polymorphism

The language uses polymorphism for generic types and functions, but certain implementations are allowed to not use polymorphism for the `Array` class applied with a [primitive type](types.md#primitive-types) such as a number type. With polymorphism, type parameters are substituted in runtime by the `*` type in most implementations and additional compile-time type checking occurs when using the generic type or function.

## Constraints

The language does not support constraints on type parameters in the present, such as those present in the Java language.