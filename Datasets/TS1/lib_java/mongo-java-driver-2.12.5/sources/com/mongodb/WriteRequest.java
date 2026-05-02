package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/WriteRequest.class */
abstract class WriteRequest {

    /* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/WriteRequest$Type.class */
    enum Type {
        INSERT,
        UPDATE,
        REPLACE,
        REMOVE
    }

    public abstract Type getType();

    WriteRequest() {
    }
}
