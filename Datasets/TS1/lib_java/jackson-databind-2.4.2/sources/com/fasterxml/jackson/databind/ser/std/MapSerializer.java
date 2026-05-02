package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonMapFormatVisitor;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.impl.PropertySerializerMap;
import com.fasterxml.jackson.databind.type.TypeFactory;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.HashSet;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

@JacksonStdImpl
/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/ser/std/MapSerializer.class */
public class MapSerializer extends ContainerSerializer<Map<?, ?>> implements ContextualSerializer {
    protected static final JavaType UNSPECIFIED_TYPE = TypeFactory.unknownType();
    protected final BeanProperty _property;
    protected final HashSet<String> _ignoredEntries;
    protected final boolean _valueTypeIsStatic;
    protected final JavaType _keyType;
    protected final JavaType _valueType;
    protected JsonSerializer<Object> _keySerializer;
    protected JsonSerializer<Object> _valueSerializer;
    protected final TypeSerializer _valueTypeSerializer;
    protected PropertySerializerMap _dynamicValueSerializers;
    protected final Object _filterId;
    protected final boolean _sortKeys;

    protected MapSerializer(HashSet<String> ignoredEntries, JavaType keyType, JavaType valueType, boolean valueTypeIsStatic, TypeSerializer vts, JsonSerializer<?> keySerializer, JsonSerializer<?> valueSerializer) {
        super(Map.class, false);
        this._ignoredEntries = ignoredEntries;
        this._keyType = keyType;
        this._valueType = valueType;
        this._valueTypeIsStatic = valueTypeIsStatic;
        this._valueTypeSerializer = vts;
        this._keySerializer = keySerializer;
        this._valueSerializer = valueSerializer;
        this._dynamicValueSerializers = PropertySerializerMap.emptyMap();
        this._property = null;
        this._filterId = null;
        this._sortKeys = false;
    }

    protected MapSerializer(MapSerializer src, BeanProperty property, JsonSerializer<?> keySerializer, JsonSerializer<?> valueSerializer, HashSet<String> ignored) {
        super(Map.class, false);
        this._ignoredEntries = ignored;
        this._keyType = src._keyType;
        this._valueType = src._valueType;
        this._valueTypeIsStatic = src._valueTypeIsStatic;
        this._valueTypeSerializer = src._valueTypeSerializer;
        this._keySerializer = keySerializer;
        this._valueSerializer = valueSerializer;
        this._dynamicValueSerializers = src._dynamicValueSerializers;
        this._property = property;
        this._filterId = src._filterId;
        this._sortKeys = src._sortKeys;
    }

    protected MapSerializer(MapSerializer src, TypeSerializer vts) {
        super(Map.class, false);
        this._ignoredEntries = src._ignoredEntries;
        this._keyType = src._keyType;
        this._valueType = src._valueType;
        this._valueTypeIsStatic = src._valueTypeIsStatic;
        this._valueTypeSerializer = vts;
        this._keySerializer = src._keySerializer;
        this._valueSerializer = src._valueSerializer;
        this._dynamicValueSerializers = src._dynamicValueSerializers;
        this._property = src._property;
        this._filterId = src._filterId;
        this._sortKeys = src._sortKeys;
    }

    protected MapSerializer(MapSerializer src, Object filterId, boolean sortKeys) {
        super(Map.class, false);
        this._ignoredEntries = src._ignoredEntries;
        this._keyType = src._keyType;
        this._valueType = src._valueType;
        this._valueTypeIsStatic = src._valueTypeIsStatic;
        this._valueTypeSerializer = src._valueTypeSerializer;
        this._keySerializer = src._keySerializer;
        this._valueSerializer = src._valueSerializer;
        this._dynamicValueSerializers = src._dynamicValueSerializers;
        this._property = src._property;
        this._filterId = filterId;
        this._sortKeys = sortKeys;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public MapSerializer _withValueTypeSerializer(TypeSerializer vts) {
        return new MapSerializer(this, vts);
    }

    @Deprecated
    public MapSerializer withResolved(BeanProperty property, JsonSerializer<?> keySerializer, JsonSerializer<?> valueSerializer, HashSet<String> ignored) {
        return withResolved(property, keySerializer, valueSerializer, ignored, this._sortKeys);
    }

    public MapSerializer withResolved(BeanProperty property, JsonSerializer<?> keySerializer, JsonSerializer<?> valueSerializer, HashSet<String> ignored, boolean sortKeys) {
        MapSerializer ser = new MapSerializer(this, property, keySerializer, valueSerializer, ignored);
        if (sortKeys != ser._sortKeys) {
            ser = new MapSerializer(ser, this._filterId, sortKeys);
        }
        return ser;
    }

    public MapSerializer withFilterId(Object filterId) {
        return this._filterId == filterId ? this : new MapSerializer(this, filterId, this._sortKeys);
    }

    @Deprecated
    public static MapSerializer construct(String[] ignoredList, JavaType mapType, boolean staticValueType, TypeSerializer vts, JsonSerializer<Object> keySerializer, JsonSerializer<Object> valueSerializer) {
        return construct(ignoredList, mapType, staticValueType, vts, keySerializer, valueSerializer, null);
    }

    public static MapSerializer construct(String[] ignoredList, JavaType mapType, boolean staticValueType, TypeSerializer vts, JsonSerializer<Object> keySerializer, JsonSerializer<Object> valueSerializer, Object filterId) {
        JavaType keyType;
        JavaType valueType;
        HashSet<String> ignoredEntries = toSet(ignoredList);
        if (mapType == null) {
            JavaType javaType = UNSPECIFIED_TYPE;
            valueType = javaType;
            keyType = javaType;
        } else {
            keyType = mapType.mo4getKeyType();
            valueType = mapType.mo3getContentType();
        }
        if (!staticValueType) {
            staticValueType = valueType != null && valueType.isFinal();
        } else if (valueType.getRawClass() == Object.class) {
            staticValueType = false;
        }
        MapSerializer ser = new MapSerializer(ignoredEntries, keyType, valueType, staticValueType, vts, keySerializer, valueSerializer);
        if (filterId != null) {
            ser = ser.withFilterId(filterId);
        }
        return ser;
    }

    private static HashSet<String> toSet(String[] ignoredEntries) {
        if (ignoredEntries == null || ignoredEntries.length == 0) {
            return null;
        }
        HashSet<String> result = new HashSet<>(ignoredEntries.length);
        for (String prop : ignoredEntries) {
            result.add(prop);
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonSerializer<?> keySer;
        Object filterId;
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
        HashSet<String> ignored = this._ignoredEntries;
        boolean sortKeys = false;
        if (intr != null && propertyAcc != null) {
            String[] moreToIgnore = intr.findPropertiesToIgnore(propertyAcc);
            if (moreToIgnore != null) {
                ignored = ignored == null ? new HashSet<>() : new HashSet<>(ignored);
                for (String str : moreToIgnore) {
                    ignored.add(str);
                }
            }
            Boolean b = intr.findSerializationSortAlphabetically(propertyAcc);
            sortKeys = b != null && b.booleanValue();
        }
        MapSerializer mser = withResolved(property, keySer, ser2, ignored, sortKeys);
        if (property != null && (filterId = intr.findFilterId(property.getMember())) != null) {
            mser = mser.withFilterId(filterId);
        }
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

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(Map<?, ?> value) {
        return value == null || value.isEmpty();
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(Map<?, ?> value) {
        return value.size() == 1;
    }

    public JsonSerializer<?> getKeySerializer() {
        return this._keySerializer;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(Map<?, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        jgen.writeStartObject();
        if (!value.isEmpty()) {
            if (this._filterId != null) {
                serializeFilteredFields(value, jgen, provider, findPropertyFilter(provider, this._filterId, value));
                jgen.writeEndObject();
                return;
            }
            if (this._sortKeys || provider.isEnabled(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS)) {
                value = _orderEntries(value);
            }
            if (this._valueSerializer != null) {
                serializeFieldsUsing(value, jgen, provider, this._valueSerializer);
            } else {
                serializeFields(value, jgen, provider);
            }
        }
        jgen.writeEndObject();
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Map<?, ?> value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
        typeSer.writeTypePrefixForObject(value, jgen);
        if (!value.isEmpty()) {
            if (this._sortKeys || provider.isEnabled(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS)) {
                value = _orderEntries(value);
            }
            if (this._valueSerializer != null) {
                serializeFieldsUsing(value, jgen, provider, this._valueSerializer);
            } else {
                serializeFields(value, jgen, provider);
            }
        }
        typeSer.writeTypeSuffixForObject(value, jgen);
    }

    public void serializeFields(Map<?, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        if (this._valueTypeSerializer != null) {
            serializeTypedFields(value, jgen, provider);
            return;
        }
        JsonSerializer<Object> keySerializer = this._keySerializer;
        HashSet<String> ignored = this._ignoredEntries;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        PropertySerializerMap serializers = this._dynamicValueSerializers;
        for (Map.Entry<?, ?> entry : value.entrySet()) {
            Object valueElem = entry.getValue();
            Object keyElem = entry.getKey();
            if (keyElem == null) {
                provider.findNullKeySerializer(this._keyType, this._property).serialize(null, jgen, provider);
            } else if (!skipNulls || valueElem != null) {
                if (ignored == null || !ignored.contains(keyElem)) {
                    keySerializer.serialize(keyElem, jgen, provider);
                }
            }
            if (valueElem == null) {
                provider.defaultSerializeNull(jgen);
            } else {
                Class<?> cc = valueElem.getClass();
                JsonSerializer<Object> serializer = serializers.serializerFor(cc);
                if (serializer == null) {
                    if (this._valueType.hasGenericTypes()) {
                        serializer = _findAndAddDynamic(serializers, provider.constructSpecializedType(this._valueType, cc), provider);
                    } else {
                        serializer = _findAndAddDynamic(serializers, cc, provider);
                    }
                    serializers = this._dynamicValueSerializers;
                }
                try {
                    serializer.serialize(valueElem, jgen, provider);
                } catch (Exception e) {
                    String keyDesc = "" + keyElem;
                    wrapAndThrow(provider, e, value, keyDesc);
                }
            }
        }
    }

    protected void serializeFieldsUsing(Map<?, ?> value, JsonGenerator jgen, SerializerProvider provider, JsonSerializer<Object> ser) throws IOException, JsonGenerationException {
        JsonSerializer<Object> keySerializer = this._keySerializer;
        HashSet<String> ignored = this._ignoredEntries;
        TypeSerializer typeSer = this._valueTypeSerializer;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        for (Map.Entry<?, ?> entry : value.entrySet()) {
            Object valueElem = entry.getValue();
            Object keyElem = entry.getKey();
            if (keyElem == null) {
                provider.findNullKeySerializer(this._keyType, this._property).serialize(null, jgen, provider);
            } else if (!skipNulls || valueElem != null) {
                if (ignored == null || !ignored.contains(keyElem)) {
                    keySerializer.serialize(keyElem, jgen, provider);
                }
            }
            if (valueElem == null) {
                provider.defaultSerializeNull(jgen);
            } else if (typeSer == null) {
                try {
                    ser.serialize(valueElem, jgen, provider);
                } catch (Exception e) {
                    String keyDesc = "" + keyElem;
                    wrapAndThrow(provider, e, value, keyDesc);
                }
            } else {
                ser.serializeWithType(valueElem, jgen, provider, typeSer);
            }
        }
    }

    /* JADX WARN: Can't wrap try/catch for region: R(10:9|(2:42|11)(2:12|(3:44|17|(2:46|22)(2:49|47))(2:48|47))|23|(1:25)(2:26|(3:28|(1:30)(1:31)|32))|33|39|34|50|47|7) */
    /* JADX WARN: Code restructure failed: missing block: B:35:0x010a, code lost:
    
        r21 = move-exception;
     */
    /* JADX WARN: Code restructure failed: missing block: B:36:0x010c, code lost:
    
        r0 = "" + r0;
        wrapAndThrow(r9, r21, r7, r0);
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void serializeFilteredFields(java.util.Map<?, ?> r7, com.fasterxml.jackson.core.JsonGenerator r8, com.fasterxml.jackson.databind.SerializerProvider r9, com.fasterxml.jackson.databind.ser.PropertyFilter r10) throws java.io.IOException, com.fasterxml.jackson.core.JsonGenerationException {
        /*
            Method dump skipped, instructions count: 304
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.ser.std.MapSerializer.serializeFilteredFields(java.util.Map, com.fasterxml.jackson.core.JsonGenerator, com.fasterxml.jackson.databind.SerializerProvider, com.fasterxml.jackson.databind.ser.PropertyFilter):void");
    }

    protected void serializeTypedFields(Map<?, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        JsonSerializer<Object> currSerializer;
        JsonSerializer<Object> keySerializer = this._keySerializer;
        JsonSerializer<Object> prevValueSerializer = null;
        Class<?> prevValueClass = null;
        HashSet<String> ignored = this._ignoredEntries;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        for (Map.Entry<?, ?> entry : value.entrySet()) {
            Object valueElem = entry.getValue();
            Object keyElem = entry.getKey();
            if (keyElem == null) {
                provider.findNullKeySerializer(this._keyType, this._property).serialize(null, jgen, provider);
            } else if (!skipNulls || valueElem != null) {
                if (ignored == null || !ignored.contains(keyElem)) {
                    keySerializer.serialize(keyElem, jgen, provider);
                }
            }
            if (valueElem == null) {
                provider.defaultSerializeNull(jgen);
            } else {
                Class<?> cc = valueElem.getClass();
                if (cc == prevValueClass) {
                    currSerializer = prevValueSerializer;
                } else {
                    if (this._valueType.hasGenericTypes()) {
                        currSerializer = provider.findValueSerializer(provider.constructSpecializedType(this._valueType, cc), this._property);
                    } else {
                        currSerializer = provider.findValueSerializer(cc, this._property);
                    }
                    prevValueSerializer = currSerializer;
                    prevValueClass = cc;
                }
                try {
                    currSerializer.serializeWithType(valueElem, jgen, provider, this._valueTypeSerializer);
                } catch (Exception e) {
                    String keyDesc = "" + keyElem;
                    wrapAndThrow(provider, e, value, keyDesc);
                }
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) {
        ObjectNode o = createSchemaNode("object", true);
        return o;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonMapFormatVisitor v2 = visitor == null ? null : visitor.expectMapFormat(typeHint);
        if (v2 != null) {
            v2.keyFormat(this._keySerializer, this._keyType);
            JsonSerializer<?> valueSer = this._valueSerializer;
            if (valueSer == null) {
                valueSer = _findAndAddDynamic(this._dynamicValueSerializers, this._valueType, visitor.getProvider());
            }
            v2.valueFormat(valueSer, this._valueType);
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

    protected Map<?, ?> _orderEntries(Map<?, ?> input) {
        if (input instanceof SortedMap) {
            return input;
        }
        return new TreeMap(input);
    }
}
