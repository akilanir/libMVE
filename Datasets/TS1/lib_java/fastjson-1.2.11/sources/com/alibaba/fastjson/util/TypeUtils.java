package com.alibaba.fastjson.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.annotation.JSONType;
import com.alibaba.fastjson.parser.Feature;
import com.alibaba.fastjson.parser.JSONScanner;
import com.alibaba.fastjson.parser.ParserConfig;
import com.alibaba.fastjson.parser.deserializer.JavaBeanDeserializer;
import com.alibaba.fastjson.parser.deserializer.ObjectDeserializer;
import com.alibaba.fastjson.serializer.SerializerFeature;
import java.lang.reflect.AccessibleObject;
import java.lang.reflect.Array;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Proxy;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.security.AccessControlException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.AbstractCollection;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collection;
import java.util.Currency;
import java.util.Date;
import java.util.EnumSet;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeSet;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/util/TypeUtils.class */
public class TypeUtils {
    public static boolean compatibleWithJavaBean;
    private static Method oracleTimestampMethod;
    private static Method oracleDateMethod;
    private static Class<?> optionalClass;
    private static ConcurrentMap<String, Class<?>> mappings;
    private static Class<?> pathClass;
    private static boolean pathClass_error;
    private static boolean setAccessibleEnable = true;
    private static boolean oracleTimestampMethodInited = false;
    private static boolean oracleDateMethodInited = false;
    private static boolean optionalClassInited = false;

    static {
        compatibleWithJavaBean = false;
        try {
            String prop = System.getProperty("fastjson.compatibleWithJavaBean");
            if ("true".equals(prop)) {
                compatibleWithJavaBean = true;
            } else if ("false".equals(prop)) {
                compatibleWithJavaBean = false;
            }
        } catch (Throwable th) {
        }
        mappings = new ConcurrentHashMap();
        addBaseClassMappings();
        pathClass_error = false;
    }

    public static String castToString(Object value) {
        if (value == null) {
            return null;
        }
        return value.toString();
    }

    public static Byte castToByte(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Number) {
            return Byte.valueOf(((Number) value).byteValue());
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            return Byte.valueOf(Byte.parseByte(strVal));
        }
        throw new JSONException("can not cast to byte, value : " + value);
    }

    public static Character castToChar(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Character) {
            return (Character) value;
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0) {
                return null;
            }
            if (strVal.length() != 1) {
                throw new JSONException("can not cast to char, value : " + value);
            }
            return Character.valueOf(strVal.charAt(0));
        }
        throw new JSONException("can not cast to char, value : " + value);
    }

    public static Short castToShort(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Number) {
            return Short.valueOf(((Number) value).shortValue());
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            return Short.valueOf(Short.parseShort(strVal));
        }
        throw new JSONException("can not cast to short, value : " + value);
    }

    public static BigDecimal castToBigDecimal(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof BigDecimal) {
            return (BigDecimal) value;
        }
        if (value instanceof BigInteger) {
            return new BigDecimal((BigInteger) value);
        }
        String strVal = value.toString();
        if (strVal.length() == 0) {
            return null;
        }
        return new BigDecimal(strVal);
    }

    public static BigInteger castToBigInteger(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof BigInteger) {
            return (BigInteger) value;
        }
        if ((value instanceof Float) || (value instanceof Double)) {
            return BigInteger.valueOf(((Number) value).longValue());
        }
        String strVal = value.toString();
        if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
            return null;
        }
        return new BigInteger(strVal);
    }

    public static Float castToFloat(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Number) {
            return Float.valueOf(((Number) value).floatValue());
        }
        if (value instanceof String) {
            String strVal = value.toString();
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            if (strVal.indexOf(44) != 0) {
                strVal = strVal.replaceAll(",", "");
            }
            return Float.valueOf(Float.parseFloat(strVal));
        }
        throw new JSONException("can not cast to float, value : " + value);
    }

    public static Double castToDouble(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Number) {
            return Double.valueOf(((Number) value).doubleValue());
        }
        if (value instanceof String) {
            String strVal = value.toString();
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            if (strVal.indexOf(44) != 0) {
                strVal = strVal.replaceAll(",", "");
            }
            return Double.valueOf(Double.parseDouble(strVal));
        }
        throw new JSONException("can not cast to double, value : " + value);
    }

    public static Date castToDate(Object value) {
        String format;
        if (value == null) {
            return null;
        }
        if (value instanceof Date) {
            return (Date) value;
        }
        if (value instanceof Calendar) {
            return ((Calendar) value).getTime();
        }
        long longValue = -1;
        if (value instanceof Number) {
            long longValue2 = ((Number) value).longValue();
            return new Date(longValue2);
        }
        if (value instanceof String) {
            String strVal = (String) value;
            JSONScanner dateLexer = new JSONScanner(strVal);
            try {
                if (dateLexer.scanISO8601DateIfMatch(false)) {
                    Calendar calendar = dateLexer.getCalendar();
                    Date time = calendar.getTime();
                    dateLexer.close();
                    return time;
                }
                dateLexer.close();
                if (strVal.startsWith("/Date(") && strVal.endsWith(")/")) {
                    String dotnetDateStr = strVal.substring(6, strVal.length() - 2);
                    strVal = dotnetDateStr;
                }
                if (strVal.indexOf(45) != -1) {
                    if (strVal.length() == JSON.DEFFAULT_DATE_FORMAT.length()) {
                        format = JSON.DEFFAULT_DATE_FORMAT;
                    } else if (strVal.length() == 10) {
                        format = "yyyy-MM-dd";
                    } else if (strVal.length() == "yyyy-MM-dd HH:mm:ss".length()) {
                        format = "yyyy-MM-dd HH:mm:ss";
                    } else {
                        format = "yyyy-MM-dd HH:mm:ss.SSS";
                    }
                    SimpleDateFormat dateFormat = new SimpleDateFormat(format, JSON.defaultLocale);
                    dateFormat.setTimeZone(JSON.defaultTimeZone);
                    try {
                        return dateFormat.parse(strVal);
                    } catch (ParseException e) {
                        throw new JSONException("can not cast to Date, value : " + strVal);
                    }
                }
                if (strVal.length() == 0) {
                    return null;
                }
                longValue = Long.parseLong(strVal);
            } catch (Throwable th) {
                dateLexer.close();
                throw th;
            }
        }
        if (longValue < 0) {
            Class<?> clazz = value.getClass();
            if ("oracle.sql.TIMESTAMP".equals(clazz.getName())) {
                if (oracleTimestampMethod == null && !oracleTimestampMethodInited) {
                    try {
                        oracleTimestampMethod = clazz.getMethod("toJdbc", new Class[0]);
                        oracleTimestampMethodInited = true;
                    } catch (NoSuchMethodException e2) {
                        oracleTimestampMethodInited = true;
                    } catch (Throwable th2) {
                        oracleTimestampMethodInited = true;
                        throw th2;
                    }
                }
                try {
                    Object result = oracleTimestampMethod.invoke(value, new Object[0]);
                    return (Date) result;
                } catch (Exception e3) {
                    throw new JSONException("can not cast oracle.sql.TIMESTAMP to Date", e3);
                }
            }
            if ("oracle.sql.DATE".equals(clazz.getName())) {
                if (oracleDateMethod == null && !oracleDateMethodInited) {
                    try {
                        oracleDateMethod = clazz.getMethod("toJdbc", new Class[0]);
                        oracleDateMethodInited = true;
                    } catch (NoSuchMethodException e4) {
                        oracleDateMethodInited = true;
                    } catch (Throwable th3) {
                        oracleDateMethodInited = true;
                        throw th3;
                    }
                }
                try {
                    Object result2 = oracleDateMethod.invoke(value, new Object[0]);
                    return (Date) result2;
                } catch (Exception e5) {
                    throw new JSONException("can not cast oracle.sql.DATE to Date", e5);
                }
            }
            throw new JSONException("can not cast to Date, value : " + value);
        }
        return new Date(longValue);
    }

    public static java.sql.Date castToSqlDate(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof java.sql.Date) {
            return (java.sql.Date) value;
        }
        if (value instanceof Date) {
            return new java.sql.Date(((Date) value).getTime());
        }
        if (value instanceof Calendar) {
            return new java.sql.Date(((Calendar) value).getTimeInMillis());
        }
        long longValue = 0;
        if (value instanceof Number) {
            longValue = ((Number) value).longValue();
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            longValue = Long.parseLong(strVal);
        }
        if (longValue <= 0) {
            throw new JSONException("can not cast to Date, value : " + value);
        }
        return new java.sql.Date(longValue);
    }

    public static Timestamp castToTimestamp(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Calendar) {
            return new Timestamp(((Calendar) value).getTimeInMillis());
        }
        if (value instanceof Timestamp) {
            return (Timestamp) value;
        }
        if (value instanceof Date) {
            return new Timestamp(((Date) value).getTime());
        }
        long longValue = 0;
        if (value instanceof Number) {
            longValue = ((Number) value).longValue();
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            longValue = Long.parseLong(strVal);
        }
        if (longValue <= 0) {
            throw new JSONException("can not cast to Date, value : " + value);
        }
        return new Timestamp(longValue);
    }

    public static Long castToLong(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Number) {
            return Long.valueOf(((Number) value).longValue());
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            if (strVal.indexOf(44) != 0) {
                strVal = strVal.replaceAll(",", "");
            }
            try {
                return Long.valueOf(Long.parseLong(strVal));
            } catch (NumberFormatException e) {
                JSONScanner dateParser = new JSONScanner(strVal);
                Calendar calendar = null;
                if (dateParser.scanISO8601DateIfMatch(false)) {
                    calendar = dateParser.getCalendar();
                }
                dateParser.close();
                if (calendar != null) {
                    return Long.valueOf(calendar.getTimeInMillis());
                }
            }
        }
        throw new JSONException("can not cast to long, value : " + value);
    }

    public static Integer castToInt(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Integer) {
            return (Integer) value;
        }
        if (value instanceof Number) {
            return Integer.valueOf(((Number) value).intValue());
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            if (strVal.indexOf(44) != 0) {
                strVal = strVal.replaceAll(",", "");
            }
            return Integer.valueOf(Integer.parseInt(strVal));
        }
        if (value instanceof Boolean) {
            return Integer.valueOf(((Boolean) value).booleanValue() ? 1 : 0);
        }
        throw new JSONException("can not cast to int, value : " + value);
    }

    public static byte[] castToBytes(Object value) {
        if (value instanceof byte[]) {
            return (byte[]) value;
        }
        if (value instanceof String) {
            return IOUtils.decodeBase64((String) value);
        }
        throw new JSONException("can not cast to int, value : " + value);
    }

    public static Boolean castToBoolean(Object value) {
        if (value == null) {
            return null;
        }
        if (value instanceof Boolean) {
            return (Boolean) value;
        }
        if (value instanceof Number) {
            return Boolean.valueOf(((Number) value).intValue() == 1);
        }
        if (value instanceof String) {
            String strVal = (String) value;
            if (strVal.length() == 0 || "null".equals(strVal) || "NULL".equals(strVal)) {
                return null;
            }
            if ("true".equalsIgnoreCase(strVal) || "1".equals(strVal)) {
                return Boolean.TRUE;
            }
            if ("false".equalsIgnoreCase(strVal) || "0".equals(strVal)) {
                return Boolean.FALSE;
            }
        }
        throw new JSONException("can not cast to boolean, value : " + value);
    }

    public static <T> T castToJavaBean(Object obj, Class<T> cls) {
        return (T) cast(obj, (Class) cls, ParserConfig.getGlobalInstance());
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> T cast(Object obj, Class<T> cls, ParserConfig parserConfig) {
        Calendar calendar;
        if (obj == 0) {
            return null;
        }
        if (cls == null) {
            throw new IllegalArgumentException("clazz is null");
        }
        if (cls == obj.getClass()) {
            return obj;
        }
        if (obj instanceof Map) {
            if (cls == Map.class) {
                return obj;
            }
            Map map = (Map) obj;
            if (cls == Object.class && !map.containsKey(JSON.DEFAULT_TYPE_KEY)) {
                return obj;
            }
            return (T) castToJavaBean((Map) obj, cls, parserConfig);
        }
        if (cls.isArray()) {
            if (obj instanceof Collection) {
                Collection collection = (Collection) obj;
                int i = 0;
                T t = (T) Array.newInstance(cls.getComponentType(), collection.size());
                Iterator it = collection.iterator();
                while (it.hasNext()) {
                    Array.set(t, i, cast(it.next(), (Class) cls.getComponentType(), parserConfig));
                    i++;
                }
                return t;
            }
            if (cls == byte[].class) {
                return (T) castToBytes(obj);
            }
        }
        if (cls.isAssignableFrom(obj.getClass())) {
            return obj;
        }
        if (cls == Boolean.TYPE || cls == Boolean.class) {
            return (T) castToBoolean(obj);
        }
        if (cls == Byte.TYPE || cls == Byte.class) {
            return (T) castToByte(obj);
        }
        if (cls == Short.TYPE || cls == Short.class) {
            return (T) castToShort(obj);
        }
        if (cls == Integer.TYPE || cls == Integer.class) {
            return (T) castToInt(obj);
        }
        if (cls == Long.TYPE || cls == Long.class) {
            return (T) castToLong(obj);
        }
        if (cls == Float.TYPE || cls == Float.class) {
            return (T) castToFloat(obj);
        }
        if (cls == Double.TYPE || cls == Double.class) {
            return (T) castToDouble(obj);
        }
        if (cls == String.class) {
            return (T) castToString(obj);
        }
        if (cls == BigDecimal.class) {
            return (T) castToBigDecimal(obj);
        }
        if (cls == BigInteger.class) {
            return (T) castToBigInteger(obj);
        }
        if (cls == Date.class) {
            return (T) castToDate(obj);
        }
        if (cls == java.sql.Date.class) {
            return (T) castToSqlDate(obj);
        }
        if (cls == Timestamp.class) {
            return (T) castToTimestamp(obj);
        }
        if (cls.isEnum()) {
            return (T) castToEnum(obj, cls, parserConfig);
        }
        if (Calendar.class.isAssignableFrom(cls)) {
            Date castToDate = castToDate(obj);
            if (cls == Calendar.class) {
                calendar = Calendar.getInstance(JSON.defaultTimeZone, JSON.defaultLocale);
            } else {
                try {
                    calendar = (Calendar) cls.newInstance();
                } catch (Exception e) {
                    throw new JSONException("can not cast to : " + cls.getName(), e);
                }
            }
            calendar.setTime(castToDate);
            return (T) calendar;
        }
        if (obj instanceof String) {
            String str = (String) obj;
            if (str.length() == 0 || "null".equals(str) || "NULL".equals(str)) {
                return null;
            }
            if (cls == Currency.class) {
                return (T) Currency.getInstance(str);
            }
        }
        throw new JSONException("can not cast to : " + cls.getName());
    }

    public static <T> T castToEnum(Object obj, Class<T> cls, ParserConfig parserConfig) {
        try {
            if (obj instanceof String) {
                String str = (String) obj;
                if (str.length() == 0) {
                    return null;
                }
                return (T) Enum.valueOf(cls, str);
            }
            if (obj instanceof Number) {
                int intValue = ((Number) obj).intValue();
                T[] enumConstants = cls.getEnumConstants();
                if (intValue < enumConstants.length) {
                    return enumConstants[intValue];
                }
            }
            throw new JSONException("can not cast to : " + cls.getName());
        } catch (Exception e) {
            throw new JSONException("can not cast to : " + cls.getName(), e);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> T cast(Object obj, Type type, ParserConfig parserConfig) {
        if (obj == 0) {
            return null;
        }
        if (type instanceof Class) {
            return (T) cast(obj, (Class) type, parserConfig);
        }
        if (type instanceof ParameterizedType) {
            return (T) cast(obj, (ParameterizedType) type, parserConfig);
        }
        if (obj instanceof String) {
            String str = (String) obj;
            if (str.length() == 0 || "null".equals(str) || "NULL".equals(str)) {
                return null;
            }
        }
        if (type instanceof TypeVariable) {
            return obj;
        }
        throw new JSONException("can not cast to : " + type);
    }

    /* JADX WARN: Type inference failed for: r0v33, types: [T, java.util.HashMap, java.util.Map] */
    public static <T> T cast(Object obj, ParameterizedType parameterizedType, ParserConfig parserConfig) {
        AbstractCollection hashSet;
        Type rawType = parameterizedType.getRawType();
        if (rawType == Set.class || rawType == HashSet.class || rawType == TreeSet.class || rawType == List.class || rawType == ArrayList.class) {
            Type type = parameterizedType.getActualTypeArguments()[0];
            if (obj instanceof Iterable) {
                if (rawType == Set.class || rawType == HashSet.class) {
                    hashSet = new HashSet();
                } else if (rawType == TreeSet.class) {
                    hashSet = new TreeSet();
                } else {
                    hashSet = new ArrayList();
                }
                Iterator<T> it = ((Iterable) obj).iterator();
                while (it.hasNext()) {
                    hashSet.add(cast(it.next(), type, parserConfig));
                }
                return (T) hashSet;
            }
        }
        if (rawType == Map.class || rawType == HashMap.class) {
            Type type2 = parameterizedType.getActualTypeArguments()[0];
            Type type3 = parameterizedType.getActualTypeArguments()[1];
            if (obj instanceof Map) {
                ?? r0 = (T) new HashMap();
                for (Map.Entry entry : ((Map) obj).entrySet()) {
                    r0.put(cast(entry.getKey(), type2, parserConfig), cast(entry.getValue(), type3, parserConfig));
                }
                return r0;
            }
        }
        if ((obj instanceof String) && ((String) obj).length() == 0) {
            return null;
        }
        if (parameterizedType.getActualTypeArguments().length == 1 && (parameterizedType.getActualTypeArguments()[0] instanceof WildcardType)) {
            return (T) cast(obj, rawType, parserConfig);
        }
        throw new JSONException("can not cast to : " + parameterizedType);
    }

    public static <T> T castToJavaBean(Map<String, Object> map, Class<T> cls, ParserConfig parserConfig) {
        JSONObject jSONObject;
        int intValue;
        try {
            if (cls == StackTraceElement.class) {
                String str = (String) map.get("className");
                String str2 = (String) map.get("methodName");
                String str3 = (String) map.get("fileName");
                Number number = (Number) map.get("lineNumber");
                if (number == null) {
                    intValue = 0;
                } else {
                    intValue = number.intValue();
                }
                return (T) new StackTraceElement(str, str2, str3, intValue);
            }
            Object obj = map.get(JSON.DEFAULT_TYPE_KEY);
            if (obj instanceof String) {
                String str4 = (String) obj;
                Class<?> loadClass = loadClass(str4);
                if (loadClass == null) {
                    throw new ClassNotFoundException(str4 + " not found");
                }
                if (!loadClass.equals(cls)) {
                    return (T) castToJavaBean(map, loadClass, parserConfig);
                }
            }
            if (cls.isInterface()) {
                if (map instanceof JSONObject) {
                    jSONObject = (JSONObject) map;
                } else {
                    jSONObject = new JSONObject(map);
                }
                return (T) Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(), new Class[]{cls}, jSONObject);
            }
            if (parserConfig == null) {
                parserConfig = ParserConfig.getGlobalInstance();
            }
            JavaBeanDeserializer javaBeanDeserializer = null;
            ObjectDeserializer deserializer = parserConfig.getDeserializer(cls);
            if (deserializer instanceof JavaBeanDeserializer) {
                javaBeanDeserializer = (JavaBeanDeserializer) deserializer;
            }
            if (javaBeanDeserializer == null) {
                throw new JSONException("can not get javaBeanDeserializer");
            }
            return (T) javaBeanDeserializer.createInstance(map, parserConfig);
        } catch (Exception e) {
            throw new JSONException(e.getMessage(), e);
        }
    }

    private static void addBaseClassMappings() {
        mappings.put("byte", Byte.TYPE);
        mappings.put("short", Short.TYPE);
        mappings.put("int", Integer.TYPE);
        mappings.put("long", Long.TYPE);
        mappings.put("float", Float.TYPE);
        mappings.put("double", Double.TYPE);
        mappings.put("boolean", Boolean.TYPE);
        mappings.put("char", Character.TYPE);
        mappings.put("[byte", byte[].class);
        mappings.put("[short", short[].class);
        mappings.put("[int", int[].class);
        mappings.put("[long", long[].class);
        mappings.put("[float", float[].class);
        mappings.put("[double", double[].class);
        mappings.put("[boolean", boolean[].class);
        mappings.put("[char", char[].class);
        mappings.put(HashMap.class.getName(), HashMap.class);
    }

    public static void clearClassMapping() {
        mappings.clear();
        addBaseClassMappings();
    }

    public static Class<?> loadClass(String className) {
        return loadClass(className, null);
    }

    public static boolean isPath(Class<?> clazz) {
        if (pathClass == null && !pathClass_error) {
            try {
                pathClass = Class.forName("java.nio.file.Path");
            } catch (Throwable th) {
                pathClass_error = true;
            }
        }
        if (pathClass != null) {
            return pathClass.isAssignableFrom(clazz);
        }
        return false;
    }

    public static Class<?> loadClass(String className, ClassLoader classLoader) {
        if (className == null || className.length() == 0) {
            return null;
        }
        Class<?> clazz = mappings.get(className);
        if (clazz != null) {
            return clazz;
        }
        if (className.charAt(0) == '[') {
            Class<?> componentType = loadClass(className.substring(1), classLoader);
            return Array.newInstance(componentType, 0).getClass();
        }
        if (className.startsWith("L") && className.endsWith(";")) {
            String newClassName = className.substring(1, className.length() - 1);
            return loadClass(newClassName, classLoader);
        }
        if (classLoader != null) {
            try {
                clazz = classLoader.loadClass(className);
                mappings.put(className, clazz);
                return clazz;
            } catch (Throwable e) {
                e.printStackTrace();
            }
        }
        try {
            ClassLoader contextClassLoader = Thread.currentThread().getContextClassLoader();
            if (contextClassLoader != null) {
                clazz = contextClassLoader.loadClass(className);
                mappings.put(className, clazz);
                return clazz;
            }
        } catch (Throwable th) {
        }
        try {
            clazz = Class.forName(className);
            mappings.put(className, clazz);
            return clazz;
        } catch (Throwable th2) {
            return clazz;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:131:0x03e6 A[PHI: r23 r24 r25 r28 r30
      0x03e6: PHI (r23v9 'ordinal' int) = (r23v8 'ordinal' int), (r23v8 'ordinal' int), (r23v10 'ordinal' int), (r23v10 'ordinal' int) binds: [B:115:0x036a, B:117:0x037c, B:129:0x03da, B:130:0x03dd] A[DONT_GENERATE, DONT_INLINE]
      0x03e6: PHI (r24v12 'serialzeFeatures' int) = 
      (r24v11 'serialzeFeatures' int)
      (r24v11 'serialzeFeatures' int)
      (r24v13 'serialzeFeatures' int)
      (r24v13 'serialzeFeatures' int)
     binds: [B:115:0x036a, B:117:0x037c, B:129:0x03da, B:130:0x03dd] A[DONT_GENERATE, DONT_INLINE]
      0x03e6: PHI (r25v11 'label' java.lang.String) = 
      (r25v10 'label' java.lang.String)
      (r25v10 'label' java.lang.String)
      (r25v10 'label' java.lang.String)
      (r25v12 'label' java.lang.String)
     binds: [B:115:0x036a, B:117:0x037c, B:129:0x03da, B:130:0x03dd] A[DONT_GENERATE, DONT_INLINE]
      0x03e6: PHI (r28v3 'propertyName' java.lang.String) = 
      (r28v2 'propertyName' java.lang.String)
      (r28v2 'propertyName' java.lang.String)
      (r28v6 'propertyName' java.lang.String)
      (r28v6 'propertyName' java.lang.String)
     binds: [B:115:0x036a, B:117:0x037c, B:129:0x03da, B:130:0x03dd] A[DONT_GENERATE, DONT_INLINE]
      0x03e6: PHI (r30v1 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField) = 
      (r30v0 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r30v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r30v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r30v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
     binds: [B:115:0x036a, B:117:0x037c, B:129:0x03da, B:130:0x03dd] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:133:0x03ea  */
    /* JADX WARN: Removed duplicated region for block: B:136:0x03ff A[PHI: r28
      0x03ff: PHI (r28v4 'propertyName' java.lang.String) = (r28v3 'propertyName' java.lang.String), (r28v5 'propertyName' java.lang.String) binds: [B:132:0x03e7, B:134:0x03f9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:157:0x04ca  */
    /* JADX WARN: Removed duplicated region for block: B:160:0x04df A[PHI: r25
      0x04df: PHI (r25v4 'propertyName' java.lang.String) = (r25v3 'propertyName' java.lang.String), (r25v5 'propertyName' java.lang.String) binds: [B:156:0x04c7, B:158:0x04d9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:200:0x0426 A[ADDED_TO_REGION, REMOVE, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:37:0x0100 A[PHI: r27
      0x0100: PHI (r27v4 'propertyName' java.lang.String) = (r27v3 'propertyName' java.lang.String), (r27v5 'propertyName' java.lang.String) binds: [B:33:0x00e8, B:35:0x00fa] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x0149  */
    /* JADX WARN: Removed duplicated region for block: B:88:0x0290 A[PHI: r23 r24 r25 r28 r31
      0x0290: PHI (r23v11 'ordinal' int) = (r23v7 'ordinal' int), (r23v7 'ordinal' int), (r23v12 'ordinal' int), (r23v12 'ordinal' int) binds: [B:72:0x0214, B:74:0x0226, B:86:0x0284, B:87:0x0287] A[DONT_GENERATE, DONT_INLINE]
      0x0290: PHI (r24v14 'serialzeFeatures' int) = 
      (r24v10 'serialzeFeatures' int)
      (r24v10 'serialzeFeatures' int)
      (r24v15 'serialzeFeatures' int)
      (r24v15 'serialzeFeatures' int)
     binds: [B:72:0x0214, B:74:0x0226, B:86:0x0284, B:87:0x0287] A[DONT_GENERATE, DONT_INLINE]
      0x0290: PHI (r25v13 'label' java.lang.String) = 
      (r25v9 'label' java.lang.String)
      (r25v9 'label' java.lang.String)
      (r25v9 'label' java.lang.String)
      (r25v14 'label' java.lang.String)
     binds: [B:72:0x0214, B:74:0x0226, B:86:0x0284, B:87:0x0287] A[DONT_GENERATE, DONT_INLINE]
      0x0290: PHI (r28v14 'propertyName' java.lang.String) = 
      (r28v13 'propertyName' java.lang.String)
      (r28v13 'propertyName' java.lang.String)
      (r28v17 'propertyName' java.lang.String)
      (r28v17 'propertyName' java.lang.String)
     binds: [B:72:0x0214, B:74:0x0226, B:86:0x0284, B:87:0x0287] A[DONT_GENERATE, DONT_INLINE]
      0x0290: PHI (r31v2 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField) = 
      (r31v1 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r31v3 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r31v3 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
      (r31v3 'fieldAnnotation' com.alibaba.fastjson.annotation.JSONField)
     binds: [B:72:0x0214, B:74:0x0226, B:86:0x0284, B:87:0x0287] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:90:0x0294  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x02d0 A[PHI: r23 r24 r25
      0x02d0: PHI (r23v8 'ordinal' int) = (r23v7 'ordinal' int), (r23v11 'ordinal' int) binds: [B:42:0x0146, B:93:0x02a9] A[DONT_GENERATE, DONT_INLINE]
      0x02d0: PHI (r24v11 'serialzeFeatures' int) = (r24v10 'serialzeFeatures' int), (r24v14 'serialzeFeatures' int) binds: [B:42:0x0146, B:93:0x02a9] A[DONT_GENERATE, DONT_INLINE]
      0x02d0: PHI (r25v10 'label' java.lang.String) = (r25v9 'label' java.lang.String), (r25v13 'label' java.lang.String) binds: [B:42:0x0146, B:93:0x02a9] A[DONT_GENERATE, DONT_INLINE]] */
    /* JADX WARN: Removed duplicated region for block: B:96:0x02db  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.util.List<com.alibaba.fastjson.util.FieldInfo> computeGetters(java.lang.Class<?> r13, com.alibaba.fastjson.annotation.JSONType r14, java.util.Map<java.lang.String, java.lang.String> r15, boolean r16) {
        /*
            Method dump skipped, instructions count: 1545
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.alibaba.fastjson.util.TypeUtils.computeGetters(java.lang.Class, com.alibaba.fastjson.annotation.JSONType, java.util.Map, boolean):java.util.List");
    }

    public static JSONField getSupperMethodAnnotation(Class<?> clazz, Method method) {
        JSONField annotation;
        Class<?>[] interfaces = clazz.getInterfaces();
        if (interfaces.length > 0) {
            Class<?>[] types = method.getParameterTypes();
            for (Class<?> interfaceClass : interfaces) {
                for (Method interfaceMethod : interfaceClass.getMethods()) {
                    Class<?>[] interfaceTypes = interfaceMethod.getParameterTypes();
                    if (interfaceTypes.length == types.length && interfaceMethod.getName().equals(method.getName())) {
                        boolean match = true;
                        int i = 0;
                        while (true) {
                            if (i >= types.length) {
                                break;
                            }
                            if (interfaceTypes[i].equals(types[i])) {
                                i++;
                            } else {
                                match = false;
                                break;
                            }
                        }
                        if (match && (annotation = (JSONField) interfaceMethod.getAnnotation(JSONField.class)) != null) {
                            return annotation;
                        }
                    }
                }
            }
            return null;
        }
        return null;
    }

    private static boolean isJSONTypeIgnore(Class<?> clazz, String propertyName) {
        JSONType jsonType = (JSONType) clazz.getAnnotation(JSONType.class);
        if (jsonType != null) {
            String[] fields = jsonType.includes();
            if (fields.length > 0) {
                for (String str : fields) {
                    if (propertyName.equals(str)) {
                        return false;
                    }
                }
                return true;
            }
            for (String str2 : jsonType.ignores()) {
                if (propertyName.equals(str2)) {
                    return true;
                }
            }
        }
        if (clazz.getSuperclass() != Object.class && clazz.getSuperclass() != null && isJSONTypeIgnore(clazz.getSuperclass(), propertyName)) {
            return true;
        }
        return false;
    }

    public static boolean isGenericParamType(Type type) {
        Type superType;
        if (type instanceof ParameterizedType) {
            return true;
        }
        if (!(type instanceof Class) || (superType = ((Class) type).getGenericSuperclass()) == Object.class) {
            return false;
        }
        return isGenericParamType(superType);
    }

    public static Type getGenericParamType(Type type) {
        if (type instanceof ParameterizedType) {
            return type;
        }
        if (type instanceof Class) {
            return getGenericParamType(((Class) type).getGenericSuperclass());
        }
        return type;
    }

    public static Type unwrapOptional(Type type) {
        if (!optionalClassInited) {
            try {
                optionalClass = Class.forName("java.util.Optional");
                optionalClassInited = true;
            } catch (Exception e) {
                optionalClassInited = true;
            } catch (Throwable th) {
                optionalClassInited = true;
                throw th;
            }
        }
        if (type instanceof ParameterizedType) {
            ParameterizedType parameterizedType = (ParameterizedType) type;
            if (parameterizedType.getRawType() == optionalClass) {
                return parameterizedType.getActualTypeArguments()[0];
            }
        }
        return type;
    }

    public static Class<?> getClass(Type type) {
        if (type.getClass() == Class.class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            return getClass(((ParameterizedType) type).getRawType());
        }
        if (type instanceof TypeVariable) {
            Type boundType = ((TypeVariable) type).getBounds()[0];
            return (Class) boundType;
        }
        return Object.class;
    }

    public static Field getField(Class<?> clazz, String fieldName, Field[] declaredFields) {
        for (Field field : declaredFields) {
            if (fieldName.equals(field.getName())) {
                return field;
            }
        }
        Class<?> superClass = clazz.getSuperclass();
        if (superClass != null && superClass != Object.class) {
            return getField(superClass, fieldName, superClass.getDeclaredFields());
        }
        return null;
    }

    public static int getSerializeFeatures(Class<?> clazz) {
        JSONType annotation = (JSONType) clazz.getAnnotation(JSONType.class);
        if (annotation == null) {
            return 0;
        }
        return SerializerFeature.of(annotation.serialzeFeatures());
    }

    public static int getParserFeatures(Class<?> clazz) {
        JSONType annotation = (JSONType) clazz.getAnnotation(JSONType.class);
        if (annotation == null) {
            return 0;
        }
        return Feature.of(annotation.parseFeatures());
    }

    public static String decapitalize(String name) {
        if (name == null || name.length() == 0) {
            return name;
        }
        if (name.length() > 1 && Character.isUpperCase(name.charAt(1)) && Character.isUpperCase(name.charAt(0))) {
            return name;
        }
        char[] chars = name.toCharArray();
        chars[0] = Character.toLowerCase(chars[0]);
        return new String(chars);
    }

    static void setAccessible(AccessibleObject obj) {
        if (!setAccessibleEnable || obj.isAccessible()) {
            return;
        }
        try {
            obj.setAccessible(true);
        } catch (AccessControlException e) {
            setAccessibleEnable = false;
        }
    }

    public static Class<?> getCollectionItemClass(Type fieldType) {
        if (fieldType instanceof ParameterizedType) {
            Type actualTypeArgument = ((ParameterizedType) fieldType).getActualTypeArguments()[0];
            if (actualTypeArgument instanceof Class) {
                Class<?> itemClass = (Class) actualTypeArgument;
                if (!Modifier.isPublic(itemClass.getModifiers())) {
                    throw new JSONException("can not create ASMParser");
                }
                return itemClass;
            }
            throw new JSONException("can not create ASMParser");
        }
        return Object.class;
    }

    public static Collection createCollection(Type type) {
        Collection list;
        Type itemType;
        Class<?> rawClass = getRawClass(type);
        if (rawClass == AbstractCollection.class || rawClass == Collection.class) {
            list = new ArrayList();
        } else if (rawClass.isAssignableFrom(HashSet.class)) {
            list = new HashSet();
        } else if (rawClass.isAssignableFrom(LinkedHashSet.class)) {
            list = new LinkedHashSet();
        } else if (rawClass.isAssignableFrom(TreeSet.class)) {
            list = new TreeSet();
        } else if (rawClass.isAssignableFrom(ArrayList.class)) {
            list = new ArrayList();
        } else if (rawClass.isAssignableFrom(EnumSet.class)) {
            if (type instanceof ParameterizedType) {
                itemType = ((ParameterizedType) type).getActualTypeArguments()[0];
            } else {
                itemType = Object.class;
            }
            list = EnumSet.noneOf((Class) itemType);
        } else {
            try {
                list = (Collection) rawClass.newInstance();
            } catch (Exception e) {
                throw new JSONException("create instane error, class " + rawClass.getName());
            }
        }
        return list;
    }

    public static Class<?> getRawClass(Type type) {
        if (type instanceof Class) {
            return (Class) type;
        }
        if (type instanceof ParameterizedType) {
            return getRawClass(((ParameterizedType) type).getRawType());
        }
        throw new JSONException("TODO");
    }
}
