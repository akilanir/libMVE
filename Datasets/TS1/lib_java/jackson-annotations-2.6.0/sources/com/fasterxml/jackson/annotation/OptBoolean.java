package com.fasterxml.jackson.annotation;

/* loaded from: jackson-annotations-2.6.0.jar:com/fasterxml/jackson/annotation/OptBoolean.class */
public enum OptBoolean {
    TRUE,
    FALSE,
    DEFAULT;

    public Boolean asBoolean() {
        if (this == DEFAULT) {
            return null;
        }
        return this == TRUE ? Boolean.TRUE : Boolean.FALSE;
    }

    public boolean asPrimitive() {
        return this == TRUE;
    }

    public static OptBoolean fromBoolean(Boolean b) {
        if (b == null) {
            return DEFAULT;
        }
        return b.booleanValue() ? TRUE : FALSE;
    }
}
