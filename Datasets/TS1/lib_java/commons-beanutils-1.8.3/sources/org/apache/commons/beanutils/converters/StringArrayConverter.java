package org.apache.commons.beanutils.converters;

import java.util.List;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/StringArrayConverter.class */
public final class StringArrayConverter extends AbstractArrayConverter {
    private static final String[] MODEL = new String[0];
    private static final int[] INT_MODEL = new int[0];

    public StringArrayConverter() {
        this.defaultValue = null;
        this.useDefault = false;
    }

    public StringArrayConverter(Object defaultValue) {
        this.defaultValue = defaultValue;
        this.useDefault = true;
    }

    @Override // org.apache.commons.beanutils.converters.AbstractArrayConverter, org.apache.commons.beanutils.Converter
    public Object convert(Class type, Object value) {
        if (value == null) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            throw new ConversionException("No value specified");
        }
        if (MODEL.getClass() == value.getClass()) {
            return value;
        }
        if (INT_MODEL.getClass() == value.getClass()) {
            int[] values = (int[]) value;
            String[] results = new String[values.length];
            for (int i = 0; i < values.length; i++) {
                results[i] = Integer.toString(values[i]);
            }
            return results;
        }
        try {
            List list = parseElements(value.toString());
            String[] results2 = new String[list.size()];
            for (int i2 = 0; i2 < results2.length; i2++) {
                results2[i2] = (String) list.get(i2);
            }
            return results2;
        } catch (Exception e) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            throw new ConversionException(value.toString(), e);
        }
    }
}
