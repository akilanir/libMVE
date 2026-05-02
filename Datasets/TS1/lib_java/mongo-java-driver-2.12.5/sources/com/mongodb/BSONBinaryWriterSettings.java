package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/BSONBinaryWriterSettings.class */
class BSONBinaryWriterSettings {
    private final int maxDocumentSize;

    public BSONBinaryWriterSettings(int maxDocumentSize) {
        this.maxDocumentSize = maxDocumentSize;
    }

    public BSONBinaryWriterSettings() {
        this(16777216);
    }

    public int getMaxDocumentSize() {
        return this.maxDocumentSize;
    }
}
