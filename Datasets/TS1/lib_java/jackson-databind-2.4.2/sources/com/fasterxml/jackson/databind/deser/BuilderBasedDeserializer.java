package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.deser.impl.BeanAsArrayBuilderDeserializer;
import com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap;
import com.fasterxml.jackson.databind.deser.impl.ExternalTypeHandler;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.util.NameTransformer;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.IOException;
import java.util.HashSet;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/BuilderBasedDeserializer.class */
public class BuilderBasedDeserializer extends BeanDeserializerBase {
    private static final long serialVersionUID = 1;
    protected final AnnotatedMethod _buildMethod;

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public /* bridge */ /* synthetic */ BeanDeserializerBase withIgnorableProperties(HashSet x0) {
        return withIgnorableProperties((HashSet<String>) x0);
    }

    public BuilderBasedDeserializer(BeanDeserializerBuilder builder, BeanDescription beanDesc, BeanPropertyMap properties, Map<String, SettableBeanProperty> backRefs, HashSet<String> ignorableProps, boolean ignoreAllUnknown, boolean hasViews) {
        super(builder, beanDesc, properties, backRefs, ignorableProps, ignoreAllUnknown, hasViews);
        this._buildMethod = builder.getBuildMethod();
        if (this._objectIdReader != null) {
            throw new IllegalArgumentException("Can not use Object Id with Builder-based deserialization (type " + beanDesc.getType() + ")");
        }
    }

    protected BuilderBasedDeserializer(BuilderBasedDeserializer src) {
        this(src, src._ignoreAllUnknown);
    }

    protected BuilderBasedDeserializer(BuilderBasedDeserializer src, boolean ignoreAllUnknown) {
        super(src, ignoreAllUnknown);
        this._buildMethod = src._buildMethod;
    }

    protected BuilderBasedDeserializer(BuilderBasedDeserializer src, NameTransformer unwrapper) {
        super(src, unwrapper);
        this._buildMethod = src._buildMethod;
    }

    public BuilderBasedDeserializer(BuilderBasedDeserializer src, ObjectIdReader oir) {
        super(src, oir);
        this._buildMethod = src._buildMethod;
    }

    public BuilderBasedDeserializer(BuilderBasedDeserializer src, HashSet<String> ignorableProps) {
        super(src, ignorableProps);
        this._buildMethod = src._buildMethod;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase, com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<Object> unwrappingDeserializer(NameTransformer unwrapper) {
        return new BuilderBasedDeserializer(this, unwrapper);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BuilderBasedDeserializer withObjectIdReader(ObjectIdReader oir) {
        return new BuilderBasedDeserializer(this, oir);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BuilderBasedDeserializer withIgnorableProperties(HashSet<String> ignorableProps) {
        return new BuilderBasedDeserializer(this, ignorableProps);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayBuilderDeserializer asArrayDeserializer() {
        SettableBeanProperty[] props = this._beanProperties.getPropertiesInInsertionOrder();
        return new BeanAsArrayBuilderDeserializer(this, props, this._buildMethod);
    }

    protected final Object finishBuild(DeserializationContext ctxt, Object builder) throws IOException {
        try {
            return this._buildMethod.getMember().invoke(builder, new Object[0]);
        } catch (Exception e) {
            wrapInstantiationProblem(e, ctxt);
            return null;
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public final Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            JsonToken t2 = jp.nextToken();
            if (this._vanillaProcessing) {
                return finishBuild(ctxt, vanillaDeserialize(jp, ctxt, t2));
            }
            Object builder = deserializeFromObject(jp, ctxt);
            return finishBuild(ctxt, builder);
        }
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[t.ordinal()]) {
            case 1:
                return finishBuild(ctxt, deserializeFromString(jp, ctxt));
            case 2:
                return finishBuild(ctxt, deserializeFromNumber(jp, ctxt));
            case 3:
                return finishBuild(ctxt, deserializeFromDouble(jp, ctxt));
            case 4:
                return jp.getEmbeddedObject();
            case 5:
            case 6:
                return finishBuild(ctxt, deserializeFromBoolean(jp, ctxt));
            case 7:
                return finishBuild(ctxt, deserializeFromArray(jp, ctxt));
            case 8:
            case 9:
                return finishBuild(ctxt, deserializeFromObject(jp, ctxt));
            default:
                throw ctxt.mappingException(handledType());
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.BuilderBasedDeserializer$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/BuilderBasedDeserializer$1.class */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$com$fasterxml$jackson$core$JsonToken = new int[JsonToken.values().length];

        static {
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_STRING.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_INT.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_NUMBER_FLOAT.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_EMBEDDED_OBJECT.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_TRUE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_FALSE.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.START_ARRAY.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.FIELD_NAME.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.END_OBJECT.ordinal()] = 9;
            } catch (NoSuchFieldError e9) {
            }
        }
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt, Object builder) throws IOException, JsonProcessingException {
        return finishBuild(ctxt, _deserialize(jp, ctxt, builder));
    }

    protected final Object _deserialize(JsonParser jp, DeserializationContext ctxt, Object builder) throws IOException, JsonProcessingException {
        Class<?> view;
        if (this._injectables != null) {
            injectValues(ctxt, builder);
        }
        if (this._unwrappedPropertyHandler != null) {
            return deserializeWithUnwrapped(jp, ctxt, builder);
        }
        if (this._externalTypeIdHandler != null) {
            return deserializeWithExternalTypeId(jp, ctxt, builder);
        }
        if (this._needViewProcesing && (view = ctxt.getActiveView()) != null) {
            return deserializeWithView(jp, ctxt, builder, view);
        }
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            t = jp.nextToken();
        }
        while (t == JsonToken.FIELD_NAME) {
            String propName = jp.getCurrentName();
            jp.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                try {
                    builder = prop.deserializeSetAndReturn(jp, ctxt, builder);
                } catch (Exception e) {
                    wrapAndThrow(e, builder, propName, ctxt);
                }
            } else {
                handleUnknownVanilla(jp, ctxt, handledType(), propName);
            }
            t = jp.nextToken();
        }
        return builder;
    }

    private final Object vanillaDeserialize(JsonParser jp, DeserializationContext ctxt, JsonToken t) throws IOException, JsonProcessingException {
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        while (jp.getCurrentToken() != JsonToken.END_OBJECT) {
            String propName = jp.getCurrentName();
            jp.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                try {
                    bean = prop.deserializeSetAndReturn(jp, ctxt, bean);
                } catch (Exception e) {
                    wrapAndThrow(e, bean, propName, ctxt);
                }
            } else {
                handleUnknownVanilla(jp, ctxt, bean, propName);
            }
            jp.nextToken();
        }
        return bean;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public Object deserializeFromObject(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        Class<?> view;
        if (this._nonStandardCreation) {
            if (this._unwrappedPropertyHandler != null) {
                return deserializeWithUnwrapped(jp, ctxt);
            }
            if (this._externalTypeIdHandler != null) {
                return deserializeWithExternalTypeId(jp, ctxt);
            }
            return deserializeFromObjectUsingNonDefault(jp, ctxt);
        }
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        if (this._needViewProcesing && (view = ctxt.getActiveView()) != null) {
            return deserializeWithView(jp, ctxt, bean, view);
        }
        while (jp.getCurrentToken() != JsonToken.END_OBJECT) {
            String propName = jp.getCurrentName();
            jp.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                try {
                    bean = prop.deserializeSetAndReturn(jp, ctxt, bean);
                } catch (Exception e) {
                    wrapAndThrow(e, bean, propName, ctxt);
                }
            } else {
                handleUnknownVanilla(jp, ctxt, bean, propName);
            }
            jp.nextToken();
        }
        return bean;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x001f */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final java.lang.Object _deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException, com.fasterxml.jackson.core.JsonProcessingException {
        /*
            Method dump skipped, instructions count: 385
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BuilderBasedDeserializer._deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final java.lang.Object deserializeWithView(com.fasterxml.jackson.core.JsonParser r7, com.fasterxml.jackson.databind.DeserializationContext r8, java.lang.Object r9, java.lang.Class<?> r10) throws java.io.IOException, com.fasterxml.jackson.core.JsonProcessingException {
        /*
            r6 = this;
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0.getCurrentToken()
            r11 = r0
        L6:
            r0 = r11
            com.fasterxml.jackson.core.JsonToken r1 = com.fasterxml.jackson.core.JsonToken.FIELD_NAME
            if (r0 != r1) goto L68
            r0 = r7
            java.lang.String r0 = r0.getCurrentName()
            r12 = r0
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0.nextToken()
            r0 = r6
            com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap r0 = r0._beanProperties
            r1 = r12
            com.fasterxml.jackson.databind.deser.SettableBeanProperty r0 = r0.find(r1)
            r13 = r0
            r0 = r13
            if (r0 == 0) goto L56
            r0 = r13
            r1 = r10
            boolean r0 = r0.visibleInView(r1)
            if (r0 != 0) goto L3b
            r0 = r7
            com.fasterxml.jackson.core.JsonParser r0 = r0.skipChildren()
            goto L5f
        L3b:
            r0 = r13
            r1 = r7
            r2 = r8
            r3 = r9
            java.lang.Object r0 = r0.deserializeSetAndReturn(r1, r2, r3)     // Catch: java.lang.Exception -> L47
            r9 = r0
            goto L5f
        L47:
            r14 = move-exception
            r0 = r6
            r1 = r14
            r2 = r9
            r3 = r12
            r4 = r8
            r0.wrapAndThrow(r1, r2, r3, r4)
            goto L5f
        L56:
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r12
            r0.handleUnknownVanilla(r1, r2, r3, r4)
        L5f:
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0.nextToken()
            r11 = r0
            goto L6
        L68:
            r0 = r9
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BuilderBasedDeserializer.deserializeWithView(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext, java.lang.Object, java.lang.Class):java.lang.Object");
    }

    protected Object deserializeWithUnwrapped(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
        }
        if (this._propertyBasedCreator != null) {
            return deserializeUsingPropertyBasedWithUnwrapped(jp, ctxt);
        }
        TokenBuffer tokens = new TokenBuffer(jp);
        tokens.writeStartObject();
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        while (jp.getCurrentToken() != JsonToken.END_OBJECT) {
            String propName = jp.getCurrentName();
            jp.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                if (activeView != null && !prop.visibleInView(activeView)) {
                    jp.skipChildren();
                } else {
                    try {
                        bean = prop.deserializeSetAndReturn(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, propName, ctxt);
                    }
                }
            } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                handleIgnoredProperty(jp, ctxt, bean, propName);
            } else {
                tokens.writeFieldName(propName);
                tokens.copyCurrentStructure(jp);
                if (this._anySetter != null) {
                    try {
                        this._anySetter.deserializeAndSet(jp, ctxt, bean, propName);
                    } catch (Exception e2) {
                        wrapAndThrow(e2, bean, propName, ctxt);
                    }
                }
            }
            jp.nextToken();
        }
        tokens.writeEndObject();
        this._unwrappedPropertyHandler.processUnwrapped(jp, ctxt, bean, tokens);
        return bean;
    }

    protected Object deserializeWithUnwrapped(JsonParser jp, DeserializationContext ctxt, Object bean) throws IOException, JsonProcessingException {
        JsonToken t = jp.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            t = jp.nextToken();
        }
        TokenBuffer tokens = new TokenBuffer(jp);
        tokens.writeStartObject();
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        while (t == JsonToken.FIELD_NAME) {
            String propName = jp.getCurrentName();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            jp.nextToken();
            if (prop != null) {
                if (activeView != null && !prop.visibleInView(activeView)) {
                    jp.skipChildren();
                } else {
                    try {
                        bean = prop.deserializeSetAndReturn(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, propName, ctxt);
                    }
                }
            } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                handleIgnoredProperty(jp, ctxt, bean, propName);
            } else {
                tokens.writeFieldName(propName);
                tokens.copyCurrentStructure(jp);
                if (this._anySetter != null) {
                    this._anySetter.deserializeAndSet(jp, ctxt, bean, propName);
                }
            }
            t = jp.nextToken();
        }
        tokens.writeEndObject();
        this._unwrappedPropertyHandler.processUnwrapped(jp, ctxt, bean, tokens);
        return bean;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x002b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object deserializeUsingPropertyBasedWithUnwrapped(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException, com.fasterxml.jackson.core.JsonProcessingException {
        /*
            Method dump skipped, instructions count: 368
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BuilderBasedDeserializer.deserializeUsingPropertyBasedWithUnwrapped(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    protected Object deserializeWithExternalTypeId(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (this._propertyBasedCreator != null) {
            return deserializeUsingPropertyBasedWithExternalTypeId(jp, ctxt);
        }
        return deserializeWithExternalTypeId(jp, ctxt, this._valueInstantiator.createUsingDefault(ctxt));
    }

    protected Object deserializeWithExternalTypeId(JsonParser jp, DeserializationContext ctxt, Object bean) throws IOException, JsonProcessingException {
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        ExternalTypeHandler ext = this._externalTypeIdHandler.start();
        while (jp.getCurrentToken() != JsonToken.END_OBJECT) {
            String propName = jp.getCurrentName();
            jp.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                if (activeView != null && !prop.visibleInView(activeView)) {
                    jp.skipChildren();
                } else {
                    try {
                        bean = prop.deserializeSetAndReturn(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, propName, ctxt);
                    }
                }
            } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                handleIgnoredProperty(jp, ctxt, bean, propName);
            } else if (!ext.handlePropertyValue(jp, ctxt, propName, bean)) {
                if (this._anySetter != null) {
                    try {
                        this._anySetter.deserializeAndSet(jp, ctxt, bean, propName);
                    } catch (Exception e2) {
                        wrapAndThrow(e2, bean, propName, ctxt);
                    }
                } else {
                    handleUnknownProperty(jp, ctxt, bean, propName);
                }
            }
            jp.nextToken();
        }
        return ext.complete(jp, ctxt, bean);
    }

    protected Object deserializeUsingPropertyBasedWithExternalTypeId(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        throw new IllegalStateException("Deserialization with Builder, External type id, @JsonCreator not yet implemented");
    }
}
