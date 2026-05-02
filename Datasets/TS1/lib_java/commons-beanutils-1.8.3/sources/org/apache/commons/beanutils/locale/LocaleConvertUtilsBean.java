package org.apache.commons.beanutils.locale;

import java.lang.reflect.Array;
import java.util.Collection;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.locale.converters.BigDecimalLocaleConverter;
import org.apache.commons.beanutils.locale.converters.BigIntegerLocaleConverter;
import org.apache.commons.beanutils.locale.converters.ByteLocaleConverter;
import org.apache.commons.beanutils.locale.converters.DoubleLocaleConverter;
import org.apache.commons.beanutils.locale.converters.FloatLocaleConverter;
import org.apache.commons.beanutils.locale.converters.IntegerLocaleConverter;
import org.apache.commons.beanutils.locale.converters.LongLocaleConverter;
import org.apache.commons.beanutils.locale.converters.ShortLocaleConverter;
import org.apache.commons.beanutils.locale.converters.SqlDateLocaleConverter;
import org.apache.commons.beanutils.locale.converters.SqlTimeLocaleConverter;
import org.apache.commons.beanutils.locale.converters.SqlTimestampLocaleConverter;
import org.apache.commons.beanutils.locale.converters.StringLocaleConverter;
import org.apache.commons.collections.FastHashMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleConvertUtilsBean.class */
public class LocaleConvertUtilsBean {
    private Locale defaultLocale = Locale.getDefault();
    private boolean applyLocalized = false;
    private Log log;
    private FastHashMap mapConverters;
    static Class class$org$apache$commons$beanutils$locale$LocaleConvertUtils;
    static Class class$java$lang$String;
    static Class class$java$math$BigDecimal;
    static Class class$java$math$BigInteger;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Short;
    static Class class$java$sql$Date;
    static Class class$java$sql$Time;
    static Class class$java$sql$Timestamp;

    /* renamed from: org.apache.commons.beanutils.locale.LocaleConvertUtilsBean$1, reason: invalid class name */
    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleConvertUtilsBean$1.class */
    static class AnonymousClass1 {
    }

    public static LocaleConvertUtilsBean getInstance() {
        return LocaleBeanUtilsBean.getLocaleBeanUtilsInstance().getLocaleConvertUtils();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public LocaleConvertUtilsBean() {
        Class cls;
        if (class$org$apache$commons$beanutils$locale$LocaleConvertUtils == null) {
            cls = class$("org.apache.commons.beanutils.locale.LocaleConvertUtils");
            class$org$apache$commons$beanutils$locale$LocaleConvertUtils = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$LocaleConvertUtils;
        }
        this.log = LogFactory.getLog(cls);
        this.mapConverters = new DelegateFastHashMap(BeanUtils.createCache(), null);
        this.mapConverters.setFast(false);
        deregister();
        this.mapConverters.setFast(true);
    }

    public Locale getDefaultLocale() {
        return this.defaultLocale;
    }

    public void setDefaultLocale(Locale locale) {
        if (locale == null) {
            this.defaultLocale = Locale.getDefault();
        } else {
            this.defaultLocale = locale;
        }
    }

    public boolean getApplyLocalized() {
        return this.applyLocalized;
    }

    public void setApplyLocalized(boolean newApplyLocalized) {
        this.applyLocalized = newApplyLocalized;
    }

    public String convert(Object value) {
        return convert(value, this.defaultLocale, (String) null);
    }

    public String convert(Object value, String pattern) {
        return convert(value, this.defaultLocale, pattern);
    }

    public String convert(Object value, Locale locale, String pattern) {
        Class cls;
        Class cls2;
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        LocaleConverter converter = lookup(cls, locale);
        if (class$java$lang$String == null) {
            cls2 = class$("java.lang.String");
            class$java$lang$String = cls2;
        } else {
            cls2 = class$java$lang$String;
        }
        return (String) converter.convert(cls2, value, pattern);
    }

    public Object convert(String value, Class clazz) {
        return convert(value, clazz, this.defaultLocale, (String) null);
    }

    public Object convert(String value, Class clazz, String pattern) {
        return convert(value, clazz, this.defaultLocale, pattern);
    }

    public Object convert(String value, Class clazz, Locale locale, String pattern) {
        Class cls;
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Convert string ").append(value).append(" to class ").append(clazz.getName()).append(" using ").append(locale).append(" locale and ").append(pattern).append(" pattern").toString());
        }
        LocaleConverter converter = lookup(clazz, locale);
        if (converter == null) {
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            converter = lookup(cls, locale);
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("  Using converter ").append(converter).toString());
        }
        return converter.convert(clazz, value, pattern);
    }

    public Object convert(String[] values, Class clazz, String pattern) {
        return convert(values, clazz, getDefaultLocale(), pattern);
    }

    public Object convert(String[] values, Class clazz) {
        return convert(values, clazz, getDefaultLocale(), (String) null);
    }

    public Object convert(String[] values, Class clazz, Locale locale, String pattern) {
        Class type = clazz;
        if (clazz.isArray()) {
            type = clazz.getComponentType();
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Convert String[").append(values.length).append("] to class ").append(type.getName()).append("[] using ").append(locale).append(" locale and ").append(pattern).append(" pattern").toString());
        }
        Object array = Array.newInstance((Class<?>) type, values.length);
        for (int i = 0; i < values.length; i++) {
            Array.set(array, i, convert(values[i], type, locale, pattern));
        }
        return array;
    }

    public void register(LocaleConverter converter, Class clazz, Locale locale) {
        lookup(locale).put(clazz, converter);
    }

    public void deregister() {
        FastHashMap defaultConverter = lookup(this.defaultLocale);
        this.mapConverters.setFast(false);
        this.mapConverters.clear();
        this.mapConverters.put(this.defaultLocale, defaultConverter);
        this.mapConverters.setFast(true);
    }

    public void deregister(Locale locale) {
        this.mapConverters.remove(locale);
    }

    public void deregister(Class clazz, Locale locale) {
        lookup(locale).remove(clazz);
    }

    public LocaleConverter lookup(Class clazz, Locale locale) {
        LocaleConverter converter = (LocaleConverter) lookup(locale).get(clazz);
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("LocaleConverter:").append(converter).toString());
        }
        return converter;
    }

    protected FastHashMap lookup(Locale locale) {
        FastHashMap localeConverters;
        if (locale == null) {
            localeConverters = (FastHashMap) this.mapConverters.get(this.defaultLocale);
        } else {
            localeConverters = (FastHashMap) this.mapConverters.get(locale);
            if (localeConverters == null) {
                localeConverters = create(locale);
                this.mapConverters.put(locale, localeConverters);
            }
        }
        return localeConverters;
    }

    protected FastHashMap create(Locale locale) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        Class cls9;
        Class cls10;
        Class cls11;
        Class cls12;
        FastHashMap converter = new DelegateFastHashMap(BeanUtils.createCache(), null);
        converter.setFast(false);
        if (class$java$math$BigDecimal == null) {
            cls = class$("java.math.BigDecimal");
            class$java$math$BigDecimal = cls;
        } else {
            cls = class$java$math$BigDecimal;
        }
        converter.put(cls, new BigDecimalLocaleConverter(locale, this.applyLocalized));
        if (class$java$math$BigInteger == null) {
            cls2 = class$("java.math.BigInteger");
            class$java$math$BigInteger = cls2;
        } else {
            cls2 = class$java$math$BigInteger;
        }
        converter.put(cls2, new BigIntegerLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Byte == null) {
            cls3 = class$("java.lang.Byte");
            class$java$lang$Byte = cls3;
        } else {
            cls3 = class$java$lang$Byte;
        }
        converter.put(cls3, new ByteLocaleConverter(locale, this.applyLocalized));
        converter.put(Byte.TYPE, new ByteLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Double == null) {
            cls4 = class$("java.lang.Double");
            class$java$lang$Double = cls4;
        } else {
            cls4 = class$java$lang$Double;
        }
        converter.put(cls4, new DoubleLocaleConverter(locale, this.applyLocalized));
        converter.put(Double.TYPE, new DoubleLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Float == null) {
            cls5 = class$("java.lang.Float");
            class$java$lang$Float = cls5;
        } else {
            cls5 = class$java$lang$Float;
        }
        converter.put(cls5, new FloatLocaleConverter(locale, this.applyLocalized));
        converter.put(Float.TYPE, new FloatLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Integer == null) {
            cls6 = class$("java.lang.Integer");
            class$java$lang$Integer = cls6;
        } else {
            cls6 = class$java$lang$Integer;
        }
        converter.put(cls6, new IntegerLocaleConverter(locale, this.applyLocalized));
        converter.put(Integer.TYPE, new IntegerLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Long == null) {
            cls7 = class$("java.lang.Long");
            class$java$lang$Long = cls7;
        } else {
            cls7 = class$java$lang$Long;
        }
        converter.put(cls7, new LongLocaleConverter(locale, this.applyLocalized));
        converter.put(Long.TYPE, new LongLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$Short == null) {
            cls8 = class$("java.lang.Short");
            class$java$lang$Short = cls8;
        } else {
            cls8 = class$java$lang$Short;
        }
        converter.put(cls8, new ShortLocaleConverter(locale, this.applyLocalized));
        converter.put(Short.TYPE, new ShortLocaleConverter(locale, this.applyLocalized));
        if (class$java$lang$String == null) {
            cls9 = class$("java.lang.String");
            class$java$lang$String = cls9;
        } else {
            cls9 = class$java$lang$String;
        }
        converter.put(cls9, new StringLocaleConverter(locale, this.applyLocalized));
        if (class$java$sql$Date == null) {
            cls10 = class$("java.sql.Date");
            class$java$sql$Date = cls10;
        } else {
            cls10 = class$java$sql$Date;
        }
        converter.put(cls10, new SqlDateLocaleConverter(locale, "yyyy-MM-dd"));
        if (class$java$sql$Time == null) {
            cls11 = class$("java.sql.Time");
            class$java$sql$Time = cls11;
        } else {
            cls11 = class$java$sql$Time;
        }
        converter.put(cls11, new SqlTimeLocaleConverter(locale, "HH:mm:ss"));
        if (class$java$sql$Timestamp == null) {
            cls12 = class$("java.sql.Timestamp");
            class$java$sql$Timestamp = cls12;
        } else {
            cls12 = class$java$sql$Timestamp;
        }
        converter.put(cls12, new SqlTimestampLocaleConverter(locale, "yyyy-MM-dd HH:mm:ss.S"));
        converter.setFast(true);
        return converter;
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleConvertUtilsBean$DelegateFastHashMap.class */
    private static class DelegateFastHashMap extends FastHashMap {
        private final Map map;

        DelegateFastHashMap(Map x0, AnonymousClass1 x1) {
            this(x0);
        }

        private DelegateFastHashMap(Map map) {
            this.map = map;
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            this.map.clear();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object key) {
            return this.map.containsKey(key);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object value) {
            return this.map.containsValue(value);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set entrySet() {
            return this.map.entrySet();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.AbstractMap, java.util.Map
        public boolean equals(Object o) {
            return this.map.equals(o);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object get(Object key) {
            return this.map.get(key);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.AbstractMap, java.util.Map
        public int hashCode() {
            return this.map.hashCode();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return this.map.isEmpty();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set keySet() {
            return this.map.keySet();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object put(Object key, Object value) {
            return this.map.put(key, value);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void putAll(Map m) {
            this.map.putAll(m);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object remove(Object key) {
            return this.map.remove(key);
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return this.map.size();
        }

        @Override // org.apache.commons.collections.FastHashMap, java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Collection values() {
            return this.map.values();
        }

        @Override // org.apache.commons.collections.FastHashMap
        public boolean getFast() {
            return BeanUtils.getCacheFast(this.map);
        }

        @Override // org.apache.commons.collections.FastHashMap
        public void setFast(boolean fast) {
            BeanUtils.setCacheFast(this.map, fast);
        }
    }
}
