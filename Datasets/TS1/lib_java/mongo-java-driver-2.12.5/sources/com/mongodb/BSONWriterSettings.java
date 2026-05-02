package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONWriterSettings.class */
class BSONWriterSettings {
    private final int maxSerializationDepth;

    public BSONWriterSettings(int maxSerializationDepth) {
        this.maxSerializationDepth = maxSerializationDepth;
    }

    public BSONWriterSettings() {
        this(1024);
    }

    public int getMaxSerializationDepth() {
        return this.maxSerializationDepth;
    }
}
