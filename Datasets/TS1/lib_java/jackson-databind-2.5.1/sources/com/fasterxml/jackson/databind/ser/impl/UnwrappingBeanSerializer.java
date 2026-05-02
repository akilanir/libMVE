package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.std.BeanSerializerBase;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/impl/UnwrappingBeanSerializer.class */
public class UnwrappingBeanSerializer extends BeanSerializerBase {
    private static final long serialVersionUID = 1;
    protected final NameTransformer _nameTransformer;

    public UnwrappingBeanSerializer(BeanSerializerBase src, NameTransformer transformer) {
        super(src, transformer);
        this._nameTransformer = transformer;
    }

    public UnwrappingBeanSerializer(UnwrappingBeanSerializer src, ObjectIdWriter objectIdWriter) {
        super(src, objectIdWriter);
        this._nameTransformer = src._nameTransformer;
    }

    public UnwrappingBeanSerializer(UnwrappingBeanSerializer src, ObjectIdWriter objectIdWriter, Object filterId) {
        super(src, objectIdWriter, filterId);
        this._nameTransformer = src._nameTransformer;
    }

    protected UnwrappingBeanSerializer(UnwrappingBeanSerializer src, String[] toIgnore) {
        super(src, toIgnore);
        this._nameTransformer = src._nameTransformer;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public JsonSerializer<Object> unwrappingSerializer(NameTransformer transformer) {
        return new UnwrappingBeanSerializer(this, transformer);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isUnwrappingSerializer() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    public BeanSerializerBase withObjectIdWriter(ObjectIdWriter objectIdWriter) {
        return new UnwrappingBeanSerializer(this, objectIdWriter);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase withFilterId(Object filterId) {
        return new UnwrappingBeanSerializer(this, this._objectIdWriter, filterId);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase withIgnorals(String[] toIgnore) {
        return new UnwrappingBeanSerializer(this, toIgnore);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase asArraySerializer() {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serialize(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (this._objectIdWriter != null) {
            _serializeWithObjectId(bean, jgen, provider, false);
        } else if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object bean, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
        if (provider.isEnabled(SerializationFeature.FAIL_ON_UNWRAPPED_TYPE_IDENTIFIERS)) {
            throw new JsonMappingException("Unwrapped property requires use of type information: can not serialize without disabling `SerializationFeature.FAIL_ON_UNWRAPPED_TYPE_IDENTIFIERS`");
        }
        if (this._objectIdWriter != null) {
            _serializeWithObjectId(bean, jgen, provider, typeSer);
        } else if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
    }

    public String toString() {
        return "UnwrappingBeanSerializer for " + handledType().getName();
    }
}
