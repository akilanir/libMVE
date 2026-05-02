package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.PropertyWriter;
import java.io.IOException;
import java.lang.annotation.Annotation;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/std/MapProperty.class */
public class MapProperty extends PropertyWriter {
    protected final TypeSerializer _typeSerializer;
    protected final BeanProperty _property;
    protected Object _key;
    protected JsonSerializer<Object> _keySerializer;
    protected JsonSerializer<Object> _valueSerializer;

    @Deprecated
    public MapProperty(TypeSerializer typeSer) {
        this(typeSer, null);
    }

    public MapProperty(TypeSerializer typeSer, BeanProperty prop) {
        this._typeSerializer = typeSer;
        this._property = prop;
    }

    public void reset(Object key, JsonSerializer<Object> keySer, JsonSerializer<Object> valueSer) {
        this._key = key;
        this._keySerializer = keySer;
        this._valueSerializer = valueSer;
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter, com.fasterxml.jackson.databind.BeanProperty, com.fasterxml.jackson.databind.util.Named
    public String getName() {
        if (this._key instanceof String) {
            return (String) this._key;
        }
        return String.valueOf(this._key);
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter, com.fasterxml.jackson.databind.BeanProperty
    public PropertyName getFullName() {
        return new PropertyName(getName());
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter, com.fasterxml.jackson.databind.BeanProperty
    public <A extends Annotation> A getAnnotation(Class<A> cls) {
        if (this._property == null) {
            return null;
        }
        return (A) this._property.getAnnotation(cls);
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter, com.fasterxml.jackson.databind.BeanProperty
    public <A extends Annotation> A getContextAnnotation(Class<A> cls) {
        if (this._property == null) {
            return null;
        }
        return (A) this._property.getContextAnnotation(cls);
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter
    public void serializeAsField(Object value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        this._keySerializer.serialize(this._key, jgen, provider);
        if (this._typeSerializer == null) {
            this._valueSerializer.serialize(value, jgen, provider);
        } else {
            this._valueSerializer.serializeWithType(value, jgen, provider, this._typeSerializer);
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter
    public void serializeAsOmittedField(Object value, JsonGenerator jgen, SerializerProvider provider) throws Exception {
        if (!jgen.canOmitFields()) {
            jgen.writeOmittedField(getName());
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter
    public void serializeAsElement(Object value, JsonGenerator jgen, SerializerProvider provider) throws Exception {
        if (this._typeSerializer == null) {
            this._valueSerializer.serialize(value, jgen, provider);
        } else {
            this._valueSerializer.serializeWithType(value, jgen, provider, this._typeSerializer);
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter
    public void serializeAsPlaceholder(Object value, JsonGenerator jgen, SerializerProvider provider) throws Exception {
        jgen.writeNull();
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter, com.fasterxml.jackson.databind.BeanProperty
    public void depositSchemaProperty(JsonObjectFormatVisitor objectVisitor) throws JsonMappingException {
    }

    @Override // com.fasterxml.jackson.databind.ser.PropertyWriter
    @Deprecated
    public void depositSchemaProperty(ObjectNode propertiesNode, SerializerProvider provider) throws JsonMappingException {
    }
}
