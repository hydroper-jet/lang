# Asynchronous and generators

Specify the behavior of the `return` statement, the `yield` operator and `await` operator carefully, since the enclosing asynchronous function may also be a generator function.

Possible combinations:

* `yield`
* `await`
* `await` + `yield`