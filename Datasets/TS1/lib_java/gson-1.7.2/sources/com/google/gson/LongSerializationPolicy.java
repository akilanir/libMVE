package com.google.gson;

/* loaded from: gson-1.7.2.jar:com/google/gson/LongSerializationPolicy.class */
public enum LongSerializationPolicy {
    DEFAULT(new DefaultStrategy()),
    STRING(new StringStrategy());

    private final Strategy strategy;

    /* loaded from: gson-1.7.2.jar:com/google/gson/LongSerializationPolicy$Strategy.class */
    private interface Strategy {
        JsonElement serialize(Long l);
    }

    LongSerializationPolicy(Strategy strategy) {
        this.strategy = strategy;
    }

    public JsonElement serialize(Long value) {
        return this.strategy.serialize(value);
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/LongSerializationPolicy$DefaultStrategy.class */
    private static class DefaultStrategy implements Strategy {
        private DefaultStrategy() {
        }

        @Override // com.google.gson.LongSerializationPolicy.Strategy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive((Number) value);
        }
    }

    /* loaded from: gson-1.7.2.jar:com/google/gson/LongSerializationPolicy$StringStrategy.class */
    private static class StringStrategy implements Strategy {
        private StringStrategy() {
        }

        @Override // com.google.gson.LongSerializationPolicy.Strategy
        public JsonElement serialize(Long value) {
            return new JsonPrimitive(String.valueOf(value));
        }
    }
}
