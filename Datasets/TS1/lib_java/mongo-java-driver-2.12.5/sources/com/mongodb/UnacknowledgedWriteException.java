package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/UnacknowledgedWriteException.class */
public class UnacknowledgedWriteException extends MongoClientException {
    private static final long serialVersionUID = 6974332938681213965L;

    UnacknowledgedWriteException(String msg) {
        super(msg);
    }
}
