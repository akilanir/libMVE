package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.SerializableString;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationFeature;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.jsonschema.JsonSchema;
import com.fasterxml.jackson.databind.jsonschema.SchemaAware;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.JsonNodeFactory;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.util.EnumValues;
import java.io.IOException;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;

@JacksonStdImpl
@Deprecated
/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/ser/std/EnumMapSerializer.class */
public class EnumMapSerializer extends ContainerSerializer<EnumMap<? extends Enum<?>, ?>> implements ContextualSerializer {
    protected final boolean _staticTyping;
    protected final BeanProperty _property;
    protected final EnumValues _keyEnums;
    protected final JavaType _valueType;
    protected final JsonSerializer<Object> _valueSerializer;
    protected final TypeSerializer _valueTypeSerializer;

    public EnumMapSerializer(JavaType valueType, boolean staticTyping, EnumValues keyEnums, TypeSerializer vts, JsonSerializer<Object> valueSerializer) {
        super(EnumMap.class, false);
        this._property = null;
        this._staticTyping = staticTyping || (valueType != null && valueType.isFinal());
        this._valueType = valueType;
        this._keyEnums = keyEnums;
        this._valueTypeSerializer = vts;
        this._valueSerializer = valueSerializer;
    }

    public EnumMapSerializer(EnumMapSerializer src, BeanProperty property, JsonSerializer<?> ser) {
        super(src);
        this._property = property;
        this._staticTyping = src._staticTyping;
        this._valueType = src._valueType;
        this._keyEnums = src._keyEnums;
        this._valueTypeSerializer = src._valueTypeSerializer;
        this._valueSerializer = ser;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public EnumMapSerializer _withValueTypeSerializer(TypeSerializer vts) {
        return new EnumMapSerializer(this._valueType, this._staticTyping, this._keyEnums, vts, this._valueSerializer);
    }

    public EnumMapSerializer withValueSerializer(BeanProperty prop, JsonSerializer<?> ser) {
        if (this._property == prop && ser == this._valueSerializer) {
            return this;
        }
        return new EnumMapSerializer(this, prop, ser);
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        AnnotatedMember m;
        Object serDef;
        JsonSerializer<?> ser = null;
        if (property != null && (m = property.getMember()) != null && (serDef = provider.getAnnotationIntrospector().findContentSerializer(m)) != null) {
            ser = provider.serializerInstance(m, serDef);
        }
        if (ser == null) {
            ser = this._valueSerializer;
        }
        JsonSerializer<?> ser2 = findConvertingContentSerializer(provider, property, ser);
        if (ser2 == null) {
            if (this._staticTyping) {
                return withValueSerializer(property, provider.findValueSerializer(this._valueType, property));
            }
        } else {
            ser2 = provider.handleSecondaryContextualization(ser2, property);
        }
        if (ser2 != this._valueSerializer) {
            return withValueSerializer(property, ser2);
        }
        return this;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JavaType getContentType() {
        return this._valueType;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public JsonSerializer<?> getContentSerializer() {
        return this._valueSerializer;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean isEmpty(SerializerProvider prov, EnumMap<? extends Enum<?>, ?> value) {
        return value == null || value.isEmpty();
    }

    @Override // com.fasterxml.jackson.databind.ser.ContainerSerializer
    public boolean hasSingleElement(EnumMap<? extends Enum<?>, ?> value) {
        return value.size() == 1;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public void serialize(EnumMap<? extends Enum<?>, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        jgen.writeStartObject();
        if (!value.isEmpty()) {
            serializeContents(value, jgen, provider);
        }
        jgen.writeEndObject();
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(EnumMap<? extends Enum<?>, ?> value, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
        typeSer.writeTypePrefixForObject(value, jgen);
        if (!value.isEmpty()) {
            serializeContents(value, jgen, provider);
        }
        typeSer.writeTypeSuffixForObject(value, jgen);
    }

    protected void serializeContents(EnumMap<? extends Enum<?>, ?> value, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        JsonSerializer<Object> currSerializer;
        if (this._valueSerializer != null) {
            serializeContentsUsing(value, jgen, provider, this._valueSerializer);
            return;
        }
        JsonSerializer<Object> prevSerializer = null;
        Class<?> prevClass = null;
        EnumValues keyEnums = this._keyEnums;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        boolean useToString = provider.isEnabled(SerializationFeature.WRITE_ENUMS_USING_TO_STRING);
        TypeSerializer vts = this._valueTypeSerializer;
        Iterator i$ = value.entrySet().iterator();
        while (i$.hasNext()) {
            Map.Entry<? extends Enum<?>, ?> entry = (Map.Entry) i$.next();
            Object valueElem = entry.getValue();
            if (!skipNulls || valueElem != null) {
                Enum<?> key = (Enum) entry.getKey();
                if (useToString) {
                    jgen.writeFieldName(key.toString());
                } else {
                    if (keyEnums == null) {
                        StdSerializer<?> ser = (StdSerializer) provider.findValueSerializer(key.getDeclaringClass(), this._property);
                        keyEnums = ((EnumSerializer) ser).getEnumValues();
                    }
                    jgen.writeFieldName(keyEnums.serializedValueFor(key));
                }
                if (valueElem == null) {
                    provider.defaultSerializeNull(jgen);
                } else {
                    Class<?> cc = valueElem.getClass();
                    if (cc == prevClass) {
                        currSerializer = prevSerializer;
                    } else {
                        currSerializer = provider.findValueSerializer(cc, this._property);
                        prevSerializer = currSerializer;
                        prevClass = cc;
                    }
                    if (vts == null) {
                        try {
                            currSerializer.serialize(valueElem, jgen, provider);
                        } catch (Exception e) {
                            wrapAndThrow(provider, e, value, ((Enum) entry.getKey()).name());
                        }
                    } else {
                        currSerializer.serializeWithType(valueElem, jgen, provider, vts);
                    }
                }
            }
        }
    }

    protected void serializeContentsUsing(EnumMap<? extends Enum<?>, ?> value, JsonGenerator jgen, SerializerProvider provider, JsonSerializer<Object> valueSer) throws IOException, JsonGenerationException {
        EnumValues keyEnums = this._keyEnums;
        boolean skipNulls = !provider.isEnabled(SerializationFeature.WRITE_NULL_MAP_VALUES);
        boolean useToString = provider.isEnabled(SerializationFeature.WRITE_ENUMS_USING_TO_STRING);
        TypeSerializer vts = this._valueTypeSerializer;
        Iterator i$ = value.entrySet().iterator();
        while (i$.hasNext()) {
            Map.Entry<? extends Enum<?>, ?> entry = (Map.Entry) i$.next();
            Object valueElem = entry.getValue();
            if (!skipNulls || valueElem != null) {
                Enum<?> key = (Enum) entry.getKey();
                if (useToString) {
                    jgen.writeFieldName(key.toString());
                } else {
                    if (keyEnums == null) {
                        StdSerializer<?> ser = (StdSerializer) provider.findValueSerializer(key.getDeclaringClass(), this._property);
                        keyEnums = ((EnumSerializer) ser).getEnumValues();
                    }
                    jgen.writeFieldName(keyEnums.serializedValueFor(key));
                }
                if (valueElem == null) {
                    provider.defaultSerializeNull(jgen);
                } else if (vts == null) {
                    try {
                        valueSer.serialize(valueElem, jgen, provider);
                    } catch (Exception e) {
                        wrapAndThrow(provider, e, value, ((Enum) entry.getKey()).name());
                    }
                } else {
                    valueSer.serializeWithType(valueElem, jgen, provider, vts);
                }
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        ObjectNode o = createSchemaNode("object", true);
        if (typeHint instanceof ParameterizedType) {
            Type[] typeArgs = ((ParameterizedType) typeHint).getActualTypeArguments();
            if (typeArgs.length == 2) {
                JavaType enumType = provider.constructType(typeArgs[0]);
                JavaType valueType = provider.constructType(typeArgs[1]);
                ObjectNode propsNode = JsonNodeFactory.instance.objectNode();
                Enum<?>[] arr$ = (Enum[]) enumType.getRawClass().getEnumConstants();
                for (Enum<?> enumValue : arr$) {
                    JsonFormatVisitable findValueSerializer = provider.findValueSerializer(valueType.getRawClass(), this._property);
                    JsonNode schemaNode = findValueSerializer instanceof SchemaAware ? ((SchemaAware) findValueSerializer).getSchema(provider, null) : JsonSchema.getDefaultSchemaNode();
                    propsNode.set(provider.getConfig().getAnnotationIntrospector().findEnumValue(enumValue), schemaNode);
                }
                o.set("properties", propsNode);
            }
        }
        return o;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonObjectFormatVisitor objectVisitor;
        if (visitor == null || (objectVisitor = visitor.expectObjectFormat(typeHint)) == null) {
            return;
        }
        JavaType valueType = typeHint.mo2containedType(1);
        JsonSerializer<Object> ser = this._valueSerializer;
        if (ser == null && valueType != null) {
            ser = visitor.getProvider().findValueSerializer(valueType, this._property);
        }
        if (valueType == null) {
            valueType = visitor.getProvider().constructType(Object.class);
        }
        EnumValues keyEnums = this._keyEnums;
        if (keyEnums == null) {
            JavaType enumType = typeHint.mo2containedType(0);
            if (enumType == null) {
                throw new IllegalStateException("Can not resolve Enum type of EnumMap: " + typeHint);
            }
            JsonSerializer<?> enumSer = visitor.getProvider().findValueSerializer(enumType, this._property);
            if (!(enumSer instanceof EnumSerializer)) {
                throw new IllegalStateException("Can not resolve Enum type of EnumMap: " + typeHint);
            }
            keyEnums = ((EnumSerializer) enumSer).getEnumValues();
        }
        Iterator i$ = keyEnums.internalMap().entrySet().iterator();
        while (i$.hasNext()) {
            Map.Entry<?, SerializableString> entry = (Map.Entry) i$.next();
            String name = entry.getValue().getValue();
            if (ser == null) {
                ser = visitor.getProvider().findValueSerializer(entry.getKey().getClass(), this._property);
            }
            objectVisitor.property(name, ser, valueType);
        }
    }
}
