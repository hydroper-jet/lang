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

* The non-erroneous assertion operator ensures the operand is not `undefined` and not an exception.

```
// Fatal exception
trace(new ExampleClass(undefined).data!);
```

* For `Optional.<T>`, the error propagation operator returns `undefined` from the enclosing function or containing `try` expression if the operand is `undefined`.

```
public function process(a: Optional.<Number>): Optional.<String> (
    a?.toString(16)
);
```