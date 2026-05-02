package com.alibaba.fastjson.parser.deserializer;

import com.alibaba.fastjson.parser.DefaultJSONParser;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/ObjectDeserializer.class */
public interface ObjectDeserializer {
    <T> T deserialze(DefaultJSONParser defaultJSONParser, Type type, Object obj);

    int getFastMatchToken();
}
