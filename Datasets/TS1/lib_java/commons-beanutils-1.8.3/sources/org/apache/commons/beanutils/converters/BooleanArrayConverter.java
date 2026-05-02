package org.apache.commons.beanutils.converters;

import java.util.List;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/BooleanArrayConverter.class */
public final class BooleanArrayConverter extends AbstractArrayConverter {
    public static final Class MODEL = new boolean[0].getClass();
    private static final BooleanConverter DEFAULT_CONVERTER = new BooleanConverter();
    protected final BooleanConverter booleanConverter;
    static Class class$java$lang$Boolean;

    public BooleanArrayConverter() {
        this.booleanConverter = DEFAULT_CONVERTER;
    }

    public BooleanArrayConverter(Object defaultValue) {
        super(defaultValue);
        this.booleanConverter = DEFAULT_CONVERTER;
    }

    public BooleanArrayConverter(BooleanConverter converter, Object defaultValue) {
        super(defaultValue);
        this.booleanConverter = converter;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractArrayConverter, org.apache.commons.beanutils.Converter
    public Object convert(Class type, Object value) {
        Class cls;
        Class cls2;
        if (value == null) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            throw new ConversionException("No value specified");
        }
        if (MODEL == value.getClass()) {
            return value;
        }
        if (strings.getClass() == value.getClass()) {
            try {
                String[] values = (String[]) value;
                boolean[] results = new boolean[values.length];
                for (int i = 0; i < values.length; i++) {
                    String stringValue = values[i];
                    BooleanConverter booleanConverter = this.booleanConverter;
                    if (class$java$lang$Boolean == null) {
                        cls2 = class$("java.lang.Boolean");
                        class$java$lang$Boolean = cls2;
                    } else {
                        cls2 = class$java$lang$Boolean;
                    }
                    Object result = booleanConverter.convert(cls2, stringValue);
                    results[i] = ((Boolean) result).booleanValue();
                }
                return results;
            } catch (Exception e) {
                if (this.useDefault) {
                    return this.defaultValue;
                }
                throw new ConversionException(value.toString(), e);
            }
        }
        try {
            List list = parseElements(value.toString());
            boolean[] results2 = new boolean[list.size()];
            for (int i2 = 0; i2 < results2.length; i2++) {
                String stringValue2 = (String) list.get(i2);
                BooleanConverter booleanConverter2 = this.booleanConverter;
                if (class$java$lang$Boolean == null) {
                    cls = class$("java.lang.Boolean");
                    class$java$lang$Boolean = cls;
                } else {
                    cls = class$java$lang$Boolean;
                }
                Object result2 = booleanConverter2.convert(cls, stringValue2);
                results2[i2] = ((Boolean) result2).booleanValue();
            }
            return results2;
        } catch (Exception e2) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            throw new ConversionException(value.toString(), e2);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
