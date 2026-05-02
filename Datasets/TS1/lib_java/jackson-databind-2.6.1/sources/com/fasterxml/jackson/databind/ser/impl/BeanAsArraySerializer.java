package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.std.BeanSerializerBase;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/ser/impl/BeanAsArraySerializer.class */
public class BeanAsArraySerializer extends BeanSerializerBase {
    private static final long serialVersionUID = 1;
    protected final BeanSerializerBase _defaultSerializer;

    public BeanAsArraySerializer(BeanSerializerBase src) {
        super(src, (ObjectIdWriter) null);
        this._defaultSerializer = src;
    }

    protected BeanAsArraySerializer(BeanSerializerBase src, String[] toIgnore) {
        super(src, toIgnore);
        this._defaultSerializer = src;
    }

    protected BeanAsArraySerializer(BeanSerializerBase src, ObjectIdWriter oiw, Object filterId) {
        super(src, oiw, filterId);
        this._defaultSerializer = src;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public JsonSerializer<Object> unwrappingSerializer(NameTransformer transformer) {
        return this._defaultSerializer.unwrappingSerializer(transformer);
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isUnwrappingSerializer() {
        return false;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    public BeanSerializerBase withObjectIdWriter(ObjectIdWriter objectIdWriter) {
        return this._defaultSerializer.withObjectIdWriter(objectIdWriter);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.JsonSerializer
    public BeanSerializerBase withFilterId(Object filterId) {
        return new BeanAsArraySerializer(this, this._objectIdWriter, filterId);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    public BeanAsArraySerializer withIgnorals(String[] toIgnore) {
        return new BeanAsArraySerializer(this, toIgnore);
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase
    protected BeanSerializerBase asArraySerializer() {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object bean, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        if (this._objectIdWriter != null) {
            _serializeWithObjectId(bean, gen, provider, typeSer);
            return;
        }
        String typeStr = this._typeId == null ? null : _customTypeId(bean);
        if (typeStr == null) {
            typeSer.writeTypePrefixForArray(bean, gen);
        } else {
            typeSer.writeCustomTypePrefixForArray(bean, gen, typeStr);
        }
        serializeAsArray(bean, gen, provider);
        if (typeStr == null) {
            typeSer.writeTypeSuffixForArray(bean, gen);
        } else {
            typeSer.writeCustomTypeSuffixForArray(bean, gen, typeStr);
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.BeanSerializerBase, com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public final void serialize(Object bean, JsonGenerator gen, SerializerProvider provider) throws IOException {
        if (provider.isEnabled(SerializationFeature.WRITE_SINGLE_ELEM_ARRAYS_UNWRAPPED) && hasSingleElement(provider)) {
            serializeAsArray(bean, gen, provider);
            return;
        }
        gen.writeStartArray();
        gen.setCurrentValue(bean);
        serializeAsArray(bean, gen, provider);
        gen.writeEndArray();
    }

    private boolean hasSingleElement(SerializerProvider provider) {
        BeanPropertyWriter[] props;
        if (this._filteredProps != null && provider.getActiveView() != null) {
            props = this._filteredProps;
        } else {
            props = this._props;
        }
        return props.length == 1;
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [com.fasterxml.jackson.databind.JsonMappingException, java.lang.Throwable] */
    protected final void serializeAsArray(Object bean, JsonGenerator gen, SerializerProvider provider) throws IOException {
        BeanPropertyWriter[] props;
        if (this._filteredProps != null && provider.getActiveView() != null) {
            props = this._filteredProps;
        } else {
            props = this._props;
        }
        int i = 0;
        try {
            int len = props.length;
            while (i < len) {
                BeanPropertyWriter prop = props[i];
                if (prop == null) {
                    gen.writeNull();
                } else {
                    prop.serializeAsElement(bean, gen, provider);
                }
                i++;
            }
        } catch (Exception e) {
            String name = i == props.length ? "[anySetter]" : props[i].getName();
            wrapAndThrow(provider, e, bean, name);
        } catch (StackOverflowError e2) {
            ?? jsonMappingException = new JsonMappingException("Infinite recursion (StackOverflowError)", e2);
            String name2 = i == props.length ? "[anySetter]" : props[i].getName();
            jsonMappingException.prependPath(new JsonMappingException.Reference(bean, name2));
            throw jsonMappingException;
        }
    }

    public String toString() {
        return "BeanAsArraySerializer for " + handledType().getName();
    }
}
