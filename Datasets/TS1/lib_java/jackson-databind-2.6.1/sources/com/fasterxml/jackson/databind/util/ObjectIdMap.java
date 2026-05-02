package com.fasterxml.jackson.databind.util;

import java.util.IdentityHashMap;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/util/ObjectIdMap.class */
public class ObjectIdMap extends IdentityHashMap<Object, Object> {
    public ObjectIdMap() {
        super(16);
    }

    public Object findId(Object pojo) {
        return get(pojo);
    }

    public void insertId(Object pojo, Object id) {
        put(pojo, id);
    }
}
