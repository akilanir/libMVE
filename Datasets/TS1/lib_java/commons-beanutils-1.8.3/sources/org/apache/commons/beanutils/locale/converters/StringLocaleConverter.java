package org.apache.commons.beanutils.locale.converters;

import java.math.BigDecimal;
import java.math.BigInteger;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import org.apache.commons.beanutils.locale.BaseLocaleConverter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/converters/StringLocaleConverter.class */
public class StringLocaleConverter extends BaseLocaleConverter {
    private Log log;
    static Class class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public StringLocaleConverter() {
        this(false);
    }

    public StringLocaleConverter(boolean locPattern) {
        this(Locale.getDefault(), locPattern);
    }

    public StringLocaleConverter(Locale locale) {
        this(locale, false);
    }

    public StringLocaleConverter(Locale locale, boolean locPattern) {
        this(locale, (String) null, locPattern);
    }

    public StringLocaleConverter(Locale locale, String pattern) {
        this(locale, pattern, false);
    }

    public StringLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        Class cls;
        super(locale, pattern, locPattern);
        if (class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter == null) {
            cls = class$("org.apache.commons.beanutils.locale.converters.StringLocaleConverter");
            class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter;
        }
        this.log = LogFactory.getLog(cls);
    }

    public StringLocaleConverter(Object defaultValue) {
        this(defaultValue, false);
    }

    public StringLocaleConverter(Object defaultValue, boolean locPattern) {
        this(defaultValue, Locale.getDefault(), locPattern);
    }

    public StringLocaleConverter(Object defaultValue, Locale locale) {
        this(defaultValue, locale, false);
    }

    public StringLocaleConverter(Object defaultValue, Locale locale, boolean locPattern) {
        this(defaultValue, locale, null, locPattern);
    }

    public StringLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    public StringLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        Class cls;
        super(defaultValue, locale, pattern, locPattern);
        if (class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter == null) {
            cls = class$("org.apache.commons.beanutils.locale.converters.StringLocaleConverter");
            class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$converters$StringLocaleConverter;
        }
        this.log = LogFactory.getLog(cls);
    }

    @Override // org.apache.commons.beanutils.locale.BaseLocaleConverter
    protected Object parse(Object value, String pattern) throws ParseException {
        String result;
        if ((value instanceof Integer) || (value instanceof Long) || (value instanceof BigInteger) || (value instanceof Byte) || (value instanceof Short)) {
            result = getDecimalFormat(this.locale, pattern).format(((Number) value).longValue());
        } else if ((value instanceof Double) || (value instanceof BigDecimal) || (value instanceof Float)) {
            result = getDecimalFormat(this.locale, pattern).format(((Number) value).doubleValue());
        } else if (value instanceof Date) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(pattern, this.locale);
            result = dateFormat.format(value);
        } else {
            result = value.toString();
        }
        return result;
    }

    private DecimalFormat getDecimalFormat(Locale locale, String pattern) {
        DecimalFormat numberFormat = (DecimalFormat) NumberFormat.getInstance(locale);
        if (pattern != null) {
            if (this.locPattern) {
                numberFormat.applyLocalizedPattern(pattern);
            } else {
                numberFormat.applyPattern(pattern);
            }
        } else {
            this.log.debug("No pattern provided, using default.");
        }
        return numberFormat;
    }
}
