# Nullability

The `Optional.<T>` class is the primary way of working with nullable data.

* The nullish coalescing operator returns the right operand if the left operand is `undefined`.

```
public class ExampleClass {
    public const data: Optional.<Number>;
    public function ExampleClass(data: Optional.<Number>) {
        this.data = data;
    }
    public function doubleIt(): ExampleClass (
        new ExampleClass((this.data ?? 0) * 2)
    );
}
// 0
trace(new ExampleClass(undefined).doubleIt().data);
// 20
trace(new ExampleClass(10).doubleIt().data);
```

* The non-null operator ensures the operand is not `undefined`.

```
// TypeError
trace(new ExampleClass(undefined).data!);
```

* The optional chaining operator returns `undefined` if the base object is `undefined`.

```
public function process(a: Optional.<Number>): Optional.<String> (
    a?.toString(16)
);
```

## Transparency

The representation of the `Optional.<T>` type varies across implementations:

* The `Optional.<T>` type is equivalent to a nullable reference as in ActionScript.
  * ActionScript transpilation may consider interning primitive values into a weak dictionary.
* The `v is Optional.<T>` expression has implementation-defined behavior. Programmers should not rely on such expression.