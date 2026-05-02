package org.apache.commons.beanutils.converters;

import java.lang.reflect.Array;
import java.util.Collection;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.beanutils.Converter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/AbstractConverter.class */
public abstract class AbstractConverter implements Converter {
    private static final String DEFAULT_CONFIG_MSG = "(N.B. Converters can be configured to use default values to avoid throwing exceptions)";
    private static final String PACKAGE = "org.apache.commons.beanutils.converters.";
    private transient Log log;
    private boolean useDefault = false;
    private Object defaultValue = null;
    static Class class$java$lang$String;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Double;
    static Class class$java$lang$Long;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Float;
    static Class class$java$lang$Short;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Character;

    protected abstract Object convertToType(Class cls, Object obj) throws Throwable;

    protected abstract Class getDefaultType();

    public AbstractConverter() {
    }

    public AbstractConverter(Object defaultValue) {
        setDefaultValue(defaultValue);
    }

    public boolean isUseDefault() {
        return this.useDefault;
    }

    @Override // org.apache.commons.beanutils.Converter
    public Object convert(Class type, Object value) {
        Class cls;
        Class sourceType = value == null ? null : value.getClass();
        Class targetType = primitive(type == null ? getDefaultType() : type);
        if (log().isDebugEnabled()) {
            log().debug(new StringBuffer().append("Converting").append(value == null ? "" : new StringBuffer().append(" '").append(toString(sourceType)).append("'").toString()).append(" value '").append(value).append("' to type '").append(toString(targetType)).append("'").toString());
        }
        Object value2 = convertArray(value);
        if (value2 == null) {
            return handleMissing(targetType);
        }
        Class sourceType2 = value2.getClass();
        try {
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            if (targetType.equals(cls)) {
                return convertToString(value2);
            }
            if (targetType.equals(sourceType2)) {
                if (log().isDebugEnabled()) {
                    log().debug(new StringBuffer().append("    No conversion required, value is already a ").append(toString(targetType)).toString());
                }
                return value2;
            }
            Object result = convertToType(targetType, value2);
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Converted to ").append(toString(targetType)).append(" value '").append(result).append("'").toString());
            }
            return result;
        } catch (Throwable t) {
            return handleError(targetType, value2, t);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    protected String convertToString(Object value) throws Throwable {
        return value.toString();
    }

    protected Object convertArray(Object value) {
        if (value == null) {
            return null;
        }
        if (value.getClass().isArray()) {
            if (Array.getLength(value) > 0) {
                return Array.get(value, 0);
            }
            return null;
        }
        if (value instanceof Collection) {
            Collection collection = (Collection) value;
            if (collection.size() > 0) {
                return collection.iterator().next();
            }
            return null;
        }
        return value;
    }

    protected Object handleError(Class type, Object value, Throwable cause) {
        ConversionException cex;
        if (log().isDebugEnabled()) {
            if (cause instanceof ConversionException) {
                log().debug(new StringBuffer().append("    Conversion threw ConversionException: ").append(cause.getMessage()).toString());
            } else {
                log().debug(new StringBuffer().append("    Conversion threw ").append(cause).toString());
            }
        }
        if (this.useDefault) {
            return handleMissing(type);
        }
        if (cause instanceof ConversionException) {
            cex = (ConversionException) cause;
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Re-throwing ConversionException: ").append(cex.getMessage()).toString());
                log().debug("    (N.B. Converters can be configured to use default values to avoid throwing exceptions)");
            }
        } else {
            String msg = new StringBuffer().append("Error converting from '").append(toString(value.getClass())).append("' to '").append(toString(type)).append("' ").append(cause.getMessage()).toString();
            cex = new ConversionException(msg, cause);
            if (log().isDebugEnabled()) {
                log().debug(new StringBuffer().append("    Throwing ConversionException: ").append(msg).toString());
                log().debug("    (N.B. Converters can be configured to use default values to avoid throwing exceptions)");
            }
            BeanUtils.initCause(cex, cause);
        }
        throw cex;
    }

    protected Object handleMissing(Class type) {
        Class cls;
        if (!this.useDefault) {
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            if (!type.equals(cls)) {
                ConversionException cex = new ConversionException(new StringBuffer().append("No value specified for '").append(toString(type)).append("'").toString());
                if (log().isDebugEnabled()) {
                    log().debug(new StringBuffer().append("    Throwing ConversionException: ").append(cex.getMessage()).toString());
                    log().debug("    (N.B. Converters can be configured to use default values to avoid throwing exceptions)");
                }
                throw cex;
            }
        }
        Object value = getDefault(type);
        if (this.useDefault && value != null && !type.equals(value.getClass())) {
            try {
                value = convertToType(type, this.defaultValue);
            } catch (Throwable t) {
                log().error(new StringBuffer().append("    Default conversion to ").append(toString(type)).append("failed: ").append(t).toString());
            }
        }
        if (log().isDebugEnabled()) {
            log().debug(new StringBuffer().append("    Using default ").append(value == null ? "" : new StringBuffer().append(toString(value.getClass())).append(" ").toString()).append("value '").append(this.defaultValue).append("'").toString());
        }
        return value;
    }

    protected void setDefaultValue(Object defaultValue) {
        this.useDefault = false;
        if (log().isDebugEnabled()) {
            log().debug(new StringBuffer().append("Setting default value: ").append(defaultValue).toString());
        }
        if (defaultValue == null) {
            this.defaultValue = null;
        } else {
            this.defaultValue = convert(getDefaultType(), defaultValue);
        }
        this.useDefault = true;
    }

    protected Object getDefault(Class type) {
        Class cls;
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        if (type.equals(cls)) {
            return null;
        }
        return this.defaultValue;
    }

    public String toString() {
        return new StringBuffer().append(toString(getClass())).append("[UseDefault=").append(this.useDefault).append("]").toString();
    }

    Log log() {
        if (this.log == null) {
            this.log = LogFactory.getLog(getClass());
        }
        return this.log;
    }

    Class primitive(Class type) {
        if (type == null || !type.isPrimitive()) {
            return type;
        }
        if (type == Integer.TYPE) {
            if (class$java$lang$Integer != null) {
                return class$java$lang$Integer;
            }
            Class class$ = class$("java.lang.Integer");
            class$java$lang$Integer = class$;
            return class$;
        }
        if (type == Double.TYPE) {
            if (class$java$lang$Double != null) {
                return class$java$lang$Double;
            }
            Class class$2 = class$("java.lang.Double");
            class$java$lang$Double = class$2;
            return class$2;
        }
        if (type == Long.TYPE) {
            if (class$java$lang$Long != null) {
                return class$java$lang$Long;
            }
            Class class$3 = class$("java.lang.Long");
            class$java$lang$Long = class$3;
            return class$3;
        }
        if (type == Boolean.TYPE) {
            if (class$java$lang$Boolean != null) {
                return class$java$lang$Boolean;
            }
            Class class$4 = class$("java.lang.Boolean");
            class$java$lang$Boolean = class$4;
            return class$4;
        }
        if (type == Float.TYPE) {
            if (class$java$lang$Float != null) {
                return class$java$lang$Float;
            }
            Class class$5 = class$("java.lang.Float");
            class$java$lang$Float = class$5;
            return class$5;
        }
        if (type == Short.TYPE) {
            if (class$java$lang$Short != null) {
                return class$java$lang$Short;
            }
            Class class$6 = class$("java.lang.Short");
            class$java$lang$Short = class$6;
            return class$6;
        }
        if (type == Byte.TYPE) {
            if (class$java$lang$Byte != null) {
                return class$java$lang$Byte;
            }
            Class class$7 = class$("java.lang.Byte");
            class$java$lang$Byte = class$7;
            return class$7;
        }
        if (type == Character.TYPE) {
            if (class$java$lang$Character != null) {
                return class$java$lang$Character;
            }
            Class class$8 = class$("java.lang.Character");
            class$java$lang$Character = class$8;
            return class$8;
        }
        return type;
    }

    String toString(Class type) {
        String typeName;
        if (type == null) {
            typeName = "null";
        } else if (type.isArray()) {
            Class elementType = type.getComponentType();
            int count = 1;
            while (elementType.isArray()) {
                elementType = elementType.getComponentType();
                count++;
            }
            typeName = elementType.getName();
            for (int i = 0; i < count; i++) {
                typeName = new StringBuffer().append(typeName).append("[]").toString();
            }
        } else {
            typeName = type.getName();
        }
        if (typeName.startsWith("java.lang.") || typeName.startsWith("java.util.") || typeName.startsWith("java.math.")) {
            typeName = typeName.substring("java.lang.".length());
        } else if (typeName.startsWith(PACKAGE)) {
            typeName = typeName.substring(PACKAGE.length());
        }
        return typeName;
    }
}
