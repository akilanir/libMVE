package org.apache.commons.beanutils.locale.converters;

import java.text.ParseException;
import java.util.Locale;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/converters/ShortLocaleConverter.class */
public class ShortLocaleConverter extends DecimalLocaleConverter {
    public ShortLocaleConverter() {
        this(false);
    }

    public ShortLocaleConverter(boolean locPattern) {
        this(Locale.getDefault(), locPattern);
    }

    public ShortLocaleConverter(Locale locale) {
        this(locale, false);
    }

    public ShortLocaleConverter(Locale locale, boolean locPattern) {
        this(locale, (String) null, locPattern);
    }

    public ShortLocaleConverter(Locale locale, String pattern) {
        this(locale, pattern, false);
    }

    public ShortLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        super(locale, pattern, locPattern);
    }

    public ShortLocaleConverter(Object defaultValue) {
        this(defaultValue, false);
    }

    public ShortLocaleConverter(Object defaultValue, boolean locPattern) {
        this(defaultValue, Locale.getDefault(), locPattern);
    }

    public ShortLocaleConverter(Object defaultValue, Locale locale) {
        this(defaultValue, locale, false);
    }

    public ShortLocaleConverter(Object defaultValue, Locale locale, boolean locPattern) {
        this(defaultValue, locale, null, locPattern);
    }

    public ShortLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    public ShortLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        super(defaultValue, locale, pattern, locPattern);
    }

    @Override // org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter, org.apache.commons.beanutils.locale.BaseLocaleConverter
    protected Object parse(Object value, String pattern) throws ParseException {
        Object result = super.parse(value, pattern);
        if (result == null || (result instanceof Short)) {
            return result;
        }
        Number parsed = (Number) result;
        if (parsed.longValue() != parsed.shortValue()) {
            throw new ConversionException(new StringBuffer().append("Supplied number is not of type Short: ").append(parsed.longValue()).toString());
        }
        return new Short(parsed.shortValue());
    }
}
