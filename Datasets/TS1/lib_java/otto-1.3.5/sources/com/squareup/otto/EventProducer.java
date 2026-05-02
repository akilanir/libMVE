package com.squareup.otto;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

/* loaded from: otto-1.3.5.jar:com/squareup/otto/EventProducer.class */
class EventProducer {
    final Object target;
    private final Method method;
    private final int hashCode;
    private boolean valid = true;

    EventProducer(Object target, Method method) {
        if (target == null) {
            throw new NullPointerException("EventProducer target cannot be null.");
        }
        if (method == null) {
            throw new NullPointerException("EventProducer method cannot be null.");
        }
        this.target = target;
        this.method = method;
        method.setAccessible(true);
        this.hashCode = ((31 + method.hashCode()) * 31) + target.hashCode();
    }

    public boolean isValid() {
        return this.valid;
    }

    public void invalidate() {
        this.valid = false;
    }

    public Object produceEvent() throws InvocationTargetException {
        if (!this.valid) {
            throw new IllegalStateException(toString() + " has been invalidated and can no longer produce events.");
        }
        try {
            return this.method.invoke(this.target, new Object[0]);
        } catch (IllegalAccessException e) {
            throw new AssertionError(e);
        } catch (InvocationTargetException e2) {
            if (e2.getCause() instanceof Error) {
                throw ((Error) e2.getCause());
            }
            throw e2;
        }
    }

    public String toString() {
        return "[EventProducer " + this.method + "]";
    }

    public int hashCode() {
        return this.hashCode;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        EventProducer other = (EventProducer) obj;
        return this.method.equals(other.method) && this.target == other.target;
    }
}
