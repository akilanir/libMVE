package org.apache.commons.beanutils.locale.converters;

import java.text.ParseException;
import java.util.Locale;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/converters/FloatLocaleConverter.class */
public class FloatLocaleConverter extends DecimalLocaleConverter {
    public FloatLocaleConverter() {
        this(false);
    }

    public FloatLocaleConverter(boolean locPattern) {
        this(Locale.getDefault(), locPattern);
    }

    public FloatLocaleConverter(Locale locale) {
        this(locale, false);
    }

    public FloatLocaleConverter(Locale locale, boolean locPattern) {
        this(locale, (String) null, locPattern);
    }

    public FloatLocaleConverter(Locale locale, String pattern) {
        this(locale, pattern, false);
    }

    public FloatLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        super(locale, pattern, locPattern);
    }

    public FloatLocaleConverter(Object defaultValue) {
        this(defaultValue, false);
    }

    public FloatLocaleConverter(Object defaultValue, boolean locPattern) {
        this(defaultValue, Locale.getDefault(), locPattern);
    }

    public FloatLocaleConverter(Object defaultValue, Locale locale) {
        this(defaultValue, locale, false);
    }

    public FloatLocaleConverter(Object defaultValue, Locale locale, boolean locPattern) {
        this(defaultValue, locale, null, locPattern);
    }

    public FloatLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    public FloatLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        super(defaultValue, locale, pattern, locPattern);
    }

    @Override // org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter, org.apache.commons.beanutils.locale.BaseLocaleConverter
    protected Object parse(Object value, String pattern) throws ParseException {
        Number parsed = (Number) super.parse(value, pattern);
        double doubleValue = parsed.doubleValue();
        double posDouble = doubleValue >= 0.0d ? doubleValue : doubleValue * (-1.0d);
        if (posDouble != 0.0d && (posDouble < 1.401298464324817E-45d || posDouble > 3.4028234663852886E38d)) {
            throw new ConversionException(new StringBuffer().append("Supplied number is not of type Float: ").append(parsed).toString());
        }
        return new Float(parsed.floatValue());
    }
}
