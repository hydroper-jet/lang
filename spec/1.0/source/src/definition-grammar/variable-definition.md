# Variable Definition

**Syntax**

<ul>
    <i>VariableDefinition</i><sup>β</sup> :
    <ul>
        <i>VariableDefinitionKind</i> <i>VariableBindingList</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>VariableDefinitionKind</i> :
    <ul>
        <b>var</b><br>
        <b>const</b>
    </ul>
</ul>

<ul>
    <i>VariableBindingList</i><sup>β</sup> :
    <ul>
        <i>VariableBinding</i><sup>β</sup><br>
        <i>VariableBindingList</i><sup>β</sup> <b>,</b> <i>VariableBinding</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>VariableBinding</i><sup>β</sup> :
    <ul>
        <i>TypedDestructuring</i> <i>VariableInitialization</i><sup>β</sup>
    </ul>
</ul>

<ul>
    <i>VariableInitialization</i><sup>β</sup> :
    <ul>
        «empty»<br>
        <b>=</b> <i>AssignmentExpression</i><sup>β</sup>
    </ul>
</ul>

**Local variables**

Variables of an activation are block-scoped and shadow any previous definition.

```
const x: String = ""
const x: Number = 0
```

**Type inference**

If a variable has no type annotation and but has an initializer, its static type is that of the initializer. If a variable has no type annotation and no initializer, the variable is of the **\*** type.

```
// x: *
var x
// x: Number
var x = 10
for each (var v in ["x", "y"]) {
    // v: *
}
function f(a) {
    // a: *
}
```

**Semantics**

A *VariableDefinition* may be modified by the following attributes:

| Attribute       | Description |
| --------------- | ----------- |
| **static**        | Assigns property to (*enclosing class*).\[\[*StaticProperties*\]\]. |
| **public**        | Uses the **public** visibility |
| **private**       | Uses the **private** visibility |
| **protected**     | Uses the **protected** visibility |
| **internal**      | Uses the **internal** visibility (default) |