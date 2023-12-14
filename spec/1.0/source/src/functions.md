# Functions

A function consists of a name, a static function type as function signature, a [visibility](visibility.md), and miscellaneous.

## Parent definition

When the parent definition of a function is a package, the function has a fully package qualified name.

## Generics

A function may be [generic](generics.md):

```
function f.<T>(): void {}
```

## Generators

A function is a generator if it contains the `yield` operator.

* Non asynchronous generators return `Generator.<T>`.
* Asynchronous generators return `Generator.<Promise.<T>>`.

## Asynchronous functions

A function is asynchronous if it contains the `await` operator.

* Non generator asynchronous functions return `Promise.<T>`.
* Asynchronous generators return `Generator.<Promise.<T>>`.

## Native functions

A function is native if it contains the `native` attribute.

```
native function f(): void;
```