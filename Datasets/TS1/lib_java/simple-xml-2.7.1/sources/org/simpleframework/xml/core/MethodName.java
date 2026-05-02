package org.simpleframework.xml.core;

import java.lang.reflect.Method;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/MethodName.class */
class MethodName {
    private MethodType type;
    private Method method;
    private String name;

    public MethodName(Method method, MethodType type, String name) {
        this.method = method;
        this.type = type;
        this.name = name;
    }

    public String getName() {
        return this.name;
    }

    public MethodType getType() {
        return this.type;
    }

    public Method getMethod() {
        return this.method;
    }
}
