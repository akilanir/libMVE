package com.danikula.videocache;

/* loaded from: videocache-2.3.3.jar:com/danikula/videocache/Preconditions.class */
final class Preconditions {
    Preconditions() {
    }

    static <T> T checkNotNull(T reference) {
        if (reference == null) {
            throw new NullPointerException();
        }
        return reference;
    }

    static void checkAllNotNull(Object... references) {
        for (Object reference : references) {
            if (reference == null) {
                throw new NullPointerException();
            }
        }
    }

    static <T> T checkNotNull(T reference, String errorMessage) {
        if (reference == null) {
            throw new NullPointerException(errorMessage);
        }
        return reference;
    }

    static void checkArgument(boolean expression) {
        if (!expression) {
            throw new IllegalArgumentException();
        }
    }

    static void checkArgument(boolean expression, String errorMessage) {
        if (!expression) {
            throw new IllegalArgumentException(errorMessage);
        }
    }
}
