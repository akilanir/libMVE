package com.mongodb.util;

import com.mongodb.Bytes;
import java.util.List;
import org.bson.util.ClassMap;

/* loaded from: mongo-java-driver-2.12.5.jar:com/mongodb/util/ClassMapBasedObjectSerializer.class */
class ClassMapBasedObjectSerializer extends AbstractObjectSerializer {
    private ClassMap<ObjectSerializer> _serializers = new ClassMap<>();

    ClassMapBasedObjectSerializer() {
    }

    void addObjectSerializer(Class c, ObjectSerializer serializer) {
        this._serializers.put(c, serializer);
    }

    @Override // com.mongodb.util.ObjectSerializer
    public void serialize(Object obj, StringBuilder buf) {
        Object obj2 = Bytes.applyEncodingHooks(obj);
        if (obj2 == null) {
            buf.append(" null ");
            return;
        }
        ObjectSerializer serializer = null;
        List<Class<?>> ancestors = ClassMap.getAncestry(obj2.getClass());
        for (Class<?> ancestor : ancestors) {
            serializer = this._serializers.get(ancestor);
            if (serializer != null) {
                break;
            }
        }
        if (serializer == null && obj2.getClass().isArray()) {
            serializer = this._serializers.get(Object[].class);
        }
        if (serializer == null) {
            throw new RuntimeException("json can't serialize type : " + obj2.getClass());
        }
        serializer.serialize(obj2, buf);
    }
}
