package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import java.io.IOException;
import java.lang.ref.Reference;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.concurrent.atomic.AtomicReference;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ReferenceCodec.class */
public class ReferenceCodec implements ObjectSerializer, ObjectDeserializer {
    public static final ReferenceCodec instance = new ReferenceCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        Object item;
        if (object instanceof AtomicReference) {
            AtomicReference val = (AtomicReference) object;
            item = val.get();
        } else {
            item = ((Reference) object).get();
        }
        serializer.write(item);
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        ParameterizedType parameterizedType = (ParameterizedType) type;
        Object parseObject = defaultJSONParser.parseObject(parameterizedType.getActualTypeArguments()[0]);
        Type rawType = parameterizedType.getRawType();
        if (rawType == AtomicReference.class) {
            return (T) new AtomicReference(parseObject);
        }
        if (rawType == WeakReference.class) {
            return (T) new WeakReference(parseObject);
        }
        if (rawType == SoftReference.class) {
            return (T) new SoftReference(parseObject);
        }
        throw new UnsupportedOperationException(rawType.toString());
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 12;
    }
}
