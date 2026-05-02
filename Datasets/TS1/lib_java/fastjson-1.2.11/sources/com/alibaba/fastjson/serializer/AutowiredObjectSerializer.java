package com.alibaba.fastjson.serializer;

import java.lang.reflect.Type;
import java.util.Set;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/AutowiredObjectSerializer.class */
public interface AutowiredObjectSerializer extends ObjectSerializer {
    Set<Type> getAutowiredFor();
}
