package org.apache.commons.validator.util;

import java.lang.reflect.InvocationTargetException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.collections.FastHashMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.commons.validator.Arg;
import org.apache.commons.validator.Msg;
import org.apache.commons.validator.Var;

/* loaded from: commons-validator-1.4.0.jar:org/apache/commons/validator/util/ValidatorUtils.class */
public class ValidatorUtils {
    static Class class$org$apache$commons$validator$util$ValidatorUtils;

    public static String replace(String value, String key, String replaceValue) {
        String value2;
        if (value == null || key == null || replaceValue == null) {
            return value;
        }
        int pos = value.indexOf(key);
        if (pos < 0) {
            return value;
        }
        int length = value.length();
        int end = pos + key.length();
        if (length == key.length()) {
            value2 = replaceValue;
        } else {
            value2 = end == length ? new StringBuffer().append(value.substring(0, pos)).append(replaceValue).toString() : new StringBuffer().append(value.substring(0, pos)).append(replaceValue).append(replace(value.substring(end), key, replaceValue)).toString();
        }
        return value2;
    }

    public static String getValueAsString(Object bean, String property) {
        Class cls;
        Class cls2;
        Class cls3;
        Object value = null;
        try {
            value = PropertyUtils.getProperty(bean, property);
        } catch (IllegalAccessException e) {
            if (class$org$apache$commons$validator$util$ValidatorUtils == null) {
                cls3 = class$("org.apache.commons.validator.util.ValidatorUtils");
                class$org$apache$commons$validator$util$ValidatorUtils = cls3;
            } else {
                cls3 = class$org$apache$commons$validator$util$ValidatorUtils;
            }
            Log log = LogFactory.getLog(cls3);
            log.error(e.getMessage(), e);
        } catch (NoSuchMethodException e2) {
            if (class$org$apache$commons$validator$util$ValidatorUtils == null) {
                cls2 = class$("org.apache.commons.validator.util.ValidatorUtils");
                class$org$apache$commons$validator$util$ValidatorUtils = cls2;
            } else {
                cls2 = class$org$apache$commons$validator$util$ValidatorUtils;
            }
            Log log2 = LogFactory.getLog(cls2);
            log2.error(e2.getMessage(), e2);
        } catch (InvocationTargetException e3) {
            if (class$org$apache$commons$validator$util$ValidatorUtils == null) {
                cls = class$("org.apache.commons.validator.util.ValidatorUtils");
                class$org$apache$commons$validator$util$ValidatorUtils = cls;
            } else {
                cls = class$org$apache$commons$validator$util$ValidatorUtils;
            }
            Log log3 = LogFactory.getLog(cls);
            log3.error(e3.getMessage(), e3);
        }
        if (value == null) {
            return null;
        }
        if (value instanceof String[]) {
            return ((String[]) value).length > 0 ? value.toString() : "";
        }
        if (value instanceof Collection) {
            return ((Collection) value).isEmpty() ? "" : value.toString();
        }
        return value.toString();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError().initCause(x1);
        }
    }

    public static FastHashMap copyFastHashMap(FastHashMap map) {
        FastHashMap results = new FastHashMap();
        for (Map.Entry entry : map.entrySet()) {
            String key = (String) entry.getKey();
            Object value = entry.getValue();
            if (value instanceof Msg) {
                results.put(key, ((Msg) value).clone());
            } else if (value instanceof Arg) {
                results.put(key, ((Arg) value).clone());
            } else if (value instanceof Var) {
                results.put(key, ((Var) value).clone());
            } else {
                results.put(key, value);
            }
        }
        results.setFast(true);
        return results;
    }

    public static Map copyMap(Map map) {
        Map results = new HashMap();
        for (Map.Entry entry : map.entrySet()) {
            String key = (String) entry.getKey();
            Object value = entry.getValue();
            if (value instanceof Msg) {
                results.put(key, ((Msg) value).clone());
            } else if (value instanceof Arg) {
                results.put(key, ((Arg) value).clone());
            } else if (value instanceof Var) {
                results.put(key, ((Var) value).clone());
            } else {
                results.put(key, value);
            }
        }
        return results;
    }
}
