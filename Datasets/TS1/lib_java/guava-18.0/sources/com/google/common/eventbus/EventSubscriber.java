package com.google.common.eventbus;

import com.google.common.base.Preconditions;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import javax.annotation.Nullable;

/* loaded from: guava-18.0.jar:com/google/common/eventbus/EventSubscriber.class */
class EventSubscriber {
    private final Object target;
    private final Method method;

    EventSubscriber(Object target, Method method) {
        Preconditions.checkNotNull(target, "EventSubscriber target cannot be null.");
        Preconditions.checkNotNull(method, "EventSubscriber method cannot be null.");
        this.target = target;
        this.method = method;
        method.setAccessible(true);
    }

    public void handleEvent(Object event) throws InvocationTargetException {
        Preconditions.checkNotNull(event);
        try {
            this.method.invoke(this.target, event);
        } catch (IllegalAccessException e) {
            String valueOf = String.valueOf(String.valueOf(event));
            throw new Error(new StringBuilder(28 + valueOf.length()).append("Method became inaccessible: ").append(valueOf).toString(), e);
        } catch (IllegalArgumentException e2) {
            String valueOf2 = String.valueOf(String.valueOf(event));
            throw new Error(new StringBuilder(33 + valueOf2.length()).append("Method rejected target/argument: ").append(valueOf2).toString(), e2);
        } catch (InvocationTargetException e3) {
            if (e3.getCause() instanceof Error) {
                throw ((Error) e3.getCause());
            }
            throw e3;
        }
    }

    public String toString() {
        String valueOf = String.valueOf(String.valueOf(this.method));
        return new StringBuilder(10 + valueOf.length()).append("[wrapper ").append(valueOf).append("]").toString();
    }

    public int hashCode() {
        return ((31 + this.method.hashCode()) * 31) + System.identityHashCode(this.target);
    }

    public boolean equals(@Nullable Object obj) {
        if (obj instanceof EventSubscriber) {
            EventSubscriber that = (EventSubscriber) obj;
            return this.target == that.target && this.method.equals(that.method);
        }
        return false;
    }

    public Object getSubscriber() {
        return this.target;
    }

    public Method getMethod() {
        return this.method;
    }
}
