package com.mongodb.util;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/AbstractObjectSerializer.class */
abstract class AbstractObjectSerializer implements ObjectSerializer {
    AbstractObjectSerializer() {
    }

    @Override // com.mongodb.util.ObjectSerializer
    public String serialize(Object obj) {
        StringBuilder builder = new StringBuilder();
        serialize(obj, builder);
        return builder.toString();
    }
}
