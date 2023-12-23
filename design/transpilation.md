# Transpilation

## Lua

* Thrown errors are translated to `error()` calls with a message containing a random ID. A weak-key table maps from a random ID to the error object.