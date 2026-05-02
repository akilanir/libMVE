package com.mongodb;

import java.util.concurrent.TimeUnit;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Cluster.class */
interface Cluster {
    ClusterDescription getDescription(long j, TimeUnit timeUnit);

    Server getServer(ServerSelector serverSelector, long j, TimeUnit timeUnit);

    void close();

    boolean isClosed();
}
