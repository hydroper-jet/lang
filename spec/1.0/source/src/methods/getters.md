# Getters

A getter is a method that belongs to a virtual property, used as a way to retrieve the value of the property.

```
function get x(): T (v);
```

**Restrictions**

A getter must not be asynchronous; that is, it must not contain the **await** operator.

A getter must not be a generator; that is, it must not contain the **yield** operator.