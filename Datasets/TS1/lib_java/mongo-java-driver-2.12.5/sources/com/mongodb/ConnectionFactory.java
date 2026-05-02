package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/ConnectionFactory.class */
interface ConnectionFactory {
    Connection create(ServerAddress serverAddress, PooledConnectionProvider pooledConnectionProvider, int i);
}
