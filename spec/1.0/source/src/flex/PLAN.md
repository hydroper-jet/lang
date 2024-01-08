* Package namespaces are identified by `package://` as in `package://com.ea.n4s`.
* `className` is replaced by `package` and the class name is inferred from the JXML file.

# Example

```xml
<?xml version="1.0"?>
<mx:Panel
    xmlns:fx="http://ns.jetwork.com/flex"
    xmlns:mx="library://ns.jetwork.com/flex/mx"
    xmlns:n4s="package://com.ea.n4s.ui"
    package="com.ea.n4s.ui">
    <n4s:HUD/>
</mx:Panel>
```

# Bindable meta-data

The `[Bindable]` meta-data might be reserved.

# Data binding

If the expression of a brackets attribute value is a reference to a bindable property, it is a data binding.

# Constructor

A Flex component cannot customize its constructor. It is always a constructor that takes zero arguments.