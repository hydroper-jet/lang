# JetDoc

* [ ] Document JetDoc

## JetDoc event documentation

Use `@event` to declare an event and modify it with `@eventConstant` and `@eventType`.

```
package {
    import air.events.EventDispatcher

    /**
     * @event eventName Description.
     * @eventConstant Event.EVENT
     * @eventType Event
    */
    public class C extends EventDispatcher {}
}
```