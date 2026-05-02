package com.alibaba.fastjson.serializer;

import java.lang.reflect.Type;

@Deprecated
/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/JSONSerializerMap.class */
public class JSONSerializerMap extends SerializeConfig {
    public final boolean put(Class<?> clazz, ObjectSerializer serializer) {
        return super.put((Type) clazz, serializer);
    }
}
