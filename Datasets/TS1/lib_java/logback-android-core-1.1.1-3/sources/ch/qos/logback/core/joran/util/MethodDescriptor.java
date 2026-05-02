package ch.qos.logback.core.joran.util;

import java.lang.reflect.Method;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/util/MethodDescriptor.class */
public class MethodDescriptor {
    private String name;
    private Method method;

    public MethodDescriptor(String str, Method method) {
        this.name = str;
        this.method = method;
    }

    public String getName() {
        return this.name;
    }

    public Method getMethod() {
        return this.method;
    }
}
