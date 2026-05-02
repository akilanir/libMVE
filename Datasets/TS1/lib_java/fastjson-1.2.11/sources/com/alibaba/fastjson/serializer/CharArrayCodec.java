package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/CharArrayCodec.class */
public class CharArrayCodec implements ObjectDeserializer {
    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        return (T) deserialze(defaultJSONParser);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> T deserialze(DefaultJSONParser defaultJSONParser) {
        JSONLexer jSONLexer = defaultJSONParser.lexer;
        if (jSONLexer.token() == 4) {
            String stringVal = jSONLexer.stringVal();
            jSONLexer.nextToken(16);
            return (T) stringVal.toCharArray();
        }
        if (jSONLexer.token() == 2) {
            Number integerValue = jSONLexer.integerValue();
            jSONLexer.nextToken(16);
            return (T) integerValue.toString().toCharArray();
        }
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        return (T) JSON.toJSONString(parse).toCharArray();
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 4;
    }
}
