package com.loopj.android.http;

/* loaded from: android-async-http-1.4.9.jar:com/loopj/android/http/Utils.class */
class Utils {
    private Utils() {
    }

    public static void asserts(boolean expression, String failedMessage) {
        if (!expression) {
            throw new AssertionError(failedMessage);
        }
    }

    public static <T> T notNull(T argument, String name) {
        if (argument == null) {
            throw new IllegalArgumentException(name + " should not be null!");
        }
        return argument;
    }
}
