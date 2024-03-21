# Asynchronous and generators

Specify the behavior of the `return` statement, the `yield` operator and `await` operator carefully, since the enclosing asynchronous method may also be a generator method.

Possible combinations:

* `yield`
* `await`
* `await` + `yield`