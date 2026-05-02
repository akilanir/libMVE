package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBCallbackFactory.class */
public interface DBCallbackFactory {
    DBCallback create(DBCollection dBCollection);
}
