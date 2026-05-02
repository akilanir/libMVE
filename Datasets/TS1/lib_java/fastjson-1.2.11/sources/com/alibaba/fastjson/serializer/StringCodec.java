package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.JSONLexer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/StringCodec.class */
public class StringCodec implements ObjectSerializer, ObjectDeserializer {
    public static StringCodec instance = new StringCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        write(serializer, (String) object);
    }

    public void write(JSONSerializer serializer, String value) {
        SerializeWriter out = serializer.out;
        if (value == null) {
            out.writeNull(SerializerFeature.WriteNullStringAsEmpty);
        } else {
            out.writeString(value);
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        if (type == StringBuffer.class) {
            JSONLexer jSONLexer = defaultJSONParser.lexer;
            if (jSONLexer.token() == 4) {
                String stringVal = jSONLexer.stringVal();
                jSONLexer.nextToken(16);
                return (T) new StringBuffer(stringVal);
            }
            Object parse = defaultJSONParser.parse();
            if (parse == null) {
                return null;
            }
            return (T) new StringBuffer(parse.toString());
        }
        if (type == StringBuilder.class) {
            JSONLexer jSONLexer2 = defaultJSONParser.lexer;
            if (jSONLexer2.token() == 4) {
                String stringVal2 = jSONLexer2.stringVal();
                jSONLexer2.nextToken(16);
                return (T) new StringBuilder(stringVal2);
            }
            Object parse2 = defaultJSONParser.parse();
            if (parse2 == null) {
                return null;
            }
            return (T) new StringBuilder(parse2.toString());
        }
        return (T) deserialze(defaultJSONParser);
    }

    public static <T> T deserialze(DefaultJSONParser defaultJSONParser) {
        JSONLexer lexer = defaultJSONParser.getLexer();
        if (lexer.token() == 4) {
            T t = (T) lexer.stringVal();
            lexer.nextToken(16);
            return t;
        }
        if (lexer.token() == 2) {
            T t2 = (T) lexer.numberString();
            lexer.nextToken(16);
            return t2;
        }
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        return (T) parse.toString();
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 4;
    }
}
