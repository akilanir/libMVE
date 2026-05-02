package com.fasterxml.jackson.databind.deser.impl;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.BeanDeserializerBase;
import com.fasterxml.jackson.databind.deser.SettableBeanProperty;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.util.NameTransformer;
import java.io.IOException;
import java.util.HashSet;

/* loaded from: jackson-databind-2.6.3.jar:com/fasterxml/jackson/databind/deser/impl/BeanAsArrayBuilderDeserializer.class */
public class BeanAsArrayBuilderDeserializer extends BeanDeserializerBase {
    private static final long serialVersionUID = 1;
    protected final BeanDeserializerBase _delegate;
    protected final SettableBeanProperty[] _orderedProperties;
    protected final AnnotatedMethod _buildMethod;

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public /* bridge */ /* synthetic */ BeanDeserializerBase withIgnorableProperties(HashSet x0) {
        return withIgnorableProperties((HashSet<String>) x0);
    }

    public BeanAsArrayBuilderDeserializer(BeanDeserializerBase delegate, SettableBeanProperty[] ordered, AnnotatedMethod buildMethod) {
        super(delegate);
        this._delegate = delegate;
        this._orderedProperties = ordered;
        this._buildMethod = buildMethod;
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase, com.fasterxml.jackson.databind.JsonDeserializer
    public JsonDeserializer<Object> unwrappingDeserializer(NameTransformer unwrapper) {
        return this._delegate.unwrappingDeserializer(unwrapper);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayBuilderDeserializer withObjectIdReader(ObjectIdReader oir) {
        return new BeanAsArrayBuilderDeserializer(this._delegate.withObjectIdReader(oir), this._orderedProperties, this._buildMethod);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayBuilderDeserializer withIgnorableProperties(HashSet<String> ignorableProps) {
        return new BeanAsArrayBuilderDeserializer(this._delegate.withIgnorableProperties(ignorableProps), this._orderedProperties, this._buildMethod);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public BeanAsArrayBuilderDeserializer asArrayDeserializer() {
        return this;
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
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (!p.isExpectedStartArrayToken()) {
            return finishBuild(ctxt, _deserializeFromNonArray(p, ctxt));
        }
        if (!this._vanillaProcessing) {
            return finishBuild(ctxt, _deserializeNonVanilla(p, ctxt));
        }
        Object builder = this._valueInstantiator.createUsingDefault(ctxt);
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (p.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                if (prop != null) {
                    try {
                        builder = prop.deserializeSetAndReturn(p, ctxt, builder);
                    } catch (Exception e) {
                        wrapAndThrow(e, builder, prop.getName(), ctxt);
                    }
                } else {
                    p.skipChildren();
                }
                i++;
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most %d properties (in JSON Array)", Integer.valueOf(propCount));
                }
                while (p.nextToken() != JsonToken.END_ARRAY) {
                    p.skipChildren();
                }
                return finishBuild(ctxt, builder);
            }
        }
        return finishBuild(ctxt, builder);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt, Object builder) throws IOException {
        if (this._injectables != null) {
            injectValues(ctxt, builder);
        }
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (p.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                if (prop != null) {
                    try {
                        builder = prop.deserializeSetAndReturn(p, ctxt, builder);
                    } catch (Exception e) {
                        wrapAndThrow(e, builder, prop.getName(), ctxt);
                    }
                } else {
                    p.skipChildren();
                }
                i++;
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most %d properties (in JSON Array)", Integer.valueOf(propCount));
                }
                while (p.nextToken() != JsonToken.END_ARRAY) {
                    p.skipChildren();
                }
                return finishBuild(ctxt, builder);
            }
        }
        return finishBuild(ctxt, builder);
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    public Object deserializeFromObject(JsonParser p, DeserializationContext ctxt) throws IOException {
        return _deserializeFromNonArray(p, ctxt);
    }

    protected Object _deserializeNonVanilla(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._nonStandardCreation) {
            return _deserializeWithCreator(p, ctxt);
        }
        Object builder = this._valueInstantiator.createUsingDefault(ctxt);
        if (this._injectables != null) {
            injectValues(ctxt, builder);
        }
        Class<?> activeView = this._needViewProcesing ? ctxt.getActiveView() : null;
        SettableBeanProperty[] props = this._orderedProperties;
        int i = 0;
        int propCount = props.length;
        while (p.nextToken() != JsonToken.END_ARRAY) {
            if (i != propCount) {
                SettableBeanProperty prop = props[i];
                i++;
                if (prop != null && (activeView == null || prop.visibleInView(activeView))) {
                    try {
                        prop.deserializeSetAndReturn(p, ctxt, builder);
                    } catch (Exception e) {
                        wrapAndThrow(e, builder, prop.getName(), ctxt);
                    }
                } else {
                    p.skipChildren();
                }
            } else {
                if (!this._ignoreAllUnknown) {
                    throw ctxt.mappingException("Unexpected JSON values; expected at most %d properties (in JSON Array)", Integer.valueOf(propCount));
                }
                while (p.nextToken() != JsonToken.END_ARRAY) {
                    p.skipChildren();
                }
                return builder;
            }
        }
        return builder;
    }

    protected Object _deserializeWithCreator(JsonParser p, DeserializationContext ctxt) throws IOException {
        if (this._delegateDeserializer != null) {
            return this._valueInstantiator.createUsingDelegate(ctxt, this._delegateDeserializer.deserialize(p, ctxt));
        }
        if (this._propertyBasedCreator != null) {
            return _deserializeUsingPropertyBased(p, ctxt);
        }
        if (this._beanType.isAbstract()) {
            throw JsonMappingException.from(p, "Can not instantiate abstract type " + this._beanType + " (need to add/enable type information?)");
        }
        throw JsonMappingException.from(p, "No suitable constructor found for type " + this._beanType + ": can not instantiate from JSON object (need to add/enable type information?)");
    }

    @Override // com.fasterxml.jackson.databind.deser.BeanDeserializerBase
    protected final Object _deserializeUsingPropertyBased(JsonParser p, DeserializationContext ctxt) throws IOException {
        PropertyBasedCreator creator = this._propertyBasedCreator;
        PropertyValueBuffer buffer = creator.startBuilding(p, ctxt, this._objectIdReader);
        SettableBeanProperty[] props = this._orderedProperties;
        int propCount = props.length;
        int i = 0;
        Object builder = null;
        while (p.nextToken() != JsonToken.END_ARRAY) {
            SettableBeanProperty prop = i < propCount ? props[i] : null;
            if (prop == null) {
                p.skipChildren();
            } else if (builder != null) {
                try {
                    builder = prop.deserializeSetAndReturn(p, ctxt, builder);
                } catch (Exception e) {
                    wrapAndThrow(e, builder, prop.getName(), ctxt);
                }
            } else {
                String propName = prop.getName();
                SettableBeanProperty creatorProp = creator.findCreatorProperty(propName);
                if (creatorProp != null) {
                    if (buffer.assignParameter(creatorProp, creatorProp.deserialize(p, ctxt))) {
                        try {
                            builder = creator.build(ctxt, buffer);
                            if (builder.getClass() != this._beanType.getRawClass()) {
                                throw ctxt.mappingException("Can not support implicit polymorphic deserialization for POJOs-as-Arrays style: nominal type %s, actual type %s", this._beanType.getRawClass().getName(), builder.getClass().getName());
                            }
                        } catch (Exception e2) {
                            wrapAndThrow(e2, this._beanType.getRawClass(), propName, ctxt);
                        }
                    } else {
                        continue;
                    }
                } else if (!buffer.readIdProperty(propName)) {
                    buffer.bufferProperty(prop, prop.deserialize(p, ctxt));
                }
            }
            i++;
        }
        if (builder == null) {
            try {
                builder = creator.build(ctxt, buffer);
            } catch (Exception e3) {
                wrapInstantiationProblem(e3, ctxt);
                return null;
            }
        }
        return builder;
    }

    protected Object _deserializeFromNonArray(JsonParser p, DeserializationContext ctxt) throws IOException {
        throw ctxt.mappingException("Can not deserialize a POJO (of type %s) from non-Array representation (token: %s): type/property designed to be serialized as JSON Array", this._beanType.getRawClass().getName(), p.getCurrentToken());
    }
}
