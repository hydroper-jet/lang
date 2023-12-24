# Visibility

A visibility is either `public`, `private`, `protected` or `internal`:

| Visibility | Description |
| ---------- | ----------- |
| `public` | The `public` visibility indicates that a property is accessible from anywhere. |
| `private` | The `private` visibility indicates that a property is accessible from within a class block. |
| `protected` | The `protected` visibility indicates that a property is accessible from a class and any subclasses. |
| `internal` | The `internal` visibility indicates that a property is accessible from the enclosing package, excluding subpackages. |

* When a property is not `public`, it is not allowed for such property to be found at runtime.
* When a property is not `public`, it is not contained in the runtime type information.