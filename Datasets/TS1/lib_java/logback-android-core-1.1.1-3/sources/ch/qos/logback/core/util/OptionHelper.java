package ch.qos.logback.core.util;

import ch.qos.logback.core.Context;
import ch.qos.logback.core.CoreConstants;
import ch.qos.logback.core.android.SystemPropertiesProxy;
import ch.qos.logback.core.spi.ContextAware;
import ch.qos.logback.core.spi.PropertyContainer;
import ch.qos.logback.core.spi.ScanException;
import ch.qos.logback.core.subst.NodeToStringTransformer;
import java.util.Properties;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/util/OptionHelper.class */
public class OptionHelper {
    static final String DELIM_START = "${";
    static final char DELIM_STOP = '}';
    static final String DELIM_DEFAULT = ":-";
    static final int DELIM_START_LEN = 2;
    static final int DELIM_STOP_LEN = 1;
    static final int DELIM_DEFAULT_LEN = 2;
    static final String _IS_UNDEFINED = "_IS_UNDEFINED";

    public static Object instantiateByClassName(String str, Class<?> cls, Context context) throws IncompatibleClassException, DynamicClassLoadingException {
        return instantiateByClassName(str, cls, Loader.getClassLoaderOfObject(context));
    }

    public static Object instantiateByClassNameAndParameter(String str, Class<?> cls, Context context, Class<?> cls2, Object obj) throws IncompatibleClassException, DynamicClassLoadingException {
        return instantiateByClassNameAndParameter(str, cls, Loader.getClassLoaderOfObject(context), cls2, obj);
    }

    public static Object instantiateByClassName(String str, Class<?> cls, ClassLoader classLoader) throws IncompatibleClassException, DynamicClassLoadingException {
        return instantiateByClassNameAndParameter(str, cls, classLoader, (Class<?>) null, (Object) null);
    }

    public static Object instantiateByClassNameAndParameter(String str, Class<?> cls, ClassLoader classLoader, Class<?> cls2, Object obj) throws IncompatibleClassException, DynamicClassLoadingException {
        if (str == null) {
            throw new NullPointerException();
        }
        try {
            Class<?> loadClass = classLoader.loadClass(str);
            if (cls.isAssignableFrom(loadClass)) {
                return cls2 == null ? loadClass.newInstance() : loadClass.getConstructor(cls2).newInstance(obj);
            }
            throw new IncompatibleClassException(cls, loadClass);
        } catch (IncompatibleClassException e) {
            throw e;
        } catch (Throwable th) {
            throw new DynamicClassLoadingException("Failed to instantiate type " + str, th);
        }
    }

    public static String substVars(String str, PropertyContainer propertyContainer) {
        return substVars(str, propertyContainer, null);
    }

    public static String substVars(String str, PropertyContainer propertyContainer, PropertyContainer propertyContainer2) {
        try {
            return NodeToStringTransformer.substituteVariable(str, propertyContainer, propertyContainer2);
        } catch (ScanException e) {
            throw new IllegalArgumentException("Failed to parse input [" + str + "]", e);
        }
    }

    public static String propertyLookup(String str, PropertyContainer propertyContainer, PropertyContainer propertyContainer2) {
        String property = propertyContainer.getProperty(str);
        if (property == null && propertyContainer2 != null) {
            property = propertyContainer2.getProperty(str);
        }
        if (property == null) {
            property = getSystemProperty(str, null);
        }
        if (property == null) {
            property = getEnv(str);
        }
        return property;
    }

    public static String getSystemProperty(String str, String str2) {
        try {
            return System.getProperty(str, str2);
        } catch (SecurityException e) {
            return str2;
        }
    }

    public static String getEnv(String str) {
        try {
            return System.getenv(str);
        } catch (SecurityException e) {
            return null;
        }
    }

    public static String getAndroidSystemProperty(String str) {
        try {
            return SystemPropertiesProxy.getInstance().get(str, null);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }

    public static String getSystemProperty(String str) {
        try {
            String property = System.getProperty(str);
            return property == null ? getAndroidSystemProperty(str) : property;
        } catch (SecurityException e) {
            return null;
        }
    }

    public static void setSystemProperties(ContextAware contextAware, Properties properties) {
        for (String str : properties.keySet()) {
            setSystemProperty(contextAware, str, properties.getProperty(str));
        }
    }

    public static void setSystemProperty(ContextAware contextAware, String str, String str2) {
        try {
            System.setProperty(str, str2);
        } catch (SecurityException e) {
            contextAware.addError("Failed to set system property [" + str + "]", e);
        }
    }

    public static Properties getSystemProperties() {
        try {
            return System.getProperties();
        } catch (SecurityException e) {
            return new Properties();
        }
    }

    public static String[] extractDefaultReplacement(String str) {
        String[] strArr = new String[2];
        if (str == null) {
            return strArr;
        }
        strArr[0] = str;
        int indexOf = str.indexOf(":-");
        if (indexOf != -1) {
            strArr[0] = str.substring(0, indexOf);
            strArr[1] = str.substring(indexOf + 2);
        }
        return strArr;
    }

    public static boolean toBoolean(String str, boolean z) {
        if (str == null) {
            return z;
        }
        String trim = str.trim();
        if ("true".equalsIgnoreCase(trim)) {
            return true;
        }
        if ("false".equalsIgnoreCase(trim)) {
            return false;
        }
        return z;
    }

    public static boolean isEmpty(String str) {
        return str == null || CoreConstants.EMPTY_STRING.equals(str);
    }
}
