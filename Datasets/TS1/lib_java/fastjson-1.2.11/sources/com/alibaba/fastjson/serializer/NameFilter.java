package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/NameFilter.class */
public interface NameFilter extends SerializeFilter {
    String process(Object obj, String str, Object obj2);
}
