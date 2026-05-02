package com.facebook.stetho.common;

/* loaded from: stetho-1.3.1.jar:com/facebook/stetho/common/ExceptionUtil.class */
public class ExceptionUtil {
    public static <T extends Throwable> void propagateIfInstanceOf(Throwable t, Class<T> type) throws Throwable {
        if (type.isInstance(t)) {
            throw t;
        }
    }

    public static RuntimeException propagate(Throwable t) {
        propagateIfInstanceOf(t, Error.class);
        propagateIfInstanceOf(t, RuntimeException.class);
        throw new RuntimeException(t);
    }

    public static <T extends Throwable> void sneakyThrow(Throwable t) throws Throwable {
        throw t;
    }
}
