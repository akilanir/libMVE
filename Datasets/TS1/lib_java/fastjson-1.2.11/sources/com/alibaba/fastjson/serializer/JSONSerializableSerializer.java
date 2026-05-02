package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/JSONSerializableSerializer.class */
public class JSONSerializableSerializer implements ObjectSerializer {
    public static JSONSerializableSerializer instance = new JSONSerializableSerializer();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        JSONSerializable jsonSerializable = (JSONSerializable) object;
        jsonSerializable.write(serializer, fieldName, fieldType, 0);
    }
}
