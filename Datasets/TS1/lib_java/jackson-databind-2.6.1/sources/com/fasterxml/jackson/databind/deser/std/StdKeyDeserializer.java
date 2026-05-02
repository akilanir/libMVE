package com.fasterxml.jackson.databind.deser.std;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.io.NumberInput;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.KeyDeserializer;
import com.fasterxml.jackson.databind.annotation.JacksonStdImpl;
import com.fasterxml.jackson.databind.introspect.AnnotatedMethod;
import com.fasterxml.jackson.databind.util.ClassUtil;
import com.fasterxml.jackson.databind.util.EnumResolver;
import java.io.IOException;
import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.net.URI;
import java.net.URL;
import java.util.Calendar;
import java.util.Currency;
import java.util.Date;
import java.util.Locale;
import java.util.UUID;

@JacksonStdImpl
/* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer.class */
public class StdKeyDeserializer extends KeyDeserializer implements Serializable {
    private static final long serialVersionUID = 1;
    public static final int TYPE_BOOLEAN = 1;
    public static final int TYPE_BYTE = 2;
    public static final int TYPE_SHORT = 3;
    public static final int TYPE_CHAR = 4;
    public static final int TYPE_INT = 5;
    public static final int TYPE_LONG = 6;
    public static final int TYPE_FLOAT = 7;
    public static final int TYPE_DOUBLE = 8;
    public static final int TYPE_LOCALE = 9;
    public static final int TYPE_DATE = 10;
    public static final int TYPE_CALENDAR = 11;
    public static final int TYPE_UUID = 12;
    public static final int TYPE_URI = 13;
    public static final int TYPE_URL = 14;
    public static final int TYPE_CLASS = 15;
    public static final int TYPE_CURRENCY = 16;
    protected final int _kind;
    protected final Class<?> _keyClass;
    protected final FromStringDeserializer<?> _deser;

    protected StdKeyDeserializer(int kind, Class<?> cls) {
        this(kind, cls, null);
    }

    protected StdKeyDeserializer(int kind, Class<?> cls, FromStringDeserializer<?> deser) {
        this._kind = kind;
        this._keyClass = cls;
        this._deser = deser;
    }

    public static StdKeyDeserializer forType(Class<?> raw) {
        int kind;
        if (raw == String.class || raw == Object.class) {
            return StringKD.forType(raw);
        }
        if (raw == UUID.class) {
            kind = 12;
        } else if (raw == Integer.class) {
            kind = 5;
        } else if (raw == Long.class) {
            kind = 6;
        } else if (raw == Date.class) {
            kind = 10;
        } else if (raw == Calendar.class) {
            kind = 11;
        } else if (raw == Boolean.class) {
            kind = 1;
        } else if (raw == Byte.class) {
            kind = 2;
        } else if (raw == Character.class) {
            kind = 4;
        } else if (raw == Short.class) {
            kind = 3;
        } else if (raw == Float.class) {
            kind = 7;
        } else if (raw == Double.class) {
            kind = 8;
        } else if (raw == URI.class) {
            kind = 13;
        } else if (raw == URL.class) {
            kind = 14;
        } else if (raw == Class.class) {
            kind = 15;
        } else {
            if (raw == Locale.class) {
                FromStringDeserializer<?> deser = FromStringDeserializer.findDeserializer(Locale.class);
                return new StdKeyDeserializer(9, raw, deser);
            }
            if (raw == Currency.class) {
                FromStringDeserializer<?> deser2 = FromStringDeserializer.findDeserializer(Currency.class);
                return new StdKeyDeserializer(16, raw, deser2);
            }
            return null;
        }
        return new StdKeyDeserializer(kind, raw);
    }

    @Override // com.fasterxml.jackson.databind.KeyDeserializer
    public Object deserializeKey(String key, DeserializationContext ctxt) throws IOException, JsonProcessingException {
        if (key == null) {
            return null;
        }
        try {
            Object result = _parse(key, ctxt);
            if (result != null) {
                return result;
            }
            if (this._keyClass.isEnum() && ctxt.getConfig().isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
                return null;
            }
            throw ctxt.weirdKeyException(this._keyClass, key, "not a valid representation");
        } catch (Exception re) {
            throw ctxt.weirdKeyException(this._keyClass, key, "not a valid representation: " + re.getMessage());
        }
    }

    public Class<?> getKeyClass() {
        return this._keyClass;
    }

    protected Object _parse(String key, DeserializationContext ctxt) throws Exception {
        switch (this._kind) {
            case 1:
                if ("true".equals(key)) {
                    return Boolean.TRUE;
                }
                if ("false".equals(key)) {
                    return Boolean.FALSE;
                }
                throw ctxt.weirdKeyException(this._keyClass, key, "value not 'true' or 'false'");
            case 2:
                int value = _parseInt(key);
                if (value < -128 || value > 255) {
                    throw ctxt.weirdKeyException(this._keyClass, key, "overflow, value can not be represented as 8-bit value");
                }
                return Byte.valueOf((byte) value);
            case 3:
                int value2 = _parseInt(key);
                if (value2 < -32768 || value2 > 32767) {
                    throw ctxt.weirdKeyException(this._keyClass, key, "overflow, value can not be represented as 16-bit value");
                }
                return Short.valueOf((short) value2);
            case 4:
                if (key.length() == 1) {
                    return Character.valueOf(key.charAt(0));
                }
                throw ctxt.weirdKeyException(this._keyClass, key, "can only convert 1-character Strings");
            case 5:
                return Integer.valueOf(_parseInt(key));
            case 6:
                return Long.valueOf(_parseLong(key));
            case 7:
                return Float.valueOf((float) _parseDouble(key));
            case 8:
                return Double.valueOf(_parseDouble(key));
            case 9:
                try {
                    return this._deser._deserialize(key, ctxt);
                } catch (IOException e) {
                    throw ctxt.weirdKeyException(this._keyClass, key, "unable to parse key as locale");
                }
            case 10:
                return ctxt.parseDate(key);
            case 11:
                Date date = ctxt.parseDate(key);
                if (date == null) {
                    return null;
                }
                return ctxt.constructCalendar(date);
            case 12:
                return UUID.fromString(key);
            case TYPE_URI /* 13 */:
                return URI.create(key);
            case TYPE_URL /* 14 */:
                return new URL(key);
            case TYPE_CLASS /* 15 */:
                try {
                    return ctxt.findClass(key);
                } catch (Exception e2) {
                    throw ctxt.weirdKeyException(this._keyClass, key, "unable to parse key as Class");
                }
            case 16:
                try {
                    return this._deser._deserialize(key, ctxt);
                } catch (IOException e3) {
                    throw ctxt.weirdKeyException(this._keyClass, key, "unable to parse key as currency");
                }
            default:
                return null;
        }
    }

    protected int _parseInt(String key) throws IllegalArgumentException {
        return Integer.parseInt(key);
    }

    protected long _parseLong(String key) throws IllegalArgumentException {
        return Long.parseLong(key);
    }

    protected double _parseDouble(String key) throws IllegalArgumentException {
        return NumberInput.parseDouble(key);
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer$StringKD.class */
    static final class StringKD extends StdKeyDeserializer {
        private static final long serialVersionUID = 1;
        private static final StringKD sString = new StringKD(String.class);
        private static final StringKD sObject = new StringKD(Object.class);

        private StringKD(Class<?> nominalType) {
            super(-1, nominalType);
        }

        public static StringKD forType(Class<?> nominalType) {
            if (nominalType == String.class) {
                return sString;
            }
            if (nominalType == Object.class) {
                return sObject;
            }
            return new StringKD(nominalType);
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdKeyDeserializer, com.fasterxml.jackson.databind.KeyDeserializer
        public Object deserializeKey(String key, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            return key;
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer$DelegatingKD.class */
    static final class DelegatingKD extends KeyDeserializer implements Serializable {
        private static final long serialVersionUID = 1;
        protected final Class<?> _keyClass;
        protected final JsonDeserializer<?> _delegate;

        protected DelegatingKD(Class<?> cls, JsonDeserializer<?> deser) {
            this._keyClass = cls;
            this._delegate = deser;
        }

        @Override // com.fasterxml.jackson.databind.KeyDeserializer
        public final Object deserializeKey(String key, DeserializationContext ctxt) throws IOException, JsonProcessingException {
            if (key == null) {
                return null;
            }
            try {
                Object result = this._delegate.deserialize(ctxt.getParser(), ctxt);
                if (result != null) {
                    return result;
                }
                throw ctxt.weirdKeyException(this._keyClass, key, "not a valid representation");
            } catch (Exception re) {
                throw ctxt.weirdKeyException(this._keyClass, key, "not a valid representation: " + re.getMessage());
            }
        }

        public Class<?> getKeyClass() {
            return this._keyClass;
        }
    }

    @JacksonStdImpl
    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer$EnumKD.class */
    static final class EnumKD extends StdKeyDeserializer {
        private static final long serialVersionUID = 1;
        protected final EnumResolver _resolver;
        protected final AnnotatedMethod _factory;

        protected EnumKD(EnumResolver er, AnnotatedMethod factory) {
            super(-1, er.getEnumClass());
            this._resolver = er;
            this._factory = factory;
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdKeyDeserializer
        public Object _parse(String key, DeserializationContext ctxt) throws JsonMappingException {
            if (this._factory != null) {
                try {
                    return this._factory.call1(key);
                } catch (Exception e) {
                    ClassUtil.unwrapAndThrowAsIAE(e);
                }
            }
            Enum<?> e2 = this._resolver.findEnum(key);
            if (e2 == null && !ctxt.getConfig().isEnabled(DeserializationFeature.READ_UNKNOWN_ENUM_VALUES_AS_NULL)) {
                throw ctxt.weirdKeyException(this._keyClass, key, "not one of values for Enum class");
            }
            return e2;
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer$StringCtorKeyDeserializer.class */
    static final class StringCtorKeyDeserializer extends StdKeyDeserializer {
        private static final long serialVersionUID = 1;
        protected final Constructor<?> _ctor;

        public StringCtorKeyDeserializer(Constructor<?> ctor) {
            super(-1, ctor.getDeclaringClass());
            this._ctor = ctor;
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdKeyDeserializer
        public Object _parse(String key, DeserializationContext ctxt) throws Exception {
            return this._ctor.newInstance(key);
        }
    }

    /* loaded from: jackson-databind-2.6.1.jar:com/fasterxml/jackson/databind/deser/std/StdKeyDeserializer$StringFactoryKeyDeserializer.class */
    static final class StringFactoryKeyDeserializer extends StdKeyDeserializer {
        private static final long serialVersionUID = 1;
        final Method _factoryMethod;

        public StringFactoryKeyDeserializer(Method fm) {
            super(-1, fm.getDeclaringClass());
            this._factoryMethod = fm;
        }

        @Override // com.fasterxml.jackson.databind.deser.std.StdKeyDeserializer
        public Object _parse(String key, DeserializationContext ctxt) throws Exception {
            return this._factoryMethod.invoke(null, key);
        }
    }
}
