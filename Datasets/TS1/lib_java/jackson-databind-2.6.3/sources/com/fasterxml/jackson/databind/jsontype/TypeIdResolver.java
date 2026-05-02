package com.fasterxml.jackson.databind.jsontype;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.databind.DatabindContext;
import com.fasterxml.jackson.databind.JavaType;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/jsontype/TypeIdResolver.class */
public interface TypeIdResolver {
    void init(JavaType javaType);

    String idFromValue(Object obj);

    String idFromValueAndType(Object obj, Class<?> cls);

    String idFromBaseType();

    @Deprecated
    JavaType typeFromId(String str);

    JavaType typeFromId(DatabindContext databindContext, String str);

    JsonTypeInfo.Id getMechanism();
}
