package com.google.common.eventbus;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: guava-15.0.jar:com/google/common/eventbus/SynchronizedEventHandler.class */
final class SynchronizedEventHandler extends EventHandler {
    public SynchronizedEventHandler(Object target, Method method) {
        super(target, method);
    }

    @Override // com.google.common.eventbus.EventHandler
    public void handleEvent(Object event) throws InvocationTargetException {
        synchronized (this) {
            super.handleEvent(event);
        }
    }
}
