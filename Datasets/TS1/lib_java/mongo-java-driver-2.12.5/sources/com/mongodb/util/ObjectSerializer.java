package com.mongodb.util;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/ObjectSerializer.class */
public interface ObjectSerializer {
    void serialize(Object obj, StringBuilder sb);

    String serialize(Object obj);
}
