package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;
import java.math.BigInteger;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/BigIntegerCodec.class */
public class BigIntegerCodec implements ObjectSerializer, ObjectDeserializer {
    public static final BigIntegerCodec instance = new BigIntegerCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull(SerializerFeature.WriteNullNumberAsZero);
        } else {
            BigInteger val = (BigInteger) object;
            out.write(val.toString());
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
            return (T) new BigInteger(numberString);
        }
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        return (T) TypeUtils.castToBigInteger(parse);
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 2;
    }
}
