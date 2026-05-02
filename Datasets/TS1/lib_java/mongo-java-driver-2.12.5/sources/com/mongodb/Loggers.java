package com.mongodb;

import java.util.logging.Logger;
import org.bson.util.Assertions;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/Loggers.class */
final class Loggers {
    public static final String PREFIX = "com.mongodb.driver";

    public static Logger getLogger(String suffix) {
        Assertions.notNull("suffix", suffix);
        if (suffix.startsWith(".") || suffix.endsWith(".")) {
            throw new IllegalArgumentException("The suffix can not start or end with a '.'");
        }
        return Logger.getLogger("com.mongodb.driver." + suffix);
    }

    private Loggers() {
    }
}
