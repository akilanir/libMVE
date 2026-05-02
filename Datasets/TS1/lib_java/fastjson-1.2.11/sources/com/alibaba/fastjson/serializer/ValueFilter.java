package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ValueFilter.class */
public interface ValueFilter extends SerializeFilter {
    Object process(Object obj, String str, Object obj2);
}
