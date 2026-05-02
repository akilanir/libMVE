package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.BeanDeserializerBase;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;
import java.util.HashSet;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/impl/BeanAsArrayDeserializer.class */
public class BeanAsArrayDeserializer extends BeanDeserializerBase {
    private static final long serialVersionUID = 1;
    protected final BeanDeserializerBase _delegate;
    protected final SettableBeanProperty[] _orderedProperties;

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public /* bridge */ /* synthetic */ BeanDeserializerBase withIgnorableProperties(HashSet x0) {
        return withIgnorableProperties((HashSet<String>) x0);
    }

    public BeanAsArrayDeserializer(BeanDeserializerBase delegate, SettableBeanProperty[] ordered) {
        super(delegate);
        this._delegate = delegate;
        this._orderedProperties = ordered;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase, com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<Object> unwrappingDeserializer(NameTransformer unwrapper) {
        return this._delegate.unwrappingDeserializer(unwrapper);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayDeserializer withObjectIdReader(ObjectIdReader oir) {
        return new BeanAsArrayDeserializer(this._delegate.withObjectIdReader(oir), this._orderedProperties);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayDeserializer withIgnorableProperties(HashSet<String> ignorableProps) {
        return new BeanAsArrayDeserializer(this._delegate.withIgnorableProperties(ignorableProps), this._orderedProperties);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    protected BeanDeserializerBase asArrayDeserializer() {
        return this;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (jp.getCurrentToken() != JsonToken.START_ARRAY) {
            return _deserializeFromNonArray(jp, ctxt);
        }
        if (!this._vanillaProcessing) {
            return _deserializeNonVanilla(jp, ctxt);
        }
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (jp.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                if (prop != null) {
                    try {
                        prop.deserializeAndSet(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, prop.getName(), ctxt);
                    }
                } else {
                    jp.skipChildren();
                }
                i++;
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most " + propCount + " properties (in JSON Array)");
                }
                while (jp.nextToken() != JsonToken.END_ARRAY) {
                    jp.skipChildren();
                }
                return bean;
            }
        }
        return bean;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt, Object bean) throws IOException, JsonProcessingException {
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (jp.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                if (prop != null) {
                    try {
                        prop.deserializeAndSet(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, prop.getName(), ctxt);
                    }
                } else {
                    jp.skipChildren();
                }
                i++;
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most " + propCount + " properties (in JSON Array)");
                }
                while (jp.nextToken() != JsonToken.END_ARRAY) {
                    jp.skipChildren();
                }
                return bean;
            }
        }
        return bean;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public Object deserializeFromObject(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        return _deserializeFromNonArray(jp, ctxt);
    }

    protected Object _deserializeNonVanilla(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (this._nonStandardCreation) {
            return _deserializeWithCreator(jp, ctxt);
        }
        Object bean = this._valueInstantiator.createUsingDefault(ctxt);
        if (this._injectables != null) {
            injectValues(ctxt, bean);
        }
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (jp.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                i++;
                if (prop != null && (activeView == null || prop.visibleInView(activeView))) {
                    try {
                        prop.deserializeAndSet(jp, ctxt, bean);
                    } catch (Exception e) {
                        wrapAndThrow(e, bean, prop.getName(), ctxt);
                    }
                } else {
                    jp.skipChildren();
                }
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most " + propCount + " properties (in JSON Array)");
                }
                while (jp.nextToken() != JsonToken.END_ARRAY) {
                    jp.skipChildren();
                }
                return bean;
            }
        }
        return bean;
    }

    protected Object _deserializeWithCreator(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(jp, ctxt));
        }
        if (this._propertyBasedCreator != null) {
            return _deserializeUsingPropertyBased(jp, ctxt);
        }
        if (this._beanType.isAbstract()) {
            throw JsonMappingException.from(jp, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
        }
        throw JsonMappingException.from(jp, "No suitable constructor found for type " + this._beanType + ": can not instantiate from JSON object (need to add/enable type information?)");
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    protected final Object _deserializeUsingPropertyBased(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        PropertyBasedCreator creator = this._propertyBasedCreator;
        PropertyValueBuffer buffer = creator.startBuilding(jp, ctxt, this._objectIdReader);
        SettableBeanProperty[] props = this._orderedProperties;
        int propCount = props.length;
        int i = 0;
        Object bean = null;
        while (jp.nextToken() != JsonToken.END_ARRAY) {
            SettableBeanProperty prop = i < propCount ? props[i] : null;
            if (prop == null) {
                jp.skipChildren();
            } else if (bean != null) {
                try {
                    prop.deserializeAndSet(jp, ctxt, bean);
                } catch (Exception e) {
                    wrapAndThrow(e, bean, prop.getName(), ctxt);
                }
            } else {
                String propName = prop.getName();
                SettableBeanProperty creatorProp = creator.findCreatorProperty(propName);
                if (creatorProp != null) {
                    Object value = creatorProp.deserialize(jp, ctxt);
                    if (buffer.assignParameter(creatorProp.getCreatorIndex(), value)) {
                        try {
                            bean = creator.build(ctxt, buffer);
                            if (bean.getClass() != this._beanType.getRawClass()) {
                                throw ctxt.mappingException("Can not support implicit polymorphic deserialization for POJOs-as-Arrays style: nominal type " + this._beanType.getRawClass().getName() + ", actual type " + bean.getClass().getName());
                            }
                        } catch (Exception e2) {
                            wrapAndThrow(e2, this._beanType.getRawClass(), propName, ctxt);
                        }
                    } else {
                        continue;
                    }
                } else if (!buffer.readIdProperty(propName)) {
                    buffer.bufferProperty(prop, prop.deserialize(jp, ctxt));
                }
            }
            i++;
        }
        if (bean == null) {
            try {
                bean = creator.build(ctxt, buffer);
            } catch (Exception e3) {
                wrapInstantiationProblem(e3, ctxt);
                return null;
            }
        }
        return bean;
    }

    protected Object _deserializeFromNonArray(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        throw ctxt.mappingException("Can not deserialize a POJO (of type " + this._beanType.getRawClass().getName() + ") from non-Array representation (token: " + jp.getCurrentToken() + "): type/property designed to be serialized as JSON Array");
    }
}
