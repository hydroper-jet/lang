# Generics

The language supports generic types and functions that consist of a sequence of type parameters. 

```
class C.<T> {}
function f.<T>(): void {}
```

## Polymorphism

The language uses polymorphism for generic types and functions, but certain implementations are allowed to not use polymorphism for the `Array` class applied with a [primitive type](types.md#primitive-types) such as a number type. With polymorphism, type parameters are substituted in runtime by the `*` type in most implementations and additional compile-time type checking occurs when using the generic type or function.

## Constraints

The language does not support constraints on type parameters in the present, such as those present in the Java language.