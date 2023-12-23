# Exceptions

JetWork supports throwing errors as in Java, in the form of unchecked exceptions that may occur during program execution.

```
function task(): void {
    throw new RangeError("Error")
}
try {
    doSomething()
} catch (error: RangeError) {
    doSomething()
}
```

Documentation comments use the `@throws` tag to document thrown errors, as in:

```
package com.mrrunner {
    /**
     * @throws com.mrrunner.MrRunnerError Thrown when run is a failure.
     */
    public function run(): void {
        /* ... */
    }
}
```