package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/PropertyFilter.class */
public interface PropertyFilter extends SerializeFilter {
    boolean apply(Object obj, String str, Object obj2);
}
