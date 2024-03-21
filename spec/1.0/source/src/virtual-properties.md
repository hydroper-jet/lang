# Virtual Properties

A virtual property is an accessor that may be used as a variable.

A virtual property is **read-only** if it has only a getter.

A virtual property is **write-only** if it has only a setter.

Getter and setter are methods that belong to the virtual property.

```
function get x(): T (v);
function set x(v: T): void {}
```

## Internal Properties

| Property | Description |
| -------- | ----------- |
| \[\[*Name*\]\] | The non qualified name of the virtual property. |
| \[\[*Type*\]\] | The type of the virtual property, inferred from the getter or setter. |
| \[\[*Visibility*\]\] | The [visibility](#sec-visibility) of the virtual property. |
| \[\[*Parent*\]\] | The parent definition of the virtual property. |
| \[\[*ReadOnly*\]\] | Indicates whether the virtual property is read-only or not. |
| \[\[*WriteOnly*\]\] | Indicates whether the virtual property is write-only or not. |
| \[\[*Getter*\]\] | Indicates the getter method of the virtual property. |
| \[\[*Setter*\]\] | Indicates the setter method of the virtual property. |