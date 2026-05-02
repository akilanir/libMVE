package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoExecutionTimeoutException.class */
public class MongoExecutionTimeoutException extends MongoException {
    private static final long serialVersionUID = 5955669123800274594L;

    MongoExecutionTimeoutException(int code, String errorMessage) {
        super(code, errorMessage);
    }
}
