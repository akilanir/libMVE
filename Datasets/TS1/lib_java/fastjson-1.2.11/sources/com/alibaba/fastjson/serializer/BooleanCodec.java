package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.concurrent.atomic.AtomicBoolean;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/BooleanCodec.class */
public class BooleanCodec implements ObjectSerializer, ObjectDeserializer {
    public static final BooleanCodec instance = new BooleanCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        Boolean value = (Boolean) object;
        if (value == null) {
            out.writeNull(SerializerFeature.WriteNullBooleanAsFalse);
        } else if (value.booleanValue()) {
            out.write("true");
        } else {
            out.write("false");
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Boolean castToBoolean;
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 6) {
            jSONLexer.nextToken(16);
            castToBoolean = Boolean.TRUE;
        } else if (jSONLexer.token() == 7) {
            jSONLexer.nextToken(16);
            castToBoolean = Boolean.FALSE;
        } else if (jSONLexer.token() == 2) {
            int intValue = jSONLexer.intValue();
            jSONLexer.nextToken(16);
            if (intValue == 1) {
                castToBoolean = Boolean.TRUE;
            } else {
                castToBoolean = Boolean.FALSE;
            }
        } else {
            Object parse = defaultJSONParser.parse();
            if (parse == null) {
                return null;
            }
            castToBoolean = TypeUtils.castToBoolean(parse);
        }
        if (type == AtomicBoolean.class) {
            return (T) new AtomicBoolean(castToBoolean.booleanValue());
        }
        return (T) castToBoolean;
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 6;
    }
}
