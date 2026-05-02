package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.deser.impl.BeanAsArrayDeserializer;
import com.fasterxml.jackson.databind.deser.impl.BeanPropertyMap;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.util.NameTransformer;
import com.fasterxml.jackson.databind.util.TokenBuffer;
import java.io.IOException;
import java.io.Serializable;
import java.util.HashSet;
import java.util.Map;

/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializer.class */
public class BeanDeserializer extends BeanDeserializerBase implements Serializable {
    private static final long serialVersionUID = 1;

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public /* bridge */ /* synthetic */ BeanDeserializerBase withIgnorableProperties(HashSet x0) {
        return withIgnorableProperties((HashSet<String>) x0);
    }

    public BeanDeserializer(BeanDeserializerBuilder builder, BeanDescription beanDesc, BeanPropertyMap properties, Map<String, SettableBeanProperty> backRefs, HashSet<String> ignorableProps, boolean ignoreAllUnknown, boolean hasViews) {
        super(builder, beanDesc, properties, backRefs, ignorableProps, ignoreAllUnknown, hasViews);
    }

    protected BeanDeserializer(BeanDeserializerBase src) {
        super(src, src._ignoreAllUnknown);
    }

    protected BeanDeserializer(BeanDeserializerBase src, boolean ignoreAllUnknown) {
        super(src, ignoreAllUnknown);
    }

    protected BeanDeserializer(BeanDeserializerBase src, NameTransformer unwrapper) {
        super(src, unwrapper);
    }

    public BeanDeserializer(BeanDeserializerBase src, ObjectIdReader oir) {
        super(src, oir);
    }

    public BeanDeserializer(BeanDeserializerBase src, HashSet<String> ignorableProps) {
        super(src, ignorableProps);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase, com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<Object> unwrappingDeserializer(NameTransformer unwrapper) {
        if (getClass() != BeanDeserializer.class) {
            return this;
        }
        return new BeanDeserializer(this, unwrapper);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanDeserializer withObjectIdReader(ObjectIdReader oir) {
        return new BeanDeserializer(this, oir);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanDeserializer withIgnorableProperties(HashSet<String> ignorableProps) {
        return new BeanDeserializer(this, ignorableProps);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    protected BeanDeserializerBase asArrayDeserializer() {
        SettableBeanProperty[] props = this._beanProperties.getPropertiesInInsertionOrder();
        return new BeanAsArrayDeserializer(this, props);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (p.isExpectedStartObjectToken()) {
            if (this._vanillaProcessing) {
                return vanillaDeserialize(p, ctxt, p.nextToken());
            }
            p.nextToken();
            if (this._objectIdReader != null) {
                return deserializeWithObjectId(p, ctxt);
            }
            return deserializeFromObject(p, ctxt);
        }
        JsonToken t = p.getCurrentToken();
        return _deserializeOther(p, ctxt, t);
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.BeanDeserializer$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializer$1.class */
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

    protected final Object _deserializeOther(JsonParser p, DeserializationContext ctxt, JsonToken t) throws IOException {
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[t.ordinal()]) {
            case 1:
                return deserializeFromString(p, ctxt);
            case 2:
                return deserializeFromNumber(p, ctxt);
            case 3:
                return deserializeFromDouble(p, ctxt);
            case 4:
                return deserializeFromEmbedded(p, ctxt);
            case 5:
            case 6:
                return deserializeFromBoolean(p, ctxt);
            case 7:
                return deserializeFromArray(p, ctxt);
            case 8:
            case 9:
                if (this._vanillaProcessing) {
                    return vanillaDeserialize(p, ctxt, t);
                }
                if (this._objectIdReader != null) {
                    return deserializeWithObjectId(p, ctxt);
                }
                return deserializeFromObject(p, ctxt);
            default:
                throw ctxt.mappingException(handledType());
        }
    }

    protected Object _missingToken(JsonParser p, DeserializationContext ctxt) throws IOException {
        throw ctxt.endOfInputException(handledType());
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt, Object bean) throws IOException {
        String propName;
        String nextFieldName;
        Class<?> view;
        p.setCurrentValue(bean);
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        if (this._unwrappedPropertyHandler != null) {
            return deserializeWithUnwrapped(p, ctxt, bean);
        }
        if (this._externalTypeIdHandler != null) {
            return deserializeWithExternalTypeId(p, ctxt, bean);
        }
        if (p.isExpectedStartObjectToken()) {
            propName = p.nextFieldName();
            if (propName == null) {
                return bean;
            }
        } else if (p.hasTokenId(5)) {
            propName = p.getCurrentName();
        } else {
            return bean;
        }
        if (this._needViewProcesing && (view = ctxt.getActiveView()) != null) {
            return deserializeWithView(p, ctxt, bean, view);
        }
        do {
            p.nextToken();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            if (prop != null) {
                try {
                    prop.deserializeAndSet(p, ctxt, bean);
                } catch (Exception e) {
                    wrapAndThrow(e, bean, propName, ctxt);
                }
            } else {
                handleUnknownVanilla(p, ctxt, bean, propName);
            }
            nextFieldName = p.nextFieldName();
            propName = nextFieldName;
        } while (nextFieldName != null);
        return bean;
    }

    private final Object vanillaDeserialize(JsonParser p, DeserializationContext ctxt, JsonToken t) throws IOException {
        String nextFieldName;
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        p.setCurrentValue(bean);
        if (p.hasTokenId(5)) {
            String propName = p.getCurrentName();
            do {
                p.nextToken();
                SettableBeanProperty prop = this._beanProperties.find(propName);
                if (prop != null) {
                    try {
                        prop.deserializeAndSet(p, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, propName, ctxt);
                    }
                } else {
                    handleUnknownVanilla(p, ctxt, bean, propName);
                }
                nextFieldName = p.nextFieldName();
                propName = nextFieldName;
            } while (nextFieldName != null);
        }
        return bean;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public Object deserializeFromObject(JsonParser p, DeserializationContext ctxt) throws IOException {
        String nextFieldName;
        Class<?> view;
        Object id;
        if (this._objectIdReader != null && this._objectIdReader.maySerializeAsObject() && p.hasTokenId(5) && this._objectIdReader.isValidReferencePropertyName(p.getCurrentName(), p)) {
            return deserializeFromObjectId(p, ctxt);
        }
        if (this._nonStandardCreation) {
            if (this._unwrappedPropertyHandler != null) {
                return deserializeWithUnwrapped(p, ctxt);
            }
            if (this._externalTypeIdHandler != null) {
                return deserializeWithExternalTypeId(p, ctxt);
            }
            Object bean = deserializeFromObjectUsingNonDefault(p, ctxt);
            if (this._injectables != null) {
                injectValues(ctxt, bean);
            }
            return bean;
        }
        Object bean2 = this._valueInstantiator.createUsingDefault(ctxt);
        p.setCurrentValue(bean2);
        if (p.canReadObjectId() && (id = p.getObjectId()) != null) {
            _handleTypedObjectId(p, ctxt, bean2, id);
        }
        if (this._injectables != null) {
            injectValues(ctxt, bean2);
        }
        if (this._needViewProcesing && (view = ctxt.getActiveView()) != null) {
            return deserializeWithView(p, ctxt, bean2, view);
        }
        if (p.hasTokenId(5)) {
            String propName = p.getCurrentName();
            do {
                p.nextToken();
                SettableBeanProperty prop = this._beanProperties.find(propName);
                if (prop != null) {
                    try {
                        prop.deserializeAndSet(p, ctxt, bean2);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean2, propName, ctxt);
                    }
                } else {
                    handleUnknownVanilla(p, ctxt, bean2, propName);
                }
                nextFieldName = p.nextFieldName();
                propName = nextFieldName;
            } while (nextFieldName != null);
        }
        return bean2;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x001f */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object _deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 418
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer._deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    protected final Object _deserializeWithErrorWrapping(JsonParser p, DeserializationContext ctxt, SettableBeanProperty prop) throws IOException {
        try {
            return prop.deserialize(p, ctxt);
        } catch (Exception e) {
            wrapAndThrow(e, this._beanType.getRawClass(), prop.getName(), ctxt);
            return null;
        }
    }

    protected final Object deserializeWithView(JsonParser p, DeserializationContext ctxt, Object bean, Class<?> activeView) throws IOException {
        String nextFieldName;
        if (p.hasTokenId(5)) {
            String propName = p.getCurrentName();
            do {
                p.nextToken();
                SettableBeanProperty prop = this._beanProperties.find(propName);
                if (prop != null) {
                    if (!prop.visibleInView(activeView)) {
                        p.skipChildren();
                    } else {
                        try {
                            prop.deserializeAndSet(p, ctxt, bean);
                        } catch (Exception e) {
                            wrapAndThrow(e, bean, propName, ctxt);
                        }
                    }
                } else {
                    handleUnknownVanilla(p, ctxt, bean, propName);
                }
                nextFieldName = p.nextFieldName();
                propName = nextFieldName;
            } while (nextFieldName != null);
        }
        return bean;
    }

    protected Object deserializeWithUnwrapped(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
        }
        if (this._propertyBasedCreator != null) {
            return deserializeUsingPropertyBasedWithUnwrapped(p, ctxt);
        }
        TokenBuffer tokens = new TokenBuffer(p);
        tokens.writeStartObject();
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        p.setCurrentValue(bean);
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        String currentName = p.hasTokenId(5) ? p.getCurrentName() : null;
        while (true) {
            String propName = currentName;
            if (propName != null) {
                p.nextToken();
                SettableBeanProperty prop = this._beanProperties.find(propName);
                if (prop != null) {
                    if (activeView != null && !prop.visibleInView(activeView)) {
                        p.skipChildren();
                    } else {
                        try {
                            prop.deserializeAndSet(p, ctxt, bean);
                        } catch (Exception e) {
                            wrapAndThrow(e, bean, propName, ctxt);
                        }
                    }
                } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                    handleIgnoredProperty(p, ctxt, bean, propName);
                } else {
                    tokens.writeFieldName(propName);
                    tokens.copyCurrentStructure(p);
                    if (this._anySetter != null) {
                        try {
                            this._anySetter.deserializeAndSet(p, ctxt, bean, propName);
                        } catch (Exception e2) {
                            wrapAndThrow(e2, bean, propName, ctxt);
                        }
                    }
                }
                currentName = p.nextFieldName();
            } else {
                tokens.writeEndObject();
                this._unwrappedPropertyHandler.processUnwrapped(p, ctxt, bean, tokens);
                return bean;
            }
        }
    }

    protected Object deserializeWithUnwrapped(JsonParser p, DeserializationContext ctxt, Object bean) throws IOException {
        JsonToken t = p.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            t = p.nextToken();
        }
        TokenBuffer tokens = new TokenBuffer(p);
        tokens.writeStartObject();
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        while (t == JsonToken.FIELD_NAME) {
            String propName = p.getCurrentName();
            SettableBeanProperty prop = this._beanProperties.find(propName);
            p.nextToken();
            if (prop != null) {
                if (activeView != null && !prop.visibleInView(activeView)) {
                    p.skipChildren();
                } else {
                    try {
                        prop.deserializeAndSet(p, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, propName, ctxt);
                    }
                }
            } else if (this._ignorableProps != null && this._ignorableProps.contains(propName)) {
                handleIgnoredProperty(p, ctxt, bean, propName);
            } else {
                tokens.writeFieldName(propName);
                tokens.copyCurrentStructure(p);
                if (this._anySetter != null) {
                    this._anySetter.deserializeAndSet(p, ctxt, bean, propName);
                }
            }
            t = p.nextToken();
        }
        tokens.writeEndObject();
        this._unwrappedPropertyHandler.processUnwrapped(p, ctxt, bean, tokens);
        return bean;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x002b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object deserializeUsingPropertyBasedWithUnwrapped(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 386
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeUsingPropertyBasedWithUnwrapped(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    protected Object deserializeWithExternalTypeId(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._propertyBasedCreator != null) {
            return deserializeUsingPropertyBasedWithExternalTypeId(p, ctxt);
        }
        return deserializeWithExternalTypeId(p, ctxt, this._valueInstantiator.createUsingDefault(ctxt));
    }

    /* JADX WARN: Incorrect condition in loop: B:8:0x0025 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object deserializeWithExternalTypeId(com.fasterxml.jackson.core.JsonParser r7, com.fasterxml.jackson.databind.DeserializationContext r8, java.lang.Object r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeWithExternalTypeId(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext, java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0035 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object deserializeUsingPropertyBasedWithExternalTypeId(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 367
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeUsingPropertyBasedWithExternalTypeId(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }
}
