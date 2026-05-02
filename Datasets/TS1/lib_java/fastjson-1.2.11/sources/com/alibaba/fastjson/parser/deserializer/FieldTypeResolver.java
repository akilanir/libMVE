package com.alibaba.fastjson.parser.deserializer;

import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/FieldTypeResolver.class */
public interface FieldTypeResolver extends ParseProcess {
    Type resolve(Object obj, String str);
}
