# Exceptions

JetWork supports checked exceptions and fatal exceptions. Fatal exceptions are not caught by user code in JetWork.

```
function task(): void throws RangeError {
    // Throw a checked exception
    throw new RangeError("Error");
}

// Throw a fatal exception
fatalError("Error");
```

Functions that throw checked exceptions return a `Result` object. Ignoring a `Result` object is a strict error.

```
task(); // Not allowed
task()!; // Fine; throws fatal exception

function task2(): void throws RangeError {
    task()?; // Fine; propagates error to `task2`
}

task2()!; // Fine
```