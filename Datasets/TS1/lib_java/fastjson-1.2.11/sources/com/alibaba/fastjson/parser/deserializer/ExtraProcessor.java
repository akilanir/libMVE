package com.alibaba.fastjson.parser.deserializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/parser/deserializer/ExtraProcessor.class */
public interface ExtraProcessor extends ParseProcess {
    void processExtra(Object obj, String str, Object obj2);
}
