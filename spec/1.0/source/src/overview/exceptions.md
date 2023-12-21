# Exceptions

JetWork supports checked exceptions and fatal exceptions. Fatal exceptions are unchecked errors that may occur during program execution.

```
function task(): void throws RangeError {
    throw new RangeError("Error");
}
fatalError("Fatal error");
```

Functions that throw checked exceptions must be immediately used in one the following ways:

* within a `f()?` expression;
* within a `f()!` expression;
* within a `f() ?? v` expression.

```
// Catch any exception and throw a fatal exception
task()!;

function task2(): void throws RangeError {
    // Propagate any exception from task() to task2
    task()?;
}

task2()!;
```

## Catching fatal exceptions

Fatal exceptions may be caught by using the `try` statement with the special `catch fatal` clause:

```
try {
    logic()
} catch fatal {
    logic()
}
```