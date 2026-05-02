package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterableServer.class */
interface ClusterableServer extends Server {
    void addChangeListener(ChangeListener<ServerDescription> changeListener);

    @Override // com.mongodb.Server
    void invalidate();

    void close();

    boolean isClosed();

    void connect();
}
