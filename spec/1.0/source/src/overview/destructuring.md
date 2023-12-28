# Destructuring

Destructuring patterns are used to extract components from a base value into variables. Here is a basic example:

```
const {x, y} = f()
var [x1, y1] = f1()
[x1, y1] = f2([x1 + x, y1 + y])
```

The language allows the non-null operator within destructuring patterns:

```
const [x, y]! = f2()
```