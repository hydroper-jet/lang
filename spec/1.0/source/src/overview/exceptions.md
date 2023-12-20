# Exceptions

JetWork supports checked exceptions and fatal exceptions. Fatal exceptions are not caught by user code in JetWork.

```
function task(): void throws RangeError {
    throw new RangeError("Error");
}
fatalError("Fatal error");
```

Functions that throw checked exceptions must be immediately used in one the following ways:

* within a `try` statement;
* within a `f()?` expression;
* within a `f()!` expression;
* within a `f() ?? v` expression.

```
// Turn any checked exception into a fatal exception
task()!;

function task2(): void throws RangeError {
    // Propagate any exception from task() to task2
    task()?;
}

task2()!;
```