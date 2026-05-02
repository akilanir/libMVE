package de.greenrobot.event;

import java.lang.reflect.Method;

/* loaded from: eventbus-2.4.0.jar:de/greenrobot/event/SubscriberMethod.class */
final class SubscriberMethod {
    final Method method;
    final ThreadMode threadMode;
    final Class<?> eventType;
    String methodString;

    SubscriberMethod(Method method, ThreadMode threadMode, Class<?> eventType) {
        this.method = method;
        this.threadMode = threadMode;
        this.eventType = eventType;
    }

    public boolean equals(Object other) {
        if (other instanceof SubscriberMethod) {
            checkMethodString();
            SubscriberMethod otherSubscriberMethod = (SubscriberMethod) other;
            otherSubscriberMethod.checkMethodString();
            return this.methodString.equals(otherSubscriberMethod.methodString);
        }
        return false;
    }

    private synchronized void checkMethodString() {
        if (this.methodString == null) {
            StringBuilder builder = new StringBuilder(64);
            builder.append(this.method.getDeclaringClass().getName());
            builder.append('#').append(this.method.getName());
            builder.append('(').append(this.eventType.getName());
            this.methodString = builder.toString();
        }
    }

    public int hashCode() {
        return this.method.hashCode();
    }
}
