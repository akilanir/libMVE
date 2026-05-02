package com.mongodb;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/MongoInterruptedException.class */
public class MongoInterruptedException extends MongoException {
    private static final long serialVersionUID = -4110417867718417860L;

    public MongoInterruptedException(InterruptedException e) {
        super("A driver operation has been interrupted", e);
    }

    public MongoInterruptedException(String message, InterruptedException e) {
        super(message, e);
    }
}
