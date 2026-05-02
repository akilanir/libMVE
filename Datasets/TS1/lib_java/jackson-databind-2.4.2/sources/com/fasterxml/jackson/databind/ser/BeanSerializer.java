package com.fasterxml.jackson.databind.ser;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.ser.impl.BeanAsArraySerializer;
import com.fasterxml.jackson.databind.ser.impl.ObjectIdWriter;
import com.fasterxml.jackson.databind.ser.impl.UnwrappingBeanSerializer;
import com.fasterxml.jackson.databind.ser.std.BeanSerializerBase;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/BeanSerializer.class */
public class BeanSerializer extends BeanSerializerBase {
    public BeanSerializer(JavaType type, BeanSerializerBuilder builder, BeanPropertyWriter[] properties, BeanPropertyWriter[] filteredProperties) {
        super(type, builder, properties, filteredProperties);
    }

    protected BeanSerializer(BeanSerializerBase src) {
        super(src);
    }

    protected BeanSerializer(BeanSerializerBase src, ObjectIdWriter objectIdWriter) {
        super(src, objectIdWriter);
    }

    protected BeanSerializer(BeanSerializerBase src, ObjectIdWriter objectIdWriter, Object filterId) {
        super(src, objectIdWriter, filterId);
    }

    protected BeanSerializer(BeanSerializerBase src, String[] toIgnore) {
        super(src, toIgnore);
    }

    public static BeanSerializer createDummy(JavaType forType) {
        return new BeanSerializer(forType, null, NO_PROPS, null);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public JsonSerializer<Object> unwrappingSerializer(NameTransformer unwrapper) {
        return new UnwrappingBeanSerializer(this, unwrapper);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    public BeanSerializerBase withObjectIdWriter(ObjectIdWriter objectIdWriter) {
        return new BeanSerializer(this, objectIdWriter, this._propertyFilterId);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase withFilterId(Object filterId) {
        return new BeanSerializer(this, this._objectIdWriter, filterId);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase withIgnorals(String[] toIgnore) {
        return new BeanSerializer(this, toIgnore);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase asArraySerializer() {
        if (this._objectIdWriter == null && this._anyGetterWriter == null && this._propertyFilterId == null) {
            return new BeanAsArraySerializer(this);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serialize(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (this._objectIdWriter != null) {
            _serializeWithObjectId(bean, jgen, provider, true);
            return;
        }
        jgen.writeStartObject();
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
        jgen.writeEndObject();
    }

    public String toString() {
        return "BeanSerializer for " + handledType().getName();
    }
}
