package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/PropertySetterException.class */
public class PropertySetterException extends Exception {
    private static final long serialVersionUID = -2771077768281663949L;

    public PropertySetterException(String str) {
        super(str);
    }

    public PropertySetterException(Throwable th) {
        super(th);
    }

    public PropertySetterException(String str, Throwable th) {
        super(str, th);
    }
}
