package org.bson.util;

@Deprecated
/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/util/Assertions.class */
public class Assertions {
    public static <T> T notNull(String name, T notNull) throws IllegalArgumentException {
        if (notNull == null) {
            throw new NullArgumentException(name);
        }
        return notNull;
    }

    public static void isTrue(String name, boolean check) throws IllegalArgumentException {
        if (!check) {
            throw new IllegalStateException(name);
        }
    }

    public static void isTrueArgument(String name, boolean check) {
        if (!check) {
            throw new IllegalArgumentException("state should be: " + name);
        }
    }

    private Assertions() {
    }

    /* loaded from: mongo-java-driver-2.12.5.jar:org/bson/util/Assertions$NullArgumentException.class */
    static class NullArgumentException extends IllegalArgumentException {
        private static final long serialVersionUID = 6178592463723624585L;

        NullArgumentException(String name) {
            super(name + " should not be null!");
        }
    }
}
