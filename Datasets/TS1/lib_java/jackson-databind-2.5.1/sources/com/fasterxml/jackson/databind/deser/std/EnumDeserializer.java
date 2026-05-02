package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.deser.ContextualDeserializer;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.jsontype.TypeDeserializer;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.EnumResolver;
import java.io.IOException;
import java.lang.reflect.Method;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/EnumDeserializer.class */
public class EnumDeserializer extends StdScalarDeserializer<Enum<?>> {
    private static final long serialVersionUID = 1;
    protected final EnumResolver<?> _resolver;

    public EnumDeserializer(EnumResolver<?> res) {
        super((Class<?>) Enum.class);
        this._resolver = res;
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
    public Enum<?> deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken curr = jp.getCurrentToken();
        if (curr == JsonToken.VALUE_STRING || curr == JsonToken.FIELD_NAME) {
            String name = jp.getText();
            Enum<?> result = this._resolver.findEnum(name);
            if (result == null) {
                return _deserializeAltString(jp, ctxt, name);
            }
            return result;
        }
        if (curr == JsonToken.VALUE_NUMBER_INT) {
            _checkFailOnNumber(ctxt);
            int index = jp.getIntValue();
            Enum<?> result2 = this._resolver.getEnum(index);
            if (result2 == null && !ctxt.isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
                throw ctxt.weirdNumberException(Integer.valueOf(index), this._resolver.getEnumClass(), "index value outside legal index range [0.." + this._resolver.lastValidIndex() + "]");
            }
            return result2;
        }
        return _deserializeOther(jp, ctxt);
    }

    private final Enum<?> _deserializeAltString(JsonParser jp, DeserializationContext ctxt, String name) throws IOException {
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
                    Enum<?> result = this._resolver.getEnum(ix);
                    if (result != null) {
                        return result;
                    }
                } catch (NumberFormatException e) {
                }
            }
        }
        if (!ctxt.isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
            throw ctxt.weirdStringException(name2, this._resolver.getEnumClass(), "value not one of declared Enum instance names: " + this._resolver.getEnums());
        }
        return null;
    }

    protected Enum<?> _deserializeOther(JsonParser jp, DeserializationContext ctxt) throws IOException {
        JsonToken curr = jp.getCurrentToken();
        if (curr == JsonToken.START_ARRAY && ctxt.isEnabled(DeserializationFeature.UNWRAP_SINGLE_VALUE_ARRAYS)) {
            jp.nextToken();
            Enum<?> parsed = deserialize(jp, ctxt);
            JsonToken curr2 = jp.nextToken();
            if (curr2 != JsonToken.END_ARRAY) {
                throw ctxt.wrongTokenException(jp, JsonToken.END_ARRAY, "Attempted to unwrap single value array for single '" + this._resolver.getEnumClass().getName() + "' value but there was more than a single value in the array");
            }
            return parsed;
        }
        throw ctxt.mappingException(this._resolver.getEnumClass());
    }

    protected void _checkFailOnNumber(DeserializationContext ctxt) throws IOException {
        if (ctxt.isEnabled(DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS)) {
            throw ctxt.mappingException("Not allowed to deserialize Enum value out of JSON number (disable DeserializationConfig.DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS to allow)");
        }
    }

    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/deser/std/EnumDeserializer$FactoryBasedDeserializer.class */
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
        public Object deserialize(JsonParser jp, DeserializationContext ctxt) throws IOException {
            Object value;
            if (this._deser != null) {
                value = this._deser.deserialize(jp, ctxt);
            } else {
                value = jp.getValueAsString();
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
        public Object deserializeWithType(JsonParser jp, DeserializationContext ctxt, TypeDeserializer typeDeserializer) throws IOException {
            if (this._deser == null) {
                return deserialize(jp, ctxt);
            }
            return typeDeserializer.deserializeTypedFromAny(jp, ctxt);
        }
    }
}
