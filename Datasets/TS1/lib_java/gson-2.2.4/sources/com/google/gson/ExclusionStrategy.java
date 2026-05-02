package com.google.gson;

/* loaded from: gson-2.2.4.jar:com/google/gson/ExclusionStrategy.class */
public interface ExclusionStrategy {
    boolean shouldSkipField(FieldAttributes fieldAttributes);

    boolean shouldSkipClass(Class<?> cls);
}
