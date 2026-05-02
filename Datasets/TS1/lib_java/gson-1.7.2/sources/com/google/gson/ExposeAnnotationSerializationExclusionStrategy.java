package com.google.gson;

import com.google.gson.annotations.Expose;

/* loaded from: gson-1.7.2.jar:com/google/gson/ExposeAnnotationSerializationExclusionStrategy.class */
final class ExposeAnnotationSerializationExclusionStrategy implements ExclusionStrategy {
    ExposeAnnotationSerializationExclusionStrategy() {
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipField(FieldAttributes f) {
        Expose annotation = (Expose) f.getAnnotation(Expose.class);
        return annotation == null || !annotation.serialize();
    }
}
