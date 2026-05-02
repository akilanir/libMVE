package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/LabelFilter.class */
public interface LabelFilter extends SerializeFilter {
    boolean apply(String str);
}
