package org.apache.commons.beanutils.locale.converters;

import java.text.ParseException;
import java.util.Locale;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/converters/DoubleLocaleConverter.class */
public class DoubleLocaleConverter extends DecimalLocaleConverter {
    public DoubleLocaleConverter() {
        this(false);
    }

    public DoubleLocaleConverter(boolean locPattern) {
        this(Locale.getDefault(), locPattern);
    }

    public DoubleLocaleConverter(Locale locale) {
        this(locale, false);
    }

    public DoubleLocaleConverter(Locale locale, boolean locPattern) {
        this(locale, (String) null, locPattern);
    }

    public DoubleLocaleConverter(Locale locale, String pattern) {
        this(locale, pattern, false);
    }

    public DoubleLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        super(locale, pattern, locPattern);
    }

    public DoubleLocaleConverter(Object defaultValue) {
        this(defaultValue, false);
    }

    public DoubleLocaleConverter(Object defaultValue, boolean locPattern) {
        this(defaultValue, Locale.getDefault(), locPattern);
    }

    public DoubleLocaleConverter(Object defaultValue, Locale locale) {
        this(defaultValue, locale, false);
    }

    public DoubleLocaleConverter(Object defaultValue, Locale locale, boolean locPattern) {
        this(defaultValue, locale, null, locPattern);
    }

    public DoubleLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    public DoubleLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        super(defaultValue, locale, pattern, locPattern);
    }

    @Override // org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter, org.apache.commons.beanutils.locale.BaseLocaleConverter
    protected Object parse(Object value, String pattern) throws ParseException {
        Number result = (Number) super.parse(value, pattern);
        if (result instanceof Long) {
            return new Double(result.doubleValue());
        }
        return result;
    }
}
