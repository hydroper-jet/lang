# JetWork for XML

JetWork for XML (J4X) adds XML capabilities to the JetWork language. It is based on the legacy ECMAScript for XML standard (ECMA-357 second edition).

```
const person = <Person>
    <name>Razen</name>
    <interest type="farming" rate="0.5"/>
    <interest type="quantumPhysics" rate="1"/>
</Person>

trace(person.name.toString())
trace(Number(person..interest.(@type == "quantumPhysics")[0].@rate) == 1)
```