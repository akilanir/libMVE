package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ArraySerializer.class */
public class ArraySerializer implements ObjectSerializer {
    private final Class<?> componentType;
    private final ObjectSerializer compObjectSerializer;

    public ArraySerializer(Class<?> componentType, ObjectSerializer compObjectSerializer) {
        this.componentType = componentType;
        this.compObjectSerializer = compObjectSerializer;
    }

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public final void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullListAsEmpty);
            return;
        }
        Object[] array = (Object[]) object;
        int size = array.length;
        SerialContext context = serializer.context;
        serializer.setContext(context, object, fieldName, 0);
        try {
            out.append('[');
            for (int i = 0; i < size; i++) {
                if (i != 0) {
                    out.append(',');
                }
                Object item = array[i];
                if (item == null) {
                    out.append((CharSequence) "null");
                } else if (item.getClass() == this.componentType) {
                    this.compObjectSerializer.write(serializer, item, Integer.valueOf(i), null, 0);
                } else {
                    ObjectSerializer itemSerializer = serializer.getObjectWriter(item.getClass());
                    itemSerializer.write(serializer, item, Integer.valueOf(i), null, 0);
                }
            }
            out.append(']');
            serializer.context = context;
        } catch (Throwable th) {
            serializer.context = context;
            throw th;
        }
    }
}
