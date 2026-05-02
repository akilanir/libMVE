package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ListSerializer.class */
public final class ListSerializer implements ObjectSerializer {
    public static final ListSerializer instance = new ListSerializer();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public final void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        boolean writeClassName = serializer.out.isEnabled(SerializerFeature.WriteClassName);
        SerializeWriter out = serializer.out;
        Type elementType = null;
        if (writeClassName && (fieldType instanceof ParameterizedType)) {
            ParameterizedType param = (ParameterizedType) fieldType;
            elementType = param.getActualTypeArguments()[0];
        }
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullListAsEmpty);
            return;
        }
        List<?> list = (List) object;
        if (list.size() == 0) {
            out.append((CharSequence) "[]");
            return;
        }
        SerialContext context = serializer.context;
        serializer.setContext(context, object, fieldName, 0);
        try {
            if (out.isEnabled(SerializerFeature.PrettyFormat)) {
                out.append('[');
                serializer.incrementIndent();
                int i = 0;
                for (Object item : list) {
                    if (i != 0) {
                        out.append(',');
                    }
                    serializer.println();
                    if (item != null) {
                        if (serializer.containsReference(item)) {
                            serializer.writeReference(item);
                        } else {
                            ObjectSerializer itemSerializer = serializer.getObjectWriter(item.getClass());
                            SerialContext itemContext = new SerialContext(context, object, fieldName, 0, 0);
                            serializer.context = itemContext;
                            itemSerializer.write(serializer, item, Integer.valueOf(i), elementType, 0);
                        }
                    } else {
                        serializer.out.writeNull();
                    }
                    i++;
                }
                serializer.decrementIdent();
                serializer.println();
                out.append(']');
                serializer.context = context;
                return;
            }
            out.append('[');
            int size = list.size();
            for (int i2 = 0; i2 < size; i2++) {
                Object item2 = list.get(i2);
                if (i2 != 0) {
                    out.append(',');
                }
                if (item2 == null) {
                    out.append((CharSequence) "null");
                } else {
                    Class<?> clazz = item2.getClass();
                    if (clazz == Integer.class) {
                        out.writeInt(((Integer) item2).intValue());
                    } else if (clazz == Long.class) {
                        long val = ((Long) item2).longValue();
                        if (writeClassName) {
                            out.writeLong(val);
                            out.write(76);
                        } else {
                            out.writeLong(val);
                        }
                    } else {
                        if (!out.disableCircularReferenceDetect) {
                            SerialContext itemContext2 = new SerialContext(context, object, fieldName, 0, 0);
                            serializer.context = itemContext2;
                        }
                        if (serializer.containsReference(item2)) {
                            serializer.writeReference(item2);
                        } else {
                            ObjectSerializer itemSerializer2 = serializer.getObjectWriter(item2.getClass());
                            itemSerializer2.write(serializer, item2, Integer.valueOf(i2), elementType, 0);
                        }
                    }
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
