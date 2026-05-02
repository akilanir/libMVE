package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/ExclusionStrategy.class */
public interface ExclusionStrategy {
    boolean shouldSkipField(FieldAttributes fieldAttributes);

    boolean shouldSkipClass(Class<?> cls);
}
