package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.util.concurrent.atomic.AtomicInteger;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/IntegerCodec.class */
public class IntegerCodec implements ObjectSerializer, ObjectDeserializer {
    public static IntegerCodec instance = new IntegerCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        Number value = (Number) object;
        if (value == null) {
            out.writeNull(SerializerFeature.WriteNullNumberAsZero);
            return;
        }
        if (object instanceof Long) {
            out.writeLong(value.longValue());
        } else {
            out.writeInt(value.intValue());
        }
        if (out.isEnabled(SerializerFeature.WriteClassName)) {
            Class<?> clazz = value.getClass();
            if (clazz == Byte.class) {
                out.write(66);
            } else if (clazz == Short.class) {
                out.write(83);
            }
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Integer valueOf;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 8) {
            jSONLexer.nextToken(16);
            return null;
        }
        if (jSONLexer.token() == 2) {
            try {
                int intValue = jSONLexer.intValue();
                jSONLexer.nextToken(16);
                valueOf = Integer.valueOf(intValue);
            } catch (NumberFormatException e) {
                throw new JSONException("int value overflow, field : " + obj, e);
            }
        } else if (jSONLexer.token() == 3) {
            BigDecimal decimalValue = jSONLexer.decimalValue();
            jSONLexer.nextToken(16);
            valueOf = Integer.valueOf(decimalValue.intValue());
        } else {
            valueOf = TypeUtils.castToInt(defaultJSONParser.parse());
        }
        if (type == AtomicInteger.class) {
            return (T) new AtomicInteger(valueOf.intValue());
        }
        return (T) valueOf;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
