# Setters

A setter is a method that belongs to a virtual property, used as a way to assign the value of the property.

```
function set x(v: T): void {}
```

**Restrictions**

A setter must not be asynchronous; that is, it must not contain the **await** operator.

A setter must not be a generator; that is, it must not contain the **yield** operator.