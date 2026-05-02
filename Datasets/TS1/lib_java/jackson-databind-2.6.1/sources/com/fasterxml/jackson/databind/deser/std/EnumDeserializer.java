package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.CompactStringObjectMap;
import com.fasterxml.jackson.databind.util.EnumResolver;
import java.io.IOException;
import java.lang.reflect.Method;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/EnumDeserializer.class */
public class EnumDeserializer extends StdScalarDeserializer<Object> {
    private static final long serialVersionUID = 1;
    protected final CompactStringObjectMap _enumLookup;
    protected Object[] _enumsByIndex;

    public EnumDeserializer(EnumResolver res) {
        super(res.getEnumClass());
        this._enumLookup = res.constructLookup();
        this._enumsByIndex = res.getRawEnums();
    }

    public static JsonDeserializer<?> deserializerForCreator(DeserializationConfig config, Class<?> enumClass, AnnotatedMethod factory) {
        Class<?> paramClass = factory.getRawParameterType(0);
        if (config.canOverrideAccessModifiers()) {
            ClassUtil.checkAndFixAccess(factory.getMember());
        }
        return new FactoryBasedDeserializer(enumClass, factory, paramClass);
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public boolean isCachable() {
        return true;
    }

    @Override // com.fasterxml.jackson.databind.JsonDeserializer
    public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
        JsonToken curr = p.getCurrentToken();
        if (curr == JsonToken.VALUE_STRING || curr == JsonToken.FIELD_NAME) {
            String name = p.getText();
            Object result = this._enumLookup.find(name);
            if (result == null) {
                return _deserializeAltString(p, ctxt, name);
            }
            return result;
        }
        if (curr == JsonToken.VALUE_NUMBER_INT) {
            _checkFailOnNumber(ctxt);
            int index = p.getIntValue();
            if (index >= 0 && index <= this._enumsByIndex.length) {
                return this._enumsByIndex[index];
            }
            if (!ctxt.isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
                throw ctxt.weirdNumberException(Integer.valueOf(index), _enumClass(), "index value outside legal index range [0.." + (this._enumsByIndex.length - 1) + "]");
            }
            return null;
        }
        return _deserializeOther(p, ctxt);
    }

    private final Object _deserializeAltString(JsonParser p, DeserializationContext ctxt, String name) throws IOException {
        String name2 = name.trim();
        if (name2.length() == 0) {
            if (ctxt.isEnabled(DeserializationFeature.ACCEPT_EMPTY_STRING_AS_NULL_OBJECT)) {
                return null;
            }
        } else {
            char c = name2.charAt(0);
            if (c >= '0' && c <= '9') {
                try {
                    int ix = Integer.parseInt(name2);
                    _checkFailOnNumber(ctxt);
                    if (ix >= 0 && ix <= this._enumsByIndex.length) {
                        return this._enumsByIndex[ix];
                    }
                } catch (NumberFormatException e) {
                }
            }
        }
        if (!ctxt.isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
            throw ctxt.weirdStringException(name2, _enumClass(), "value not one of declared Enum instance names: " + this._enumLookup.keys());
        }
        return null;
    }

    protected Object _deserializeOther(JsonParser p, DeserializationContext ctxt) throws IOException {
        p.getCurrentToken();
        if (ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS) && p.isExpectedStartArrayToken()) {
            p.nextToken();
            Object parsed = deserialize(p, ctxt);
            JsonToken curr = p.nextToken();
            if (curr != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(p, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + _enumClass().getName() + "' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(_enumClass());
    }

    protected void _checkFailOnNumber(DeserializationContext ctxt) throws IOException {
        if (ctxt.isEnabled(DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS)) {
            throw ctxt.mappingException("Not allowed to deserialize Enum value out of JSON number (disable DeserializationConfig.DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS to allow)");
        }
    }

    protected Class<?> _enumClass() {
        return handledType();
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/EnumDeserializer$FactoryBasedDeserializer.class */
    protected static class FactoryBasedDeserializer extends StdDeserializer<Object> implements ContextualDeserializer {
        private static final long serialVersionUID = 1;
        protected final Class<?> _inputType;
        protected final Method _factory;
        protected final JsonDeserializer<?> _deser;

        public FactoryBasedDeserializer(Class<?> cls, AnnotatedMethod f, Class<?> inputType) {
            super(cls);
            this._factory = f.getAnnotated();
            this._inputType = inputType;
            this._deser = null;
        }

        protected FactoryBasedDeserializer(FactoryBasedDeserializer base, JsonDeserializer<?> deser) {
            super(base._valueClass);
            this._inputType = base._inputType;
            this._factory = base._factory;
            this._deser = deser;
        }

        @Override // com.fasterxml.jackson.databind.deser.ContextualDeserializer
        public JsonDeserializer<?> createContextual(DeserializationContext ctxt, BeanProperty property) throws JsonMappingException {
            if (this._deser == null && this._inputType != String.class) {
                return new FactoryBasedDeserializer(this, ctxt.findContextualValueDeserializer(ctxt.constructType(this._inputType), property));
            }
            return this;
        }

        @Override // com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
            Object value;
            if (this._deser != null) {
                value = this._deser.deserialize(p, ctxt);
            } else {
                JsonToken curr = p.getCurrentToken();
                if (curr == JsonToken.VALUE_STRING || curr == JsonToken.FIELD_NAME) {
                    value = p.getText();
                } else {
                    value = p.getValueAsString();
                }
            }
            try {
                return this._factory.invoke(this._valueClass, value);
            } catch (Exception e) {
                Throwable t = ClassUtil.getRootCause(e);
                if (t instanceof IOException) {
                    throw ((IOException) t);
                }
                throw ctxt.instantiationException(this._valueClass, t);
            }
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdDeserializer, com.fasterxml.jackson.databind.JsonDeserializer
        public Object deserializeWithType(JsonParser p, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            if (this._deser == null) {
                return deserialize(p, ctxt);
            }
            return typeDeserializer.deserializeTypedFromAny(p, ctxt);
        }
    }
}
