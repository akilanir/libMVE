package com.fasterxml.jackson.databind.ser.std;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.ObjectIdGenerator;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.fasterxml.jackson.annotation.ObjectIdResolver;
import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.AnnotationIntrospector;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.PropertyName;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.SerializerProvider;
import com.fasterxml.jackson.databind.introspect.AnnotatedMember;
import com.fasterxml.jackson.databind.introspect.ObjectIdInfo;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitorWrapper;
import com.fasterxml.jackson.databind.jsonFormatVisitors.JsonObjectFormatVisitor;
import com.fasterxml.jackson.databind.jsonschema.JsonSerializableSchema;
import com.fasterxml.jackson.databind.jsonschema.SchemaAware;
import com.fasterxml.jackson.databind.jsontype.TypeSerializer;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.ser.AnyGetterWriter;
import com.fasterxml.jackson.databind.ser.BeanPropertyWriter;
import com.fasterxml.jackson.databind.ser.BeanSerializerBuilder;
import com.fasterxml.jackson.databind.ser.ContainerSerializer;
import com.fasterxml.jackson.databind.ser.ContextualSerializer;
import com.fasterxml.jackson.databind.ser.PropertyFilter;
import com.fasterxml.jackson.databind.ser.ResolvableSerializer;
import com.fasterxml.jackson.databind.ser.impl.ObjectIdWriter;
import com.fasterxml.jackson.databind.ser.impl.PropertyBasedObjectIdGenerator;
import com.fasterxml.jackson.databind.ser.impl.WritableObjectId;
import com.fasterxml.jackson.databind.util.ArrayBuilders;
import com.fasterxml.jackson.databind.util.Converter;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.HashSet;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/BeanSerializerBase.class */
public abstract class BeanSerializerBase extends StdSerializer<Object> implements ContextualSerializer, ResolvableSerializer, JsonFormatVisitable, SchemaAware {
    protected static final PropertyName NAME_FOR_OBJECT_REF = new PropertyName("#object-ref");
    protected static final BeanPropertyWriter[] NO_PROPS = new BeanPropertyWriter[0];
    protected final BeanPropertyWriter[] _props;
    protected final BeanPropertyWriter[] _filteredProps;
    protected final AnyGetterWriter _anyGetterWriter;
    protected final Object _propertyFilterId;
    protected final AnnotatedMember _typeId;
    protected final ObjectIdWriter _objectIdWriter;
    protected final JsonFormat.Shape _serializationShape;

    public abstract BeanSerializerBase withObjectIdWriter(ObjectIdWriter objectIdWriter);

    protected abstract BeanSerializerBase withIgnorals(String[] strArr);

    protected abstract BeanSerializerBase asArraySerializer();

    protected abstract BeanSerializerBase withFilterId(Object obj);

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer
    public abstract void serialize(Object obj, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException;

    protected BeanSerializerBase(JavaType type, BeanSerializerBuilder builder, BeanPropertyWriter[] properties, BeanPropertyWriter[] filteredProperties) {
        super(type);
        this._props = properties;
        this._filteredProps = filteredProperties;
        if (builder == null) {
            this._typeId = null;
            this._anyGetterWriter = null;
            this._propertyFilterId = null;
            this._objectIdWriter = null;
            this._serializationShape = null;
            return;
        }
        this._typeId = builder.getTypeId();
        this._anyGetterWriter = builder.getAnyGetter();
        this._propertyFilterId = builder.getFilterId();
        this._objectIdWriter = builder.getObjectIdWriter();
        JsonFormat.Value format = builder.getBeanDescription().findExpectedFormat(null);
        this._serializationShape = format == null ? null : format.getShape();
    }

    public BeanSerializerBase(BeanSerializerBase src, BeanPropertyWriter[] properties, BeanPropertyWriter[] filteredProperties) {
        super(src._handledType);
        this._props = properties;
        this._filteredProps = filteredProperties;
        this._typeId = src._typeId;
        this._anyGetterWriter = src._anyGetterWriter;
        this._objectIdWriter = src._objectIdWriter;
        this._propertyFilterId = src._propertyFilterId;
        this._serializationShape = src._serializationShape;
    }

    protected BeanSerializerBase(BeanSerializerBase src, ObjectIdWriter objectIdWriter) {
        this(src, objectIdWriter, src._propertyFilterId);
    }

    protected BeanSerializerBase(BeanSerializerBase src, ObjectIdWriter objectIdWriter, Object filterId) {
        super(src._handledType);
        this._props = src._props;
        this._filteredProps = src._filteredProps;
        this._typeId = src._typeId;
        this._anyGetterWriter = src._anyGetterWriter;
        this._objectIdWriter = objectIdWriter;
        this._propertyFilterId = filterId;
        this._serializationShape = src._serializationShape;
    }

    protected BeanSerializerBase(BeanSerializerBase src, String[] toIgnore) {
        super(src._handledType);
        HashSet<String> ignoredSet = ArrayBuilders.arrayToSet(toIgnore);
        BeanPropertyWriter[] propsIn = src._props;
        BeanPropertyWriter[] fpropsIn = src._filteredProps;
        int len = propsIn.length;
        ArrayList<BeanPropertyWriter> propsOut = new ArrayList<>(len);
        ArrayList<BeanPropertyWriter> fpropsOut = fpropsIn == null ? null : new ArrayList<>(len);
        for (int i = 0; i < len; i++) {
            BeanPropertyWriter bpw = propsIn[i];
            if (!ignoredSet.contains(bpw.getName())) {
                propsOut.add(bpw);
                if (fpropsIn != null) {
                    fpropsOut.add(fpropsIn[i]);
                }
            }
        }
        this._props = (BeanPropertyWriter[]) propsOut.toArray(new BeanPropertyWriter[propsOut.size()]);
        this._filteredProps = fpropsOut == null ? null : (BeanPropertyWriter[]) fpropsOut.toArray(new BeanPropertyWriter[fpropsOut.size()]);
        this._typeId = src._typeId;
        this._anyGetterWriter = src._anyGetterWriter;
        this._objectIdWriter = src._objectIdWriter;
        this._propertyFilterId = src._propertyFilterId;
        this._serializationShape = src._serializationShape;
    }

    protected BeanSerializerBase(BeanSerializerBase src) {
        this(src, src._props, src._filteredProps);
    }

    protected BeanSerializerBase(BeanSerializerBase src, NameTransformer unwrapper) {
        this(src, rename(src._props, unwrapper), rename(src._filteredProps, unwrapper));
    }

    private static final BeanPropertyWriter[] rename(BeanPropertyWriter[] props, NameTransformer transformer) {
        if (props == null || props.length == 0 || transformer == null || transformer == NameTransformer.NOP) {
            return props;
        }
        int len = props.length;
        BeanPropertyWriter[] result = new BeanPropertyWriter[len];
        for (int i = 0; i < len; i++) {
            BeanPropertyWriter bpw = props[i];
            if (bpw != null) {
                result[i] = bpw.rename(transformer);
            }
        }
        return result;
    }

    @Override // com.fasterxml.jackson.databind.ser.ResolvableSerializer
    public void resolve(SerializerProvider provider) throws JsonMappingException {
        BeanPropertyWriter w2;
        TypeSerializer typeSer;
        JsonSerializer<Object> nullSer;
        BeanPropertyWriter w22;
        int filteredCount = this._filteredProps == null ? 0 : this._filteredProps.length;
        int len = this._props.length;
        for (int i = 0; i < len; i++) {
            BeanPropertyWriter prop = this._props[i];
            if (!prop.willSuppressNulls() && !prop.hasNullSerializer() && (nullSer = provider.findNullValueSerializer(prop)) != null) {
                prop.assignNullSerializer(nullSer);
                if (i < filteredCount && (w22 = this._filteredProps[i]) != null) {
                    w22.assignNullSerializer(nullSer);
                }
            }
            if (!prop.hasSerializer()) {
                JsonSerializer<Object> ser = findConvertingSerializer(provider, prop);
                if (ser == null) {
                    JavaType type = prop.getSerializationType();
                    if (type == null) {
                        type = provider.constructType(prop.getGenericPropertyType());
                        if (!type.isFinal()) {
                            if (type.isContainerType() || type.containedTypeCount() > 0) {
                                prop.setNonTrivialBaseType(type);
                            }
                        }
                    }
                    ser = provider.findValueSerializer(type, prop);
                    if (type.isContainerType() && (typeSer = (TypeSerializer) type.mo3getContentType().getTypeHandler()) != null && (ser instanceof ContainerSerializer)) {
                        JsonSerializer<Object> ser2 = ((ContainerSerializer) ser).withValueTypeSerializer(typeSer);
                        ser = ser2;
                    }
                    prop.assignSerializer(ser);
                    if (i >= filteredCount && (w2 = this._filteredProps[i]) != null) {
                        w2.assignSerializer(ser);
                    }
                } else {
                    prop.assignSerializer(ser);
                    if (i >= filteredCount) {
                    }
                }
            }
        }
        if (this._anyGetterWriter != null) {
            this._anyGetterWriter.resolve(provider);
        }
    }

    protected JsonSerializer<Object> findConvertingSerializer(SerializerProvider provider, BeanPropertyWriter prop) throws JsonMappingException {
        AnnotatedMember m;
        Object convDef;
        AnnotationIntrospector intr = provider.getAnnotationIntrospector();
        if (intr != null && (m = prop.getMember()) != null && (convDef = intr.findSerializationConverter(m)) != null) {
            Converter<Object, Object> conv = provider.converterInstance(prop.getMember(), convDef);
            JavaType delegateType = conv.getOutputType(provider.getTypeFactory());
            JsonSerializer<?> ser = provider.findValueSerializer(delegateType, prop);
            return new StdDelegatingSerializer(conv, delegateType, ser);
        }
        return null;
    }

    @Override // com.fasterxml.jackson.databind.ser.ContextualSerializer
    public JsonSerializer<?> createContextual(SerializerProvider provider, BeanProperty property) throws JsonMappingException {
        JsonFormat.Value format;
        AnnotationIntrospector intr = provider.getAnnotationIntrospector();
        AnnotatedMember accessor = (property == null || intr == null) ? null : property.getMember();
        SerializationConfig config = provider.getConfig();
        JsonFormat.Shape shape = null;
        if (accessor != null && (format = intr.findFormat(accessor)) != null) {
            shape = format.getShape();
            if (shape != this._serializationShape && this._handledType.isEnum()) {
                switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[shape.ordinal()]) {
                    case 1:
                    case 2:
                    case 3:
                        BeanDescription desc = config.introspectClassAnnotations((Class<?>) this._handledType);
                        JsonSerializer<?> ser = EnumSerializer.construct(this._handledType, provider.getConfig(), desc, format);
                        return provider.handlePrimaryContextualization(ser, property);
                }
            }
        }
        ObjectIdWriter oiw = this._objectIdWriter;
        String[] ignorals = null;
        Object newFilterId = null;
        if (accessor != null) {
            ignorals = intr.findPropertiesToIgnore(accessor);
            ObjectIdInfo objectIdInfo = intr.findObjectIdInfo(accessor);
            if (objectIdInfo == null) {
                if (oiw != null) {
                    oiw = this._objectIdWriter.withAlwaysAsId(intr.findObjectReferenceInfo(accessor, new ObjectIdInfo(NAME_FOR_OBJECT_REF, (Class<?>) null, (Class<? extends ObjectIdGenerator<?>>) null, (Class<? extends ObjectIdResolver>) null)).getAlwaysAsId());
                }
            } else {
                ObjectIdInfo objectIdInfo2 = intr.findObjectReferenceInfo(accessor, objectIdInfo);
                Class<?> implClass = objectIdInfo2.getGeneratorType();
                JavaType type = provider.constructType(implClass);
                JavaType idType = provider.getTypeFactory().findTypeParameters(type, ObjectIdGenerator.class)[0];
                if (implClass == ObjectIdGenerators.PropertyGenerator.class) {
                    String propName = objectIdInfo2.getPropertyName().getSimpleName();
                    int len = this._props.length;
                    for (int i = 0; i != len; i++) {
                        BeanPropertyWriter prop = this._props[i];
                        if (propName.equals(prop.getName())) {
                            if (i > 0) {
                                System.arraycopy(this._props, 0, this._props, 1, i);
                                this._props[0] = prop;
                                if (this._filteredProps != null) {
                                    BeanPropertyWriter fp = this._filteredProps[i];
                                    System.arraycopy(this._filteredProps, 0, this._filteredProps, 1, i);
                                    this._filteredProps[0] = fp;
                                }
                            }
                            JavaType idType2 = prop.getType();
                            oiw = ObjectIdWriter.construct(idType2, (PropertyName) null, (ObjectIdGenerator<?>) new PropertyBasedObjectIdGenerator(objectIdInfo2, prop), objectIdInfo2.getAlwaysAsId());
                        }
                    }
                    throw new IllegalArgumentException("Invalid Object Id definition for " + this._handledType.getName() + ": can not find property with name '" + propName + "'");
                }
                ObjectIdGenerator<?> gen = provider.objectIdGeneratorInstance(accessor, objectIdInfo2);
                oiw = ObjectIdWriter.construct(idType, objectIdInfo2.getPropertyName(), gen, objectIdInfo2.getAlwaysAsId());
            }
            Object filterId = intr.findFilterId(accessor);
            if (filterId != null && (this._propertyFilterId == null || !filterId.equals(this._propertyFilterId))) {
                newFilterId = filterId;
            }
        }
        BeanSerializerBase contextual = this;
        if (oiw != null) {
            JsonSerializer<?> ser2 = provider.findValueSerializer(oiw.idType, property);
            ObjectIdWriter oiw2 = oiw.withSerializer(ser2);
            if (oiw2 != this._objectIdWriter) {
                contextual = contextual.withObjectIdWriter(oiw2);
            }
        }
        if (ignorals != null && ignorals.length != 0) {
            contextual = contextual.withIgnorals(ignorals);
        }
        if (newFilterId != null) {
            contextual = contextual.withFilterId(newFilterId);
        }
        if (shape == null) {
            shape = this._serializationShape;
        }
        if (shape == JsonFormat.Shape.ARRAY) {
            return contextual.asArraySerializer();
        }
        return contextual;
    }

    /* renamed from: com.fasterxml.jackson.databind.ser.std.BeanSerializerBase$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ser/std/BeanSerializerBase$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape = new int[JsonFormat.Shape.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.STRING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.NUMBER.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$annotation$JsonFormat$Shape[JsonFormat.Shape.NUMBER_INT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public boolean usesObjectId() {
        return this._objectIdWriter != null;
    }

    @Override // com.fasterxml.jackson.databind.JsonSerializer
    public void serializeWithType(Object bean, JsonGenerator gen, SerializerProvider provider, TypeSerializer typeSer) throws IOException {
        if (this._objectIdWriter != null) {
            _serializeWithObjectId(bean, gen, provider, typeSer);
            return;
        }
        String typeStr = this._typeId == null ? null : _customTypeId(bean);
        if (typeStr == null) {
            typeSer.writeTypePrefixForObject(bean, gen);
        } else {
            typeSer.writeCustomTypePrefixForObject(bean, gen, typeStr);
        }
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, gen, provider);
        } else {
            serializeFields(bean, gen, provider);
        }
        if (typeStr == null) {
            typeSer.writeTypeSuffixForObject(bean, gen);
        } else {
            typeSer.writeCustomTypeSuffixForObject(bean, gen, typeStr);
        }
    }

    protected final void _serializeWithObjectId(Object bean, JsonGenerator jgen, SerializerProvider provider, boolean startEndObject) throws IOException, JsonGenerationException {
        ObjectIdWriter w = this._objectIdWriter;
        WritableObjectId objectId = provider.findObjectId(bean, w.generator);
        if (objectId.writeAsId(jgen, provider, w)) {
            return;
        }
        Object id = objectId.generateId(bean);
        if (w.alwaysAsId) {
            w.serializer.serialize(id, jgen, provider);
            return;
        }
        if (startEndObject) {
            jgen.writeStartObject();
        }
        objectId.writeAsField(jgen, provider, w);
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
        if (startEndObject) {
            jgen.writeEndObject();
        }
    }

    protected final void _serializeWithObjectId(Object bean, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer) throws IOException, JsonGenerationException {
        ObjectIdWriter w = this._objectIdWriter;
        WritableObjectId objectId = provider.findObjectId(bean, w.generator);
        if (objectId.writeAsId(jgen, provider, w)) {
            return;
        }
        Object id = objectId.generateId(bean);
        if (w.alwaysAsId) {
            w.serializer.serialize(id, jgen, provider);
        } else {
            _serializeObjectId(bean, jgen, provider, typeSer, objectId);
        }
    }

    protected void _serializeObjectId(Object bean, JsonGenerator jgen, SerializerProvider provider, TypeSerializer typeSer, WritableObjectId objectId) throws IOException, JsonProcessingException, JsonGenerationException {
        ObjectIdWriter w = this._objectIdWriter;
        String typeStr = this._typeId == null ? null : _customTypeId(bean);
        if (typeStr == null) {
            typeSer.writeTypePrefixForObject(bean, jgen);
        } else {
            typeSer.writeCustomTypePrefixForObject(bean, jgen, typeStr);
        }
        objectId.writeAsField(jgen, provider, w);
        if (this._propertyFilterId != null) {
            serializeFieldsFiltered(bean, jgen, provider);
        } else {
            serializeFields(bean, jgen, provider);
        }
        if (typeStr == null) {
            typeSer.writeTypeSuffixForObject(bean, jgen);
        } else {
            typeSer.writeCustomTypeSuffixForObject(bean, jgen, typeStr);
        }
    }

    protected final String _customTypeId(Object bean) {
        Object typeId = this._typeId.getValue(bean);
        if (typeId == null) {
            return "";
        }
        return typeId instanceof String ? (String) typeId : typeId.toString();
    }

    /* JADX WARN: Type inference failed for: r0v5, types: [com.fasterxml.jackson.databind.JsonMappingException, java.lang.Throwable] */
    protected void serializeFields(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
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
                if (prop != null) {
                    prop.serializeAsField(bean, jgen, provider);
                }
                i++;
            }
            if (this._anyGetterWriter != null) {
                this._anyGetterWriter.getAndSerialize(bean, jgen, provider);
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

    /* JADX WARN: Type inference failed for: r0v8, types: [com.fasterxml.jackson.databind.JsonMappingException, java.lang.Throwable] */
    protected void serializeFieldsFiltered(Object bean, JsonGenerator jgen, SerializerProvider provider) throws IOException, JsonGenerationException {
        BeanPropertyWriter[] props;
        if (this._filteredProps != null && provider.getActiveView() != null) {
            props = this._filteredProps;
        } else {
            props = this._props;
        }
        PropertyFilter filter = findPropertyFilter(provider, this._propertyFilterId, bean);
        if (filter == null) {
            serializeFields(bean, jgen, provider);
            return;
        }
        int i = 0;
        try {
            int len = props.length;
            while (i < len) {
                BeanPropertyWriter prop = props[i];
                if (prop != null) {
                    filter.serializeAsField(bean, jgen, provider, prop);
                }
                i++;
            }
            if (this._anyGetterWriter != null) {
                this._anyGetterWriter.getAndFilter(bean, jgen, provider, filter);
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

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.jsonschema.SchemaAware
    @Deprecated
    public JsonNode getSchema(SerializerProvider provider, Type typeHint) throws JsonMappingException {
        PropertyFilter filter;
        String id;
        ObjectNode o = createSchemaNode("object", true);
        JsonSerializableSchema ann = (JsonSerializableSchema) this._handledType.getAnnotation(JsonSerializableSchema.class);
        if (ann != null && (id = ann.id()) != null && id.length() > 0) {
            o.put("id", id);
        }
        ObjectNode propertiesNode = o.objectNode();
        if (this._propertyFilterId != null) {
            filter = findPropertyFilter(provider, this._propertyFilterId, null);
        } else {
            filter = null;
        }
        for (int i = 0; i < this._props.length; i++) {
            BeanPropertyWriter prop = this._props[i];
            if (filter == null) {
                prop.depositSchemaProperty(propertiesNode, provider);
            } else {
                filter.depositSchemaProperty(prop, propertiesNode, provider);
            }
        }
        o.put("properties", propertiesNode);
        return o;
    }

    @Override // com.fasterxml.jackson.databind.ser.std.StdSerializer, com.fasterxml.jackson.databind.JsonSerializer, com.fasterxml.jackson.databind.jsonFormatVisitors.JsonFormatVisitable
    public void acceptJsonFormatVisitor(JsonFormatVisitorWrapper visitor, JavaType typeHint) throws JsonMappingException {
        JsonObjectFormatVisitor objectVisitor;
        if (visitor == null || (objectVisitor = visitor.expectObjectFormat(typeHint)) == null) {
            return;
        }
        if (this._propertyFilterId != null) {
            PropertyFilter filter = findPropertyFilter(visitor.getProvider(), this._propertyFilterId, null);
            for (int i = 0; i < this._props.length; i++) {
                filter.depositSchemaProperty(this._props[i], objectVisitor, visitor.getProvider());
            }
            return;
        }
        for (int i2 = 0; i2 < this._props.length; i2++) {
            this._props[i2].depositSchemaProperty(objectVisitor);
        }
    }
}
