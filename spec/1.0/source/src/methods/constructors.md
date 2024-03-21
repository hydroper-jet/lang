# Constructors

A constructor is a method whose name matches that of the directly enclosing **class**.

```
class C1 {
    function C1() {}
}
```

**Restrictions**

A constructor must not be asynchronous; that is, it must not contain the **await** operator.

A constructor must not be a generator; that is, it must not contain the **yield** operator.

It is a verify error if the constructor contains no **super();** statement and the constructor of the parent class contains a non-empty parameter list.

A constructor is allowed to perform assignments to instance constants.

A constructor is allowed to contain a single **super();** statement.