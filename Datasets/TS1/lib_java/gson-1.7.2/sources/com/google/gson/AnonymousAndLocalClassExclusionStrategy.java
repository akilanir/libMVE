package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/AnonymousAndLocalClassExclusionStrategy.class */
final class AnonymousAndLocalClassExclusionStrategy implements ExclusionStrategy {
    AnonymousAndLocalClassExclusionStrategy() {
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipField(FieldAttributes f) {
        return isAnonymousOrLocal(f.getDeclaredClass());
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipClass(Class<?> clazz) {
        return isAnonymousOrLocal(clazz);
    }

    private boolean isAnonymousOrLocal(Class<?> clazz) {
        return !Enum.class.isAssignableFrom(clazz) && (clazz.isAnonymousClass() || clazz.isLocalClass());
    }
}
