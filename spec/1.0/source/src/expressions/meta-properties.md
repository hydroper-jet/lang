# Meta Properties

**Syntax**

<ul>
    <i>MetaProperty</i> :
    <ul>
        <i>ImportMeta</i>
    </ul>
</ul>

<ul>
    <i>ImportMeta</i> :
    <ul>
        <b>import</b> <b>.</b> <b>meta</b>
    </ul>
</ul>

**Semantics**

The **import.meta** expression returns the **import.meta** symbol. The **import.meta** symbol is a value is of the any type (**\***) and returns **undefined** wherever used unless a property accessor follows the expression.