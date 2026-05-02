package ch.qos.logback.core.joran.util;

import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.spi.ContextAware;
import java.lang.reflect.Modifier;
import java.nio.charset.Charset;
import java.nio.charset.UnsupportedCharsetException;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/joran/util/StringToObjectConverter.class */
public class StringToObjectConverter {
    private static final Class<?>[] STING_CLASS_PARAMETER = {String.class};

    public static boolean canBeBuiltFromSimpleString(Class<?> cls) {
        Package r0 = cls.getPackage();
        if (cls.isPrimitive()) {
            return true;
        }
        return (r0 != null && "java.lang".equals(r0.getName())) || followsTheValueOfConvention(cls) || cls.isEnum() || isOfTypeCharset(cls);
    }

    public static Object convertArg(ContextAware contextAware, String str, Class<?> cls) {
        if (str == null) {
            return null;
        }
        String trim = str.trim();
        if (String.class.isAssignableFrom(cls)) {
            return trim;
        }
        if (Integer.TYPE.isAssignableFrom(cls)) {
            return new Integer(trim);
        }
        if (Long.TYPE.isAssignableFrom(cls)) {
            return new Long(trim);
        }
        if (Float.TYPE.isAssignableFrom(cls)) {
            return new Float(trim);
        }
        if (Double.TYPE.isAssignableFrom(cls)) {
            return new Double(trim);
        }
        if (Boolean.TYPE.isAssignableFrom(cls)) {
            if ("true".equalsIgnoreCase(trim)) {
                return Boolean.TRUE;
            }
            if ("false".equalsIgnoreCase(trim)) {
                return Boolean.FALSE;
            }
            return null;
        }
        if (cls.isEnum()) {
            return convertToEnum(contextAware, trim, cls);
        }
        if (followsTheValueOfConvention(cls)) {
            return convertByValueOfMethod(contextAware, cls, trim);
        }
        if (isOfTypeCharset(cls)) {
            return convertToCharset(contextAware, str);
        }
        return null;
    }

    private static boolean isOfTypeCharset(Class<?> cls) {
        return Charset.class.isAssignableFrom(cls);
    }

    private static Charset convertToCharset(ContextAware contextAware, String str) {
        try {
            return Charset.forName(str);
        } catch (UnsupportedCharsetException e) {
            contextAware.addError("Failed to get charset [" + str + "]", e);
            return null;
        }
    }

    private static boolean followsTheValueOfConvention(Class<?> cls) {
        try {
            return Modifier.isStatic(cls.getMethod(CoreConstants.VALUE_OF, STING_CLASS_PARAMETER).getModifiers());
        } catch (NoSuchMethodException e) {
            return false;
        } catch (SecurityException e2) {
            return false;
        }
    }

    private static Object convertByValueOfMethod(ContextAware contextAware, Class<?> cls, String str) {
        try {
            return cls.getMethod(CoreConstants.VALUE_OF, STING_CLASS_PARAMETER).invoke(null, str);
        } catch (Exception e) {
            contextAware.addError("Failed to invoke valueOf{} method in class [" + cls.getName() + "] with value [" + str + "]");
            return null;
        }
    }

    private static Object convertToEnum(ContextAware contextAware, String str, Class<? extends Enum> cls) {
        return Enum.valueOf(cls, str);
    }

    boolean isBuildableFromSimpleString() {
        return false;
    }
}
