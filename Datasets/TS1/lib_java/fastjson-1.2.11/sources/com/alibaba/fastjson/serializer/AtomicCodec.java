package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicIntegerArray;
import java.util.concurrent.atomic.AtomicLong;
import java.util.concurrent.atomic.AtomicLongArray;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/AtomicCodec.class */
public class AtomicCodec implements ObjectSerializer, ObjectDeserializer {
    public static final AtomicCodec instance = new AtomicCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object instanceof AtomicInteger) {
            AtomicInteger val = (AtomicInteger) object;
            out.writeInt(val.get());
            return;
        }
        if (object instanceof AtomicLong) {
            AtomicLong val2 = (AtomicLong) object;
            out.writeLong(val2.get());
            return;
        }
        if (object instanceof AtomicBoolean) {
            AtomicBoolean val3 = (AtomicBoolean) object;
            out.append((CharSequence) (val3.get() ? "true" : "false"));
            return;
        }
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullListAsEmpty);
            return;
        }
        if (object instanceof AtomicIntegerArray) {
            AtomicIntegerArray array = (AtomicIntegerArray) object;
            int len = array.length();
            out.write(91);
            for (int i = 0; i < len; i++) {
                int val4 = array.get(i);
                if (i != 0) {
                    out.write(44);
                }
                out.writeInt(val4);
            }
            out.write(93);
            return;
        }
        AtomicLongArray array2 = (AtomicLongArray) object;
        int len2 = array2.length();
        out.write(91);
        for (int i2 = 0; i2 < len2; i2++) {
            long val5 = array2.get(i2);
            if (i2 != 0) {
                out.write(44);
            }
            out.writeLong(val5);
        }
        out.write(93);
    }

    /* JADX WARN: Type inference failed for: r0v11, types: [T, java.util.concurrent.atomic.AtomicIntegerArray] */
    /* JADX WARN: Type inference failed for: r0v6, types: [T, java.util.concurrent.atomic.AtomicLongArray] */
    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        if (defaultJSONParser.lexer.token() == 8) {
            defaultJSONParser.lexer.nextToken(16);
            return null;
        }
        JSONArray jSONArray = new JSONArray();
        defaultJSONParser.parseArray(jSONArray);
        if (type == AtomicIntegerArray.class) {
            ?? r0 = (T) new AtomicIntegerArray(jSONArray.size());
            for (int i = 0; i < jSONArray.size(); i++) {
                r0.set(i, jSONArray.getInteger(i).intValue());
            }
            return r0;
        }
        ?? r02 = (T) new AtomicLongArray(jSONArray.size());
        for (int i2 = 0; i2 < jSONArray.size(); i2++) {
            r02.set(i2, jSONArray.getLong(i2).longValue());
        }
        return r02;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 14;
    }
}
