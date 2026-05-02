package com.fasterxml.jackson.databind.jsontype;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonToken;
import com.fasterxml.jackson.databind.BeanProperty;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JavaType;
import java.io.IOException;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/TypeDeserializer.class */
public abstract class TypeDeserializer {
    public abstract TypeDeserializer forProperty(BeanProperty beanProperty);

    public abstract JsonTypeInfo.As getTypeInclusion();

    public abstract String getPropertyName();

    public abstract TypeIdResolver getTypeIdResolver();

    public abstract Class<?> getDefaultImpl();

    public abstract Object deserializeTypedFromObject(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException;

    public abstract Object deserializeTypedFromArray(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException;

    public abstract Object deserializeTypedFromScalar(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException;

    public abstract Object deserializeTypedFromAny(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException;

    public static Object deserializeIfNatural(JsonParser jp, DeserializationContext ctxt, JavaType baseType) throws IOException {
        return deserializeIfNatural(jp, ctxt, baseType.getRawClass());
    }

    public static Object deserializeIfNatural(JsonParser jp, DeserializationContext ctxt, Class<?> base) throws IOException {
        JsonToken t = jp.getCurrentToken();
        if (t == null) {
            return null;
        }
        switch (AnonymousClass1.$SwitchMap$com$fasterxml$jackson$core$JsonToken[t.ordinal()]) {
            case 1:
                if (base.isAssignableFrom(String.class)) {
                    return jp.getText();
                }
                return null;
            case 2:
                if (base.isAssignableFrom(Integer.class)) {
                    return Integer.valueOf(jp.getIntValue());
                }
                return null;
            case 3:
                if (base.isAssignableFrom(Double.class)) {
                    return Double.valueOf(jp.getDoubleValue());
                }
                return null;
            case 4:
                if (base.isAssignableFrom(Boolean.class)) {
                    return Boolean.TRUE;
                }
                return null;
            case 5:
                if (base.isAssignableFrom(Boolean.class)) {
                    return Boolean.FALSE;
                }
                return null;
            default:
                return null;
        }
    }

    /* renamed from: com.fasterxml.jackson.databind.jsontype.TypeDeserializer$1, reason: invalid class name */
    /* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/jsontype/TypeDeserializer$1.class */
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
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_TRUE.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$com$fasterxml$jackson$core$JsonToken[JsonToken.VALUE_FALSE.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
        }
    }
}
