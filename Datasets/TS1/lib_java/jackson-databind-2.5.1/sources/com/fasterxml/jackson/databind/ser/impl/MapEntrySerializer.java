package com.fasterxml.jackson.databind.ser.impl;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap;
import java.io.IOException;
import java.util.Map;

@JacksonStdImpl
/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/impl/MapEntrySerializer.class */
public class MapEntrySerializer extends ContainerSerializer<Map.Entry<?, ?>> implements ContextualSerializer {
    protected final BeanProperty _property;
    protected final boolean _valueTypeIsStatic;
    protected final JavaType _entryType;
    protected final JavaType _keyType;
    protected final JavaType _valueType;
    protected JsonSerializer<Object> _keySerializer;
    protected JsonSerializer<Object> _valueSerializer;
    protected final TypeSerializer _valueTypeSerializer;
    protected PropertySerializerMap _dynamicValueSerializers;

    public MapEntrySerializer(JavaType type, JavaType keyType, JavaType valueType, boolean staticTyping, TypeSerializer vts, BeanProperty property) {
        super(type);
        this._entryType = type;
        this._keyType = keyType;
        this._valueType = valueType;
        this._valueTypeIsStatic = staticTyping;
        this._valueTypeSerializer = vts;
        this._property = property;
        this._dynamicValueSerializers = PropertySerializerMap.emptyForProperties();
    }

    protected MapEntrySerializer(MapEntrySerializer src, BeanProperty property, TypeSerializer vts, JsonSerializer<?> keySer, JsonSerializer<?> valueSer) {
        super(Map.class, false);
        this._entryType = src._entryType;
        this._keyType = src._keyType;
        this._valueType = src._valueType;
        this._valueTypeIsStatic = src._valueTypeIsStatic;
        this._valueTypeSerializer = src._valueTypeSerializer;
        this._keySerializer = keySer;
        this._valueSerializer = valueSer;
        this._dynamicValueSerializers = src._dynamicValueSerializers;
        this._property = src._property;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public ContainerSerializer<?> _withValueTypeSerializer(TypeSerializer vts) {
        return new MapEntrySerializer(this, this._property, vts, this._keySerializer, this._valueSerializer);
    }

    public MapEntrySerializer withResolved(BeanProperty property, JsonSerializer<?> keySerializer, JsonSerializer<?> valueSerializer) {
        return new MapEntrySerializer(this, property, this._valueTypeSerializer, keySerializer, valueSerializer);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<?> keySer;
        JsonSerializer<?> ser = null;
        JsonSerializer<?> keySer2 = null;
        AnnotationIntrospector intr = provider.getAnnotationIntrospector();
        AnnotatedMember propertyAcc = property == null ? null : property.getMember();
        if (propertyAcc != null && intr != null) {
            Object serDef = intr.findKeySerializer(propertyAcc);
            if (serDef != null) {
                keySer2 = provider.serializerInstance(propertyAcc, serDef);
            }
            Object serDef2 = intr.findContentSerializer(propertyAcc);
            if (serDef2 != null) {
                ser = provider.serializerInstance(propertyAcc, serDef2);
            }
        }
        if (ser == null) {
            ser = this._valueSerializer;
        }
        JsonSerializer<?> ser2 = findConvertingContentSerializer(provider, property, ser);
        if (ser2 == null) {
            if ((this._valueTypeIsStatic && this._valueType.getRawClass() != Object.class) || hasContentTypeAnnotation(provider, property)) {
                ser2 = provider.findValueSerializer(this._valueType, property);
            }
        } else {
            ser2 = provider.handleSecondaryContextualization(ser2, property);
        }
        if (keySer2 == null) {
            keySer2 = this._keySerializer;
        }
        if (keySer2 == null) {
            keySer = provider.findKeySerializer(this._keyType, property);
        } else {
            keySer = provider.handleSecondaryContextualization(keySer2, property);
        }
        MapEntrySerializer mser = withResolved(property, keySer, ser2);
        return mser;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JavaType getContentType() {
        return this._valueType;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JsonSerializer<?> getContentSerializer() {
        return this._valueSerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(Map.Entry<?, ?> value) {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, Map.Entry<?, ?> value) {
        return value == null;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Map.Entry<?, ?> value, JsonGenerator gen, SerializerProvider provider) throws IOException {
        gen.writeStartObject();
        gen.setCurrentValue(value);
        if (this._valueSerializer != null) {
            serializeUsing(value, gen, provider, this._valueSerializer);
        } else {
            serializeDynamic(value, gen, provider);
        }
        gen.writeEndObject();
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Map.Entry<?, ?> value, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        typeSer.writeTypePrefixForObject(value, gen);
        gen.setCurrentValue(value);
        if (this._valueSerializer != null) {
            serializeUsing(value, gen, provider, this._valueSerializer);
        } else {
            serializeDynamic(value, gen, provider);
        }
        typeSer.writeTypeSuffixForObject(value, gen);
    }

    protected void serializeDynamic(Map.Entry<?, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException {
        JsonSerializer<Object> keySerializer = this._keySerializer;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        TypeSerializer vts = this._valueTypeSerializer;
        PropertySerializerMap serializers = this._dynamicValueSerializers;
        Object valueElem = value.getValue();
        Object keyElem = value.getKey();
        if (keyElem == null) {
            provider.findNullKeySerializer(this._keyType, this._property).serialize(null, jgen, provider);
        } else if (skipNulls && valueElem == null) {
            return;
        } else {
            keySerializer.serialize(keyElem, jgen, provider);
        }
        if (valueElem == null) {
            provider.defaultSerializeNull(jgen);
            return;
        }
        Class<?> cc = valueElem.getClass();
        JsonSerializer<Object> ser = serializers.serializerFor(cc);
        if (ser == null) {
            if (this._valueType.hasGenericTypes()) {
                ser = _findAndAddDynamic(serializers, provider.constructSpecializedType(this._valueType, cc), provider);
            } else {
                ser = _findAndAddDynamic(serializers, cc, provider);
            }
            PropertySerializerMap propertySerializerMap = this._dynamicValueSerializers;
        }
        try {
            if (vts == null) {
                ser.serialize(valueElem, jgen, provider);
            } else {
                ser.serializeWithType(valueElem, jgen, provider, vts);
            }
        } catch (Exception e) {
            String keyDesc = "" + keyElem;
            wrapAndThrow(provider, e, value, keyDesc);
        }
    }

    protected void serializeUsing(Map.Entry<?, ?> value, JsonGenerator jgen, SerializerProvider provider, JsonSerializer<Object> ser) throws IOException, JsonGenerationException {
        JsonSerializer<Object> keySerializer = this._keySerializer;
        TypeSerializer vts = this._valueTypeSerializer;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        Object valueElem = value.getValue();
        Object keyElem = value.getKey();
        if (keyElem == null) {
            provider.findNullKeySerializer(this._keyType, this._property).serialize(null, jgen, provider);
        } else if (skipNulls && valueElem == null) {
            return;
        } else {
            keySerializer.serialize(keyElem, jgen, provider);
        }
        if (valueElem == null) {
            provider.defaultSerializeNull(jgen);
            return;
        }
        try {
            if (vts == null) {
                ser.serialize(valueElem, jgen, provider);
            } else {
                ser.serializeWithType(valueElem, jgen, provider, vts);
            }
        } catch (Exception e) {
            String keyDesc = "" + keyElem;
            wrapAndThrow(provider, e, value, keyDesc);
        }
    }

    protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, Class<?> type, SerializerProvider provider) throws JsonMappingException {
        PropertySerializerMap.SerializerAndMapResult result = map.findAndAddSecondarySerializer(type, provider, this._property);
        if (map != result.map) {
            this._dynamicValueSerializers = result.map;
        }
        return result.serializer;
    }

    protected final JsonSerializer<Object> _findAndAddDynamic(PropertySerializerMap map, JavaType type, SerializerProvider provider) throws JsonMappingException {
        PropertySerializerMap.SerializerAndMapResult result = map.findAndAddSecondarySerializer(type, provider, this._property);
        if (map != result.map) {
            this._dynamicValueSerializers = result.map;
        }
        return result.serializer;
    }
}
