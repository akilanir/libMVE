package com.mongodb;

import java.util.concurrent.TimeUnit;
import org.bson.util.annotations.ThreadSafe;

@ThreadSafe
/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Server.class */
interface Server {
    ServerDescription getDescription();

    Connection getConnection(long j, TimeUnit timeUnit);

    void invalidate();
}
