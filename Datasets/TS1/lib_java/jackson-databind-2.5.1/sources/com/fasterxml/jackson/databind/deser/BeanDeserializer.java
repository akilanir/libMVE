package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
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

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializer.class */
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
        JsonToken t = p.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            if (this._vanillaProcessing) {
                return vanillaDeserialize(p, ctxt, p.nextToken());
            }
            p.nextToken();
            if (this._objectIdReader != null) {
                return deserializeWithObjectId(p, ctxt);
            }
            return deserializeFromObject(p, ctxt);
        }
        return _deserializeOther(p, ctxt, t);
    }

    /* renamed from: com.fasterxml.jackson.databind.deser.BeanDeserializer$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/BeanDeserializer$1.class */
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

    protected Object _missingToken(JsonParser p, DeserializationContext ctxt) throws JsonProcessingException {
        throw ctxt.endOfInputException(handledType());
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt, Object bean) throws IOException {
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
        JsonToken t = p.getCurrentToken();
        if (t == JsonToken.START_OBJECT) {
            t = p.nextToken();
        }
        if (this._needViewProcesing && (view = ctxt.getActiveView()) != null) {
            return deserializeWithView(p, ctxt, bean, view);
        }
        while (t == JsonToken.FIELD_NAME) {
            String propName = p.getCurrentName();
            p.nextToken();
            if (!this._beanProperties.findDeserializeAndSet(p, ctxt, bean, propName)) {
                handleUnknownVanilla(p, ctxt, bean, propName);
            }
            t = p.nextToken();
        }
        return bean;
    }

    private final Object vanillaDeserialize(JsonParser p, DeserializationContext ctxt, JsonToken t) throws IOException {
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        p.setCurrentValue(bean);
        while (t == JsonToken.FIELD_NAME) {
            String propName = p.getCurrentName();
            p.nextToken();
            if (!this._beanProperties.findDeserializeAndSet(p, ctxt, bean, propName)) {
                handleUnknownVanilla(p, ctxt, bean, propName);
            }
            t = p.nextToken();
        }
        return bean;
    }

    /* JADX WARN: Incorrect condition in loop: B:43:0x00c6 */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.Object deserializeFromObject(com.fasterxml.jackson.core.JsonParser r7, com.fasterxml.jackson.databind.DeserializationContext r8) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 247
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeFromObject(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x001f */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object _deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser r8, com.fasterxml.jackson.databind.DeserializationContext r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 411
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer._deserializeUsingPropertyBased(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x000b */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected final java.lang.Object deserializeWithView(com.fasterxml.jackson.core.JsonParser r7, com.fasterxml.jackson.databind.DeserializationContext r8, java.lang.Object r9, java.lang.Class<?> r10) throws java.io.IOException {
        /*
            r6 = this;
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0.getCurrentToken()
            r11 = r0
        L6:
            r0 = r11
            com.fasterxml.jackson.core.JsonToken r1 = com.fasterxml.jackson.core.JsonToken.FIELD_NAME
            if (r0 != r1) goto L67
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
            if (r0 == 0) goto L55
            r0 = r13
            r1 = r10
            boolean r0 = r0.visibleInView(r1)
            if (r0 != 0) goto L3b
            r0 = r7
            com.fasterxml.jackson.core.JsonParser r0 = r0.skipChildren()
            goto L5e
        L3b:
            r0 = r13
            r1 = r7
            r2 = r8
            r3 = r9
            r0.deserializeAndSet(r1, r2, r3)     // Catch: java.lang.Exception -> L46
            goto L5e
        L46:
            r14 = move-exception
            r0 = r6
            r1 = r14
            r2 = r9
            r3 = r12
            r4 = r8
            r0.wrapAndThrow(r1, r2, r3, r4)
            goto L5e
        L55:
            r0 = r6
            r1 = r7
            r2 = r8
            r3 = r9
            r4 = r12
            r0.handleUnknownVanilla(r1, r2, r3, r4)
        L5e:
            r0 = r7
            com.fasterxml.jackson.core.JsonToken r0 = r0.nextToken()
            r11 = r0
            goto L6
        L67:
            r0 = r9
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeWithView(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext, java.lang.Object, java.lang.Class):java.lang.Object");
    }

    /* JADX WARN: Incorrect condition in loop: B:19:0x006e */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected java.lang.Object deserializeWithUnwrapped(com.fasterxml.jackson.core.JsonParser r7, com.fasterxml.jackson.databind.DeserializationContext r8) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeWithUnwrapped(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
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
            Method dump skipped, instructions count: 379
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
            Method dump skipped, instructions count: 376
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.fasterxml.jackson.databind.deser.BeanDeserializer.deserializeUsingPropertyBasedWithExternalTypeId(com.fasterxml.jackson.core.JsonParser, com.fasterxml.jackson.databind.DeserializationContext):java.lang.Object");
    }
}
