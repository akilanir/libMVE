package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.util.TypeUtils;
import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/CharacterCodec.class */
public class CharacterCodec implements ObjectSerializer, ObjectDeserializer {
    public static final CharacterCodec instance = new CharacterCodec();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        Character value = (Character) object;
        if (value == null) {
            out.writeString("");
            return;
        }
        char c = value.charValue();
        if (c == 0) {
            out.writeString("��");
        } else {
            out.writeString(value.toString());
        }
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj) {
        Object parse = defaultJSONParser.parse();
        if (parse == null) {
            return null;
        }
        return (T) TypeUtils.castToChar(parse);
    }

    @Override // com.alibaba.fastjson.parser.deserializer.ObjectDeserializer
    public int getFastMatchToken() {
        return 4;
    }
}
