package com.alibaba.fastjson.parser.deserializer;

import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/ExtraTypeProvider.class */
public interface ExtraTypeProvider extends ParseProcess {
    Type getExtraType(Object obj, String str);
}
