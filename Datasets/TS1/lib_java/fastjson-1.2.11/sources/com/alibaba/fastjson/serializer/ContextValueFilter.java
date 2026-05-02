package com.alibaba.fastjson.serializer;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/ContextValueFilter.class */
public interface ContextValueFilter extends SerializeFilter {
    Object process(BeanContext beanContext, Object obj, String str, Object obj2);
}
