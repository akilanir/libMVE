package com.google.common.eventbus;

import com.google.common.annotations.Beta;
import com.google.common.base.Preconditions;
import com.google.common.eventbus.EventBus;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;

@Beta
/* loaded from: guava-15.0.jar:com/google/common/eventbus/AsyncEventBus.class */
public class AsyncEventBus extends EventBus {
    private final Executor executor;
    private final ConcurrentLinkedQueue<EventBus.EventWithHandler> eventsToDispatch;

    public AsyncEventBus(String identifier, Executor executor) {
        super(identifier);
        this.eventsToDispatch = new ConcurrentLinkedQueue<>();
        this.executor = (Executor) Preconditions.checkNotNull(executor);
    }

    public AsyncEventBus(Executor executor) {
        this.eventsToDispatch = new ConcurrentLinkedQueue<>();
        this.executor = (Executor) Preconditions.checkNotNull(executor);
    }

    @Override // com.google.common.eventbus.EventBus
    void enqueueEvent(Object event, EventHandler handler) {
        this.eventsToDispatch.offer(new EventBus.EventWithHandler(event, handler));
    }

    @Override // com.google.common.eventbus.EventBus
    protected void dispatchQueuedEvents() {
        while (true) {
            EventBus.EventWithHandler eventWithHandler = this.eventsToDispatch.poll();
            if (eventWithHandler != null) {
                dispatch(eventWithHandler.event, eventWithHandler.handler);
            } else {
                return;
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.google.common.eventbus.EventBus
    public void dispatch(final Object event, final EventHandler handler) {
        Preconditions.checkNotNull(event);
        Preconditions.checkNotNull(handler);
        this.executor.execute(new Runnable() { // from class: com.google.common.eventbus.AsyncEventBus.1
            @Override // java.lang.Runnable
            public void run() {
                AsyncEventBus.super.dispatch(event, handler);
            }
        });
    }
}
