| Property | Description |
| -------- | ----------- |
| \[\[*JXMLColor*\]\] | For a JXML base class, indicates the supported color class. |
| \[\[*JXMLVectors*\]\] | For a JXML base class, indicates the supported vector classes. |

## JXML meta-data

A JXML base class may contain a `JXML` meta-data with two optional options `colorClass` and `vectorClass` that specify the fully qualified name of a support class for the color and vector classes to use throughout XML attribute values in JXML files.

* It is a verify error if the fully qualified names specified within `JXML` do not resolve to a class.
* It is a verify error if the class specified by `colorClass` does not contain a constructor with the signature `function(...arguments: [*]): void`.
* It is a verify error if the class specified by `vectorClass` does not contain a constructor that takes parameters of a same number type.
* Only one `colorClass` occurrence is allowed, contributing the class to the annotated class \[\[*JXMLColor*\]\] property.
* Multiple `vectorClass` occurrences are allowed, contributing multiple classes to the annotated class \[\[*JXMLVectors*\]\] property.

```
package org.myEngine {
    [JXML(
        colorClass = org.myEngine.Color,
        vectorClass = org.myEngine.Vector,
        vectorClass = org.myEngine.Vector3D
    )]
    public abstract class Node implements JXML {
        /* JXML... */
    }
}
```