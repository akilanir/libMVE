package ch.qos.logback.core.util;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/IncompatibleClassException.class */
public class IncompatibleClassException extends Exception {
    private static final long serialVersionUID = -5823372159561159549L;
    Class<?> requestedClass;
    Class<?> obtainedClass;

    IncompatibleClassException(Class<?> cls, Class<?> cls2) {
        this.requestedClass = cls;
        this.obtainedClass = cls2;
    }
}
