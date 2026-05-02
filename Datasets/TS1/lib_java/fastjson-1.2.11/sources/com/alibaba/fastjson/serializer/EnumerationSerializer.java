package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Enumeration;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/EnumerationSerializer.class */
public class EnumerationSerializer implements ObjectSerializer {
    public static EnumerationSerializer instance = new EnumerationSerializer();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullListAsEmpty);
            return;
        }
        Type elementType = null;
        if (out.isEnabled(SerializerFeature.WriteClassName) && (fieldType instanceof ParameterizedType)) {
            ParameterizedType param = (ParameterizedType) fieldType;
            elementType = param.getActualTypeArguments()[0];
        }
        Enumeration<?> e = (Enumeration) object;
        SerialContext context = serializer.context;
        serializer.setContext(context, object, fieldName, 0);
        try {
            int i = 0;
            out.append('[');
            while (e.hasMoreElements()) {
                Object item = e.nextElement();
                int i2 = i;
                i++;
                if (i2 != 0) {
                    out.append(',');
                }
                if (item == null) {
                    out.writeNull();
                } else {
                    ObjectSerializer itemSerializer = serializer.getObjectWriter(item.getClass());
                    itemSerializer.write(serializer, item, Integer.valueOf(i - 1), elementType, 0);
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
