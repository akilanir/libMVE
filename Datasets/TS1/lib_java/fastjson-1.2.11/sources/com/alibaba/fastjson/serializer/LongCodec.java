package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.concurrent.atomic.AtomicLong;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/LongCodec.class */
public class LongCodec implements ObjectSerializer, ObjectDeserializer {
    public static LongCodec instance = new LongCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullNumberAsZero);
            return;
        }
        long value = ((Long) object).longValue();
        out.writeLong(value);
        if (out.isEnabled(SerializerFeature.WriteClassName) && value <= 2147483647L && value >= -2147483648L && fieldType != Long.class) {
            out.write(76);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Long castToLong;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 2) {
            long longValue = jSONLexer.longValue();
            jSONLexer.nextToken(16);
            castToLong = Long.valueOf(longValue);
        } else {
            Object parse = defaultJSONParser.parse();
            if (parse == null) {
                return null;
            }
            castToLong = TypeUtils.castToLong(parse);
        }
        return type == AtomicLong.class ? (T) new AtomicLong(castToLong.longValue()) : (T) castToLong;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
