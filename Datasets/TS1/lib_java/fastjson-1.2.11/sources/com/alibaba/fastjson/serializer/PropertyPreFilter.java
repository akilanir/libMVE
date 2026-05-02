package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/PropertyPreFilter.class */
public interface PropertyPreFilter extends SerializeFilter {
    boolean apply(JSONSerializer jSONSerializer, Object obj, String str);
}
