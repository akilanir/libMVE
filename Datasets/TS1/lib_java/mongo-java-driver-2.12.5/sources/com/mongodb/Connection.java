package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Connection.class */
interface Connection {
    int getGeneration();

    long getOpenedAt();

    long getLastUsedAt();

    boolean isClosed();

    void close();
}
