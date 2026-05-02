package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.Collection;
import java.util.HashSet;
import java.util.TreeSet;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/CollectionCodec.class */
public class CollectionCodec implements ObjectSerializer, ObjectDeserializer {
    public static final CollectionCodec instance = new CollectionCodec();

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
        Collection<?> collection = (Collection) object;
        SerialContext context = serializer.context;
        serializer.setContext(context, object, fieldName, 0);
        if (out.isEnabled(SerializerFeature.WriteClassName)) {
            if (HashSet.class == collection.getClass()) {
                out.append((CharSequence) "Set");
            } else if (TreeSet.class == collection.getClass()) {
                out.append((CharSequence) "TreeSet");
            }
        }
        try {
            int i = 0;
            out.append('[');
            for (Object item : collection) {
                int i2 = i;
                i++;
                if (i2 != 0) {
                    out.append(',');
                }
                if (item == null) {
                    out.writeNull();
                } else {
                    Class<?> clazz = item.getClass();
                    if (clazz == Integer.class) {
                        out.writeInt(((Integer) item).intValue());
                    } else if (clazz == Long.class) {
                        out.writeLong(((Long) item).longValue());
                        if (out.isEnabled(SerializerFeature.WriteClassName)) {
                            out.write(76);
                        }
                    } else {
                        ObjectSerializer itemSerializer = serializer.getObjectWriter(clazz);
                        itemSerializer.write(serializer, item, Integer.valueOf(i - 1), elementType, 0);
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

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v32, types: [T, com.alibaba.fastjson.JSONArray, java.util.Collection] */
    /* JADX WARN: Type inference failed for: r0v5, types: [T, java.util.Collection] */
    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        if (defaultJSONParser.lexer.token() == 8) {
            defaultJSONParser.lexer.nextToken(16);
            return null;
        }
        if (type == JSONArray.class) {
            ?? r0 = (T) new JSONArray();
            defaultJSONParser.parseArray((Collection) r0);
            return r0;
        }
        ?? r02 = (T) TypeUtils.createCollection(type);
        Type type2 = null;
        if (type instanceof ParameterizedType) {
            type2 = ((ParameterizedType) type).getActualTypeArguments()[0];
        } else {
            if (type instanceof Class) {
                Class cls = (Class) type;
                if (!cls.getName().startsWith("java.")) {
                    Type genericSuperclass = cls.getGenericSuperclass();
                    if (genericSuperclass instanceof ParameterizedType) {
                        type2 = ((ParameterizedType) genericSuperclass).getActualTypeArguments()[0];
                    }
                }
            }
            if (type2 == null) {
                type2 = Object.class;
            }
        }
        defaultJSONParser.parseArray(type2, r02, obj);
        return r02;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 14;
    }
}
