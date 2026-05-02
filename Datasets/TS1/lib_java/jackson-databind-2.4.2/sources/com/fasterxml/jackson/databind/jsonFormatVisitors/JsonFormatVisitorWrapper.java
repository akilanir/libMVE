package com.fasterxml.jackson.databind.jsonFormatVisitors;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/jsonFormatVisitors/JsonFormatVisitorWrapper.class */
public interface JsonFormatVisitorWrapper extends JsonFormatVisitorWithSerializerProvider {
    JsonObjectFormatVisitor expectObjectFormat(JavaType javaType) throws JsonMappingException;

    JsonArrayFormatVisitor expectArrayFormat(JavaType javaType) throws JsonMappingException;

    JsonStringFormatVisitor expectStringFormat(JavaType javaType) throws JsonMappingException;

    JsonNumberFormatVisitor expectNumberFormat(JavaType javaType) throws JsonMappingException;

    JsonIntegerFormatVisitor expectIntegerFormat(JavaType javaType) throws JsonMappingException;

    JsonBooleanFormatVisitor expectBooleanFormat(JavaType javaType) throws JsonMappingException;

    JsonNullFormatVisitor expectNullFormat(JavaType javaType) throws JsonMappingException;

    JsonAnyFormatVisitor expectAnyFormat(JavaType javaType) throws JsonMappingException;

    JsonMapFormatVisitor expectMapFormat(JavaType javaType) throws JsonMappingException;
}
