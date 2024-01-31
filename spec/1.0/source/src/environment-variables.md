# Environment variables

The `import.meta.env` accessor returns a special symbol that loads environment variables from an optional `.env` file from a project.

```plain
import.meta.env.EXAMPLE
```

*.env*

```plain
# Example variable
EXAMPLE=value
```