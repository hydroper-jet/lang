# Proxy

JetWork operators can be customized through *proxies*.

Proxies are special methods defined with the `proxy` attribute. Here is an example class that overrides the addition operator:

```
public final class AdditiveExample {
    public const value: Number;
    public function AdditiveExample(value: Number) {
        this.value = value;
    }
    proxy function add(right: AdditiveExample): AdditiveExample (
        new AdditiveExample(this.value + right.value)
    );
}
```