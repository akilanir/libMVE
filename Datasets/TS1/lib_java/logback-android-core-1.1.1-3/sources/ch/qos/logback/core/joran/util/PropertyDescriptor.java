package ch.qos.logback.core.joran.util;

import java.lang.reflect.Method;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/util/PropertyDescriptor.class */
public class PropertyDescriptor {
    private Method writeMethod;
    private Method readMethod;
    private String name;
    private Class<?> type;

    public PropertyDescriptor(String str) {
        this.name = str;
    }

    public String getName() {
        return this.name;
    }

    public Method getWriteMethod() {
        return this.writeMethod;
    }

    public void setWriteMethod(Method method) {
        this.writeMethod = method;
    }

    public Method getReadMethod() {
        return this.readMethod;
    }

    public void setReadMethod(Method method) {
        this.readMethod = method;
    }

    public Class<?> getPropertyType() {
        return this.type;
    }

    public void setPropertyType(Class<?> cls) {
        this.type = cls;
    }
}
