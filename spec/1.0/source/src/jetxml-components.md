# JetXML components

<!--

JetXML components:
* Main XML namespace: jetxml
* Attribute constants:
  * `Optional.<N>` where `N` is a number type: accepts an attribute constant of `N` type
  * `NF` where `NF` is a floating point type: accepts a floating point, `-Infinity`, `+Infinity`, `Infinity`, and `NaN`
  * `Boolean` allows for `true` and `false`
  * `String` allows for any attribute value
  * Non-Set `enum` allows for a member string
  * `Optional.<E>` where `E` is a non-Set `enum` allows for a member string
  * Set `enum` allows for comma-separated member strings
  * `Optional.<E>` where `E` is a Set `enum` allows for comma-separated member strings
  * Any other type may not be expressed as an attribute constant.

-->