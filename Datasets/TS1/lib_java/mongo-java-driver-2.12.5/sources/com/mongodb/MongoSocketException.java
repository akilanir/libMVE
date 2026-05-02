package com.mongodb;

import java.io.IOException;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoSocketException.class */
public class MongoSocketException extends MongoException {
    private static final long serialVersionUID = -4415279469780082174L;

    MongoSocketException(String msg, IOException ioe) {
        super(-2, msg, ioe);
    }

    MongoSocketException(IOException ioe) {
        super(ioe.toString(), ioe);
    }
}
