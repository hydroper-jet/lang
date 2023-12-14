# Constructors

A constructor is a function whose name matches the enclosing class's name.

* A constructor must not be generic.
* A constructor must not be asynchronous.
* A constructor must not be a generator.
* It is a verify error if the constructor has no `super();` statement and the constructor of the parent class has a non-empty parameter list.
* A constructor is allowed to perform assignments to constant instance variables.
* A constructor is allowed to contain a single `super();` statement.