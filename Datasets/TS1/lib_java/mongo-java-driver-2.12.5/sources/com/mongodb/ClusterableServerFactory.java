package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ClusterableServerFactory.class */
interface ClusterableServerFactory {
    ClusterableServer create(ServerAddress serverAddress);

    ServerSettings getSettings();
}
