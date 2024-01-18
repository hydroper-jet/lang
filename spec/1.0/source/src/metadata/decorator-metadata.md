# Decorator meta-data

A decorator meta-data invokes an user function, either at class instance initialization, at type initialization, or instance method initialization.

Decorator meta-data may only be applied to instance variables, instance methods, and type definitions.

## Instance variables

A decorator meta-data applied to an instance variable must contain a signature `function(instance: C, name: String, type: Class): void`, where `C` is the instance class.

```
function ExampleDecorator(instance: ExampleClass, name: String, type: Class): void {
    /* ExampleDecorator... */
}
class ExampleClass {
    [ExampleDecorator]
    public var x: Number;
}
```

## Instance methods

A decorator meta-data applied to an instance method must contain a signature `function(instance: C, name: String): void`, where `C` is the instance class.

```
function ExampleDecorator(instance: ExampleClass, name: String): void {
    /* ExampleDecorator... */
}
class ExampleClass {
    [ExampleDecorator]
    public function f(): void {}
}
```

## Types

A decorator meta-data applied to a type definition must contain a signature `function(type: Class): void`.

```
function ExampleDecorator(type: Class): void {
    /* ExampleDecorator... */
}
[ExampleDecorator]
class ExampleClass {}
```