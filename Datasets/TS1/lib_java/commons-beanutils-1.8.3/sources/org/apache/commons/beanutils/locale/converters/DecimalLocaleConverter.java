package org.apache.commons.beanutils.locale.converters;

import java.text.DecimalFormat;
import java.text.ParseException;
import java.util.Locale;
import org.apache.commons.beanutils.locale.BaseLocaleConverter;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/converters/DecimalLocaleConverter.class */
public class DecimalLocaleConverter extends BaseLocaleConverter {
    private Log log;
    static Class class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public DecimalLocaleConverter() {
        this(false);
    }

    public DecimalLocaleConverter(boolean locPattern) {
        this(Locale.getDefault(), locPattern);
    }

    public DecimalLocaleConverter(Locale locale) {
        this(locale, false);
    }

    public DecimalLocaleConverter(Locale locale, boolean locPattern) {
        this(locale, (String) null, locPattern);
    }

    public DecimalLocaleConverter(Locale locale, String pattern) {
        this(locale, pattern, false);
    }

    public DecimalLocaleConverter(Locale locale, String pattern, boolean locPattern) {
        Class cls;
        super(locale, pattern, locPattern);
        if (class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter == null) {
            cls = class$("org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter");
            class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter;
        }
        this.log = LogFactory.getLog(cls);
    }

    public DecimalLocaleConverter(Object defaultValue) {
        this(defaultValue, false);
    }

    public DecimalLocaleConverter(Object defaultValue, boolean locPattern) {
        this(defaultValue, Locale.getDefault(), locPattern);
    }

    public DecimalLocaleConverter(Object defaultValue, Locale locale) {
        this(defaultValue, locale, false);
    }

    public DecimalLocaleConverter(Object defaultValue, Locale locale, boolean locPattern) {
        this(defaultValue, locale, null, locPattern);
    }

    public DecimalLocaleConverter(Object defaultValue, Locale locale, String pattern) {
        this(defaultValue, locale, pattern, false);
    }

    public DecimalLocaleConverter(Object defaultValue, Locale locale, String pattern, boolean locPattern) {
        Class cls;
        super(defaultValue, locale, pattern, locPattern);
        if (class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter == null) {
            cls = class$("org.apache.commons.beanutils.locale.converters.DecimalLocaleConverter");
            class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$converters$DecimalLocaleConverter;
        }
        this.log = LogFactory.getLog(cls);
    }

    @Override // org.apache.commons.beanutils.locale.BaseLocaleConverter
    protected Object parse(Object value, String pattern) throws ParseException {
        if (value instanceof Number) {
            return value;
        }
        DecimalFormat formatter = (DecimalFormat) DecimalFormat.getInstance(this.locale);
        if (pattern != null) {
            if (this.locPattern) {
                formatter.applyLocalizedPattern(pattern);
            } else {
                formatter.applyPattern(pattern);
            }
        } else {
            this.log.debug("No pattern provided, using default.");
        }
        return formatter.parse((String) value);
    }
}
