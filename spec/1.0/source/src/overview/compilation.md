# Compilation and transpilation

Jet can be compiled to other high-level languages or be executed by a virtual machine. For Jet support, a platform must provide its own compiler subset of the Jet Compiler that traverses the abstract syntax tree and compile-time symbols.

## Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.

## Platform-specific operations

It is allowed for platforms to define specific external operations as `native` functions.

For example, for interoperability between the Jet and Lua languages during a transpilation process, it may be required to support specific operations to compute table indices and access the Lua environment.