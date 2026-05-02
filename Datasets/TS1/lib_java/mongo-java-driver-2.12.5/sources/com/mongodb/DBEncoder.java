package com.mongodb;

import org.bson.BSONObject;
import org.bson.io.OutputBuffer;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBEncoder.class */
public interface DBEncoder {
    int writeObject(OutputBuffer outputBuffer, BSONObject bSONObject);
}
