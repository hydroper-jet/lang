# Functions

A function represents an invokable symbol that takes parameters and returns a value.

Functions consist of the following internal properties:

| Internal property | Description |
| ----------------- | ----------- |
| \[\[*Name*\]\] | The unqualified name of the function. |
| \[\[*Signature*\]\] | A static function type describing the function signature. |
| \[\[*Visibility*\]\] | The [visibility](visibility.md) of the function. |
| \[\[*ParentDefinition*\]\] | The parent definition of the function. |
| \[\[*TypeParameters*\]\] | The type parameter sequence of the function if it is type parameterized. |
| \[\[*IsGenerator*\]\] | Indicates whether the function is a generator. |
| \[\[*IsAsync*\]\] | Indicates whether the function is asynchronous. |
| \[\[*IsNative*\]\] | Indicates whether the function is native. |
| \[\[*IsOptionalInterfaceMethod*\]\] | Indicates whether the function is an optional interface method. |
| \[\[*IsOverriding*\]\] | Indicates whether the function is overriding another function. |
| \[\[*IsFinal*\]\] | Indicates whether a method is final. |
| \[\[*IsAbstract*\]\] | Indicates whether a method is abstract. |
| \[\[*IsConstructor*\]\] | Indicates whether a function is a constructor. |
| \[\[*OfVirtualProperty*\]\] | Indicates the virtual property to which a getter or setter belongs. |
| \[\[*Activation*\]\] | The activation scope of the function. |
| \[\[*PlainMetadata*\]\] | Plain meta-data attached to the function. |

## Type parameters

A function may be [type parameterized](type-parameters.md):

```
function f.<T>(): void {}
```

## Generators

A function is a generator if it contains the `yield` operator.

* Non asynchronous generators return `Generator.<T>`.
* Asynchronous generators return `Generator.<Promise.<T>>`.

```
function f(): Number {
    for (var i = 0; i < 10; ++i) yield i
}
```

## Asynchronous functions

A function is asynchronous if it contains the `await` operator.

* Non generator asynchronous functions return `Promise.<T>`.
* Asynchronous generators return `Generator.<Promise.<T>>`.

```
function f(): void {
    await f1()
}
```

## Native functions

A function is native if it contains the `native` attribute.

```
native function f(): void;
```

## Meta data

A function may contain zero or more plain meta-data.

```
[N1(n2)]
function f1(): void {}
```