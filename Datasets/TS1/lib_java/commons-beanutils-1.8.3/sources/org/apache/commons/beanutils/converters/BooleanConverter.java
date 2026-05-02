package org.apache.commons.beanutils.converters;

import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/BooleanConverter.class */
public final class BooleanConverter extends AbstractConverter {
    public static final Object NO_DEFAULT = new Object();
    private String[] trueStrings;
    private String[] falseStrings;
    static Class class$java$lang$Boolean;

    public BooleanConverter() {
        this.trueStrings = new String[]{"true", "yes", "y", "on", "1"};
        this.falseStrings = new String[]{"false", "no", "n", "off", "0"};
    }

    public BooleanConverter(Object defaultValue) {
        this.trueStrings = new String[]{"true", "yes", "y", "on", "1"};
        this.falseStrings = new String[]{"false", "no", "n", "off", "0"};
        if (defaultValue != NO_DEFAULT) {
            setDefaultValue(defaultValue);
        }
    }

    public BooleanConverter(String[] trueStrings, String[] falseStrings) {
        this.trueStrings = new String[]{"true", "yes", "y", "on", "1"};
        this.falseStrings = new String[]{"false", "no", "n", "off", "0"};
        this.trueStrings = copyStrings(trueStrings);
        this.falseStrings = copyStrings(falseStrings);
    }

    public BooleanConverter(String[] trueStrings, String[] falseStrings, Object defaultValue) {
        this.trueStrings = new String[]{"true", "yes", "y", "on", "1"};
        this.falseStrings = new String[]{"false", "no", "n", "off", "0"};
        this.trueStrings = copyStrings(trueStrings);
        this.falseStrings = copyStrings(falseStrings);
        if (defaultValue != NO_DEFAULT) {
            setDefaultValue(defaultValue);
        }
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Class getDefaultType() {
        if (class$java$lang$Boolean != null) {
            return class$java$lang$Boolean;
        }
        Class class$ = class$("java.lang.Boolean");
        class$java$lang$Boolean = class$;
        return class$;
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    @Override // org.apache.commons.beanutils.converters.AbstractConverter
    protected Object convertToType(Class type, Object value) throws Throwable {
        String stringValue = value.toString().toLowerCase();
        for (int i = 0; i < this.trueStrings.length; i++) {
            if (this.trueStrings[i].equals(stringValue)) {
                return Boolean.TRUE;
            }
        }
        for (int i2 = 0; i2 < this.falseStrings.length; i2++) {
            if (this.falseStrings[i2].equals(stringValue)) {
                return Boolean.FALSE;
            }
        }
        throw new ConversionException(new StringBuffer().append("Can't convert value '").append(value).append("' to a Boolean").toString());
    }

    private static String[] copyStrings(String[] src) {
        String[] dst = new String[src.length];
        for (int i = 0; i < src.length; i++) {
            dst[i] = src[i].toLowerCase();
        }
        return dst;
    }
}
