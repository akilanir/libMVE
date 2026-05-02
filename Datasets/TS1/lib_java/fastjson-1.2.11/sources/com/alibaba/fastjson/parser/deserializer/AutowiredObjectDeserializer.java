package com.alibaba.fastjson.parser.deserializer;

import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/AutowiredObjectDeserializer.class */
public interface AutowiredObjectDeserializer extends ObjectDeserializer {
    Set<Type> getAutowiredFor();
}
