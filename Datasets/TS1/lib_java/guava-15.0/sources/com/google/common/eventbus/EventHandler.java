package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.Nullable;

/* loaded from: guava-15.0.jar:com/google/common/eventbus/EventHandler.class */
class EventHandler {
    private final Object target;
    private final Method method;

    EventHandler(Object target, Method method) {
        Preconditions.checkNotNull(target, "EventHandler target cannot be null.");
        Preconditions.checkNotNull(method, "EventHandler method cannot be null.");
        this.target = target;
        this.method = method;
        method.setAccessible(true);
    }

    public void handleEvent(Object event) throws InvocationTargetException {
        Preconditions.checkNotNull(event);
        try {
            this.method.invoke(this.target, event);
        } catch (IllegalAccessException e) {
            throw new Error("Method became inaccessible: " + event, e);
        } catch (IllegalArgumentException e2) {
            throw new Error("Method rejected target/argument: " + event, e2);
        } catch (InvocationTargetException e3) {
            if (e3.getCause() instanceof Error) {
                throw ((Error) e3.getCause());
            }
            throw e3;
        }
    }

    public String toString() {
        return "[wrapper " + this.method + "]";
    }

    public int hashCode() {
        return ((31 + this.method.hashCode()) * 31) + System.identityHashCode(this.target);
    }

    public boolean equals(@Nullable Object obj) {
        if (obj instanceof EventHandler) {
            EventHandler that = (EventHandler) obj;
            return this.target == that.target && this.method.equals(that.method);
        }
        return false;
    }
}
