package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/SyntheticFieldExclusionStrategy.class */
final class SyntheticFieldExclusionStrategy implements ExclusionStrategy {
    private final boolean skipSyntheticFields;

    SyntheticFieldExclusionStrategy(boolean skipSyntheticFields) {
        this.skipSyntheticFields = skipSyntheticFields;
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipClass(Class<?> clazz) {
        return false;
    }

    @Override // com.google.gson.ExclusionStrategy
    public boolean shouldSkipField(FieldAttributes f) {
        return this.skipSyntheticFields && f.isSynthetic();
    }
}
