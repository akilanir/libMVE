package com.fasterxml.jackson.databind.deser;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.deser.impl.ObjectIdReader;
import com.fasterxml.jackson.databind.deser.impl.ReadableObjectId;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import java.io.IOException;
import java.io.Serializable;
import java.util.Map;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/deser/AbstractDeserializer.class */
public class AbstractDeserializer extends JsonDeserializer<Object> implements Serializable {
    private static final long serialVersionUID = -3010349050434697698L;
    protected final JavaType _baseType;
    protected final ObjectIdReader _objectIdReader;
    protected final Map<String, SettableBeanProperty> _backRefProperties;
    protected final boolean _acceptString;
    protected final boolean _acceptBoolean;
    protected final boolean _acceptInt;
    protected final boolean _acceptDouble;

    public AbstractDeserializer(BeanDeserializerBuilder builder, BeanDescription beanDesc, Map<String, SettableBeanProperty> backRefProps) {
        this._baseType = beanDesc.getType();
        this._objectIdReader = builder.getObjectIdReader();
        this._backRefProperties = backRefProps;
        Class<?> cls = this._baseType.getRawClass();
        this._acceptString = cls.isAssignableFrom(String.class);
        this._acceptBoolean = cls == Boolean.TYPE || cls.isAssignableFrom(Boolean.class);
        this._acceptInt = cls == Integer.TYPE || cls.isAssignableFrom(Integer.class);
        this._acceptDouble = cls == Double.TYPE || cls.isAssignableFrom(Double.class);
    }

    protected AbstractDeserializer(BeanDescription beanDesc) {
        this._baseType = beanDesc.getType();
        this._objectIdReader = null;
        this._backRefProperties = null;
        Class<?> cls = this._baseType.getRawClass();
        this._acceptString = cls.isAssignableFrom(String.class);
        this._acceptBoolean = cls == Boolean.TYPE || cls.isAssignableFrom(Boolean.class);
        this._acceptInt = cls == Integer.TYPE || cls.isAssignableFrom(Integer.class);
        this._acceptDouble = cls == Double.TYPE || cls.isAssignableFrom(Double.class);
    }

    public static AbstractDeserializer constructForNonPOJO(BeanDescription beanDesc) {
        return new AbstractDeserializer(beanDesc);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Class<?> handledType() {
        return this._baseType.getRawClass();
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public ObjectIdReader getObjectIdReader() {
        return this._objectIdReader;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public SettableBeanProperty findBackReference(String logicalName) {
        if (this._backRefProperties == null) {
            return null;
        }
        return this._backRefProperties.get(logicalName);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException, JsonProcessingException {
        JsonToken t;
        if (this._objectIdReader != null && (t = jp.getCurrentToken()) != null && t.isScalarValue()) {
            return _deserializeFromObjectId(jp, ctxt);
        }
        Object result = _deserializeIfNatural(jp, ctxt);
        if (result != null) {
            return result;
        }
        return typeDeserializer.deserializeTypedFromObject(jp, ctxt);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        throw ctxt.instantiationException(this._baseType.getRawClass(), "abstract types either need to be mapped to concrete types, have custom deserializer, or be instantiated with additional type information");
    }

    protected Object _deserializeIfNatural(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        JsonToken t = jp.getCurrentToken();
        if (t.isScalarValue()) {
            if (t == JsonToken.VALUE_STRING) {
                if (this._acceptString) {
                    return jp.getText();
                }
                return null;
            }
            if (t == JsonToken.VALUE_NUMBER_INT) {
                if (this._acceptInt) {
                    return Integer.valueOf(jp.getIntValue());
                }
                return null;
            }
            if (t == JsonToken.VALUE_NUMBER_FLOAT) {
                if (this._acceptDouble) {
                    return Double.valueOf(jp.getDoubleValue());
                }
                return null;
            }
            if (t == JsonToken.VALUE_TRUE) {
                if (this._acceptBoolean) {
                    return Boolean.TRUE;
                }
                return null;
            }
            if (t == JsonToken.VALUE_FALSE && this._acceptBoolean) {
                return Boolean.FALSE;
            }
            return null;
        }
        return null;
    }

    protected Object _deserializeFromObjectId(JsonParser jp, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        Object id = this._objectIdReader.readObjectReference(jp, ctxt);
        ReadableObjectId roid = ctxt.findObjectId(id, this._objectIdReader.generator, this._objectIdReader.resolver);
        Object pojo = roid.resolve();
        if (pojo == null) {
            throw new IllegalStateException("Could not resolve Object Id [" + id + "] -- unresolved forward-reference?");
        }
        return pojo;
    }
}
