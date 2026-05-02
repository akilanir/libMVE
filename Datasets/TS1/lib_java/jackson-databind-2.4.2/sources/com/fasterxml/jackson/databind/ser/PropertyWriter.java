package com.fasterxml.jackson.databind.ser;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.node.ObjectNode;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/PropertyWriter.class */
public abstract class PropertyWriter {
    public abstract String getName();

    public abstract PropertyName getFullName();

    public abstract void serializeAsField(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws Exception;

    public abstract void serializeAsOmittedField(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws Exception;

    public abstract void serializeAsElement(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws Exception;

    public abstract void serializeAsPlaceholder(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws Exception;

    public abstract void depositSchemaProperty(JsonObjectFormatVisitor jsonObjectFormatVisitor) throws JsonMappingException;

    @Deprecated
    public abstract void depositSchemaProperty(ObjectNode objectNode, SerializerProvider serializerProvider) throws JsonMappingException;
}
