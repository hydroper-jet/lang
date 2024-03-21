# Destructuring

**Syntax**

<ul>
    <i>Destructuring</i> :
    <ul>
        <i>Identifier</i> [if keywords are enabled]<br>
        <i>IdentifierName</i> [if keywords are disabled]<br>
        <i>ArrayDestructuring</i><br>
        <i>ObjectDestructuring</i><br>
        <i>Destructuring</i> <i>NonNull</i> [lookahead ∉ <i>NonNull</i>]
    </ul>
</ul>

<ul>
    <i>ArrayDestructuring</i> :
    <ul>
        <b>[</b> <i>Elision</i><sub>opt</sub> <b>]</b><br>
        <b>[</b> <i>DestructuringElementList</i> <b>]</b><br>
        <b>[</b> <i>DestructuringElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <b>]</b>
    </ul>
</ul>

<ul>
    <i>ObjectDestructuring</i> :
    <ul>
        <b>{</b> <i>DestructuringFields</i><sub>opt</sub> <b>}</b><br>
        <b>{</b> <i>DestructuringFields</i> <b>, }</b>
    </ul>
</ul>

<ul>
    <i>TypedDestructuring</i> :
    <ul>
        <i>Destructuring</i><br>
        <i>Destructuring</i> <b>:</b> <i>TypeExpression</i>
    </ul>
</ul>

<ul>
    <i>DestructuringElementList</i> :
    <ul>
        <i>Elision</i><sub>opt</sub> <i>Destructuring</i><sup>allowIn</sup><br>
        <i>Elision</i><sub>opt</sub> <i>DestructuringRest</i><br>
        <i>DestructuringElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>Destructuring</i><sup>allowIn</sup><br>
        <i>DestructuringElementList</i> <b>,</b> <i>Elision</i><sub>opt</sub> <i>DestructuringRest</i>
    </ul>
</ul>

<ul>
    <i>DestructuringRest</i> :
    <ul>
        <b>...</b> <i>Destructuring</i>
    </ul>
</ul>

<ul>
    <i>DestructuringFields</i> :
    <ul>
        <i>DestructuringField</i><br>
        <i>DestructuringFields</i> <b>,</b> <i>DestructuringField</i>
    </ul>
</ul>

<ul>
    <i>DestructuringField</i> :
    <ul>
        <i>FieldName</i> <i>NonNull</i><sub>opt</sub> <b>:</b> <i>Destructuring</i><sup>allowIn</sup><br>
        <i>IdentifierName</i> <i>NonNull</i><sub>opt</sub>
    </ul>
</ul>

**Semantics**

Array destructuring is allowed for the following context types:

* **\*** type — Yields **\*** typed elements.
* **\[T1, T2, ...\]** type — Yields tuple reference values.
* Classes defining a **getProperty**() proxy that takes the **Number** type
  * Yields proxy reference values.
  * Destructuring assignments require a corresponding **setProperty**() proxy in the same class.

```
const [x, y, , ,] = a
```

Object destructuring is allowed for any context type, except **void**.

```
const {x, y} = o
```

**Verification**