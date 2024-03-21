# Scripts

Script packages are treated in a special manner:

* Their **platform** attribute is initially set to **http:&#x2F;&#x2F;www.nodejs.org/2009**.

## build

The **build** script, if any, is executed before any build of the enclosing package occurs.

*Note: in case the result of executing the build script is frozen in cache and any of its dependencies or source files are updated, it is recommended to re-execute the build script.*

The following is an example manifest describing a package containing a **build** script:

```json
{
    "id": "com.n1.n2",
    "version": "0.1.0",
    "platform": "http://example.com",
    "scripts": {
        "build": {
            "compilerOptions": {
                "sources": ["build.jet"]
            }
        }
    }
}
```