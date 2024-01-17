# Compilation and transpilation

Jet compiles to the Jet Bytecode. Jet Bytecode can be compiled to other languages or be executed by a virtual machine.

Jet can be both compiled to native code or transpiled to another object-oriented high-level language.

## Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.

## Platform-specific operations

It is allowed for platforms that compile the bytecode form into another form to define specific external operations as `native` functions.

For example, for interoperability between the Jet and Lua languages during a transpilation process, it may be required to support specific operations to compute table indices and access the Lua environment.