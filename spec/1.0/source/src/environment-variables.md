# Environment variables

The `import.meta.env` expression returns the special `import.meta.env` value that loads environment variables from an optional `.env` file from a project.

```plain
import.meta.env.EXAMPLE
```

*.env*

```plain
# Example variable
EXAMPLE=value
```

The `import.meta.env` value has the any type (`*`) and returns `undefined` wherever used.