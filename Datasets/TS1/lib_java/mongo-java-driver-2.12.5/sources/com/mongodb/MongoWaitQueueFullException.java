package com.mongodb;

import com.mongodb.DBPortPool;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoWaitQueueFullException.class */
public class MongoWaitQueueFullException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = 1482094507852255793L;

    MongoWaitQueueFullException(String msg) {
        super(msg);
    }
}
