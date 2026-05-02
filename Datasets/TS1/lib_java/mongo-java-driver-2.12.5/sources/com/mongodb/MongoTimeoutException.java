package com.mongodb;

import com.mongodb.DBPortPool;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoTimeoutException.class */
public class MongoTimeoutException extends DBPortPool.NoMoreConnection {
    private static final long serialVersionUID = -3016560214331826577L;

    MongoTimeoutException(String msg) {
        super(msg);
    }
}
