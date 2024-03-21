# Methods

A method represents an invokable symbol that takes zero or more parameters and returns a value.

## Internal properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the method. |
| \[\[*Signature*\]\] | A static function type describing the method signature. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the method. |
| \[\[*Parent*\]\] | The parent definition of the method. |
| \[\[*IsGenerator*\]\] | Indicates whether the method is a generator. |
| \[\[*IsAsync*\]\] | Indicates whether the method is asynchronous. |
| \[\[*IsNative*\]\] | Indicates whether the method is native. |
| \[\[*IsOptionalInterfaceMethod*\]\] | Indicates whether the method is an optional interface method. |
| \[\[*IsOverriding*\]\] | Indicates whether the method is overriding another method. |
| \[\[*IsFinal*\]\] | Indicates whether the method is final. |
| \[\[*IsAbstract*\]\] | Indicates whether the method is abstract. |
| \[\[*IsConstructor*\]\] | Indicates whether a method is a constructor. |
| \[\[*OfVirtualProperty*\]\] | Indicates the virtual property to which a getter or setter belongs. |
| \[\[*Activation*\]\] | The activation scope of the method. |
| \[\[*Metadata*\]\] | Meta-data attached to the method. |

## Generators

A method is a **generator** if it contains the **yield** operator.

* Non asynchronous generators return **Iterator.&lt;T>**.
* Asynchronous generators return **Iterator.&lt;Promise.&lt;T>>**.

```
function f() {
    for (var i = 0; i < 10; ++i) {
        yield i
    }
}
```

## Asynchronous Methods

A method is **asynchronous** if it contains the **await** operator.

* Non generator asynchronous methods return **Promise.&lt;T>**.
* Asynchronous generators return **Iterator.&lt;Promise.&lt;T>>**.

```
function f() { await f1() }
```

## Native Methods

A method is **native** if it contains the **native** attribute.

```
native function f(): void
```

## Meta Data

A method may contain zero or more meta-data.

```
[N1(n2)]
function f() {}
```