package com.google.gson.internal;

/* renamed from: com.google.gson.internal.$Gson$Preconditions, reason: invalid class name */
/* loaded from: gson-1.7.2.jar:com/google/gson/internal/$Gson$Preconditions.class */
public final class C$Gson$Preconditions {
    public static <T> T checkNotNull(T obj) {
        if (obj == null) {
            throw new NullPointerException();
        }
        return obj;
    }

    public static void checkArgument(boolean condition) {
        if (!condition) {
            throw new IllegalArgumentException();
        }
    }

    public static void checkState(boolean condition) {
        if (!condition) {
            throw new IllegalStateException();
        }
    }
}
