package com.mongodb;

import java.io.IOException;
import org.bson.BSONObject;
import org.bson.io.OutputBuffer;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/LazyDBEncoder.class */
public class LazyDBEncoder implements DBEncoder {
    @Override // com.mongodb.DBEncoder
    public int writeObject(OutputBuffer buf, BSONObject o) {
        if (!(o instanceof LazyDBObject)) {
            throw new IllegalArgumentException("LazyDBEncoder can only encode BSONObject instances of type LazyDBObject");
        }
        LazyDBObject lazyDBObject = (LazyDBObject) o;
        try {
            lazyDBObject.pipe(buf);
            return lazyDBObject.getBSONSize();
        } catch (IOException e) {
            throw new MongoException("Exception serializing a LazyDBObject", e);
        }
    }
}
