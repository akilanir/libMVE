package com.mongodb;

import org.bson.BSONObject;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBObject.class */
public interface DBObject extends BSONObject {
    void markAsPartialObject();

    boolean isPartialObject();
}
