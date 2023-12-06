# Compilation and transpilation

JetWork compiles to the JetWork Virtual Machine Bytecode, which, in turn, can be compiled to other languages or be executed by a virtual machine.

JetWork can be compiled to native code and can be transpiled to another object-oriented high-level language.

## Number overflow

Operations whose result cannot be represented due to range limit cause a number overflow, such as `Int.MAX_VALUE + 1`. The result of a number overflow is implementation defined.