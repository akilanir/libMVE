package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/FloatCodec.class */
public class FloatCodec implements ObjectSerializer, ObjectDeserializer {
    public static FloatCodec instance = new FloatCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullNumberAsZero);
        } else {
            float floatValue = ((Float) object).floatValue();
            out.writeFloat(floatValue, true);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        return (T) deserialze(defaultJSONParser);
    }

    public static <T> T deserialze(DefaultJSONParser defaultJSONParser) {
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 2) {
            String numberString = jSONLexer.numberString();
            jSONLexer.nextToken(16);
            return (T) Float.valueOf(Float.parseFloat(numberString));
        }
        if (jSONLexer.token() == 3) {
            float floatValue = jSONLexer.floatValue();
            jSONLexer.nextToken(16);
            return (T) Float.valueOf(floatValue);
        }
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        return (T) TypeUtils.castToFloat(parse);
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
