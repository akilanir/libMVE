package com.alibaba.fastjson.serializer;

import java.io.IOException;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ToStringSerializer.class */
public class ToStringSerializer implements ObjectSerializer {
    public static final ToStringSerializer instance = new ToStringSerializer();

    @Override // com.alibaba.fastjson.serializer.ObjectSerializer
    public void write(JSONSerializer serializer, Object object, Object fieldName, Type fieldType, int features) throws IOException {
        SerializeWriter out = serializer.out;
        if (object == null) {
            out.writeNull();
        } else {
            String strVal = object.toString();
            out.writeString(strVal);
        }
    }
}
