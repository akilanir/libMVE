package com.mongodb;

import java.io.IOException;
import java.io.InputStream;
import org.bson.BSONDecoder;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/DBDecoder.class */
public interface DBDecoder extends BSONDecoder {
    DBCallback getDBCallback(DBCollection dBCollection);

    DBObject decode(byte[] bArr, DBCollection dBCollection);

    DBObject decode(InputStream inputStream, DBCollection dBCollection) throws IOException;
}
