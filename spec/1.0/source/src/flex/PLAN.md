* Package namespaces are identified by `package://` as in `package://com.ea.n4s`.
* `className` is replaced by `package` and the class name is inferred from the JXML file.

# Example

```xml
<?xml version="1.0"?>
<mx:Panel
    xmlns:fx="http://ns.jet.com/flex"
    xmlns:mx="library://ns.jet.com/flex/mx"
    xmlns:n4s="package://com.ea.n4s.ui"
    package="com.ea.n4s.ui">
    <n4s:HUD/>
</mx:Panel>
```

# Children

```xml
<fx:Children/>
```

# Component set

New component sets are designated by using a JXML file with a root `<library>` element.

```xml
<?xml version="1.0"?>
<library uri="library://ns.ea.com/n4s">
    <package>com.ea.n4s.ui</package>
    <package>com.ea.n4s.ui.advanced</package>
</library>
```

# Bindable meta-data

The `[Bindable]` meta-data might be reserved.

# Data binding

If the expression of a brackets attribute value is a reference to a bindable property, it is a data binding.

# Constructor

A Flex component cannot customize its constructor. It is always a constructor that takes zero arguments.