package org.bson;

import org.bson.io.OutputBuffer;

/* loaded from: mongo-java-driver-2.12.5.jar:org/bson/BSONEncoder.class */
public interface BSONEncoder {
    byte[] encode(BSONObject bSONObject);

    int putObject(BSONObject bSONObject);

    void done();

    void set(OutputBuffer outputBuffer);
}
