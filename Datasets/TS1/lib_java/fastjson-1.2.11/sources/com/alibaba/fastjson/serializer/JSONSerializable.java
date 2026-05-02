package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/JSONSerializable.class */
public interface JSONSerializable {
    void write(JSONSerializer jSONSerializer, Object obj, Type type, int i) throws IOException;
}
