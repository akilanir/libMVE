package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/NullExclusionStrategy.class */
final class NullExclusionStrategy implements ExclusionStrategy {
    NullExclusionStrategy() {
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipField(FieldAttributes f) {
        return false;
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }
}
