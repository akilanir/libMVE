package org.apache.commons.beanutils.locale;

import java.text.ParseException;
import java.util.Locale;
import org.apache.commons.beanutils.ConversionException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/BaseLocaleConverter.class */
public abstract class BaseLocaleConverter implements LocaleConverter {
    private Log log;
    private Object defaultValue;
    protected boolean useDefault;
    protected Locale locale;
    protected String pattern;
    protected boolean locPattern;
    static Class class$org$apache$commons$beanutils$locale$BaseLocaleConverter;

    protected abstract Object parse(Object obj, String str) throws ParseException;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    protected BaseLocaleConverter(Locale locale, String pattern) {
        this(null, locale, pattern, false, false);
    }

    protected BaseLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        this(null, locale, pattern, false, locPattern);
    }

    protected BaseLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    protected BaseLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        this(defaultValue, locale, pattern, true, locPattern);
    }

    private BaseLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean useDefault, boolean locPattern) {
        Class cls;
        if (class$org$apache$commons$beanutils$locale$BaseLocaleConverter == null) {
            cls = class$("org.apache.commons.beanutils.locale.BaseLocaleConverter");
            class$org$apache$commons$beanutils$locale$BaseLocaleConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$BaseLocaleConverter;
        }
        this.log = LogFactory.getLog(cls);
        this.defaultValue = null;
        this.useDefault = false;
        this.locale = Locale.getDefault();
        this.pattern = null;
        this.locPattern = false;
        if (useDefault) {
            this.defaultValue = defaultValue;
            this.useDefault = true;
        }
        if (locale != null) {
            this.locale = locale;
        }
        this.pattern = pattern;
        this.locPattern = locPattern;
    }

    public Object convert(Object value) {
        return convert(value, (String) null);
    }

    public Object convert(Object value, String pattern) {
        return convert(null, value, pattern);
    }

    @Override // org.apache.commons.beanutils.Converter
    public Object convert(Class type, Object value) {
        return convert(type, value, null);
    }

    @Override // org.apache.commons.beanutils.locale.LocaleConverter
    public Object convert(Class type, Object value, String pattern) {
        if (value == null) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            this.log.debug("Null value specified for conversion, returing null");
            return null;
        }
        try {
            if (pattern != null) {
                return parse(value, pattern);
            }
            return parse(value, this.pattern);
        } catch (Exception e) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            if (e instanceof ConversionException) {
                throw ((ConversionException) e);
            }
            throw new ConversionException(e);
        }
    }
}
