package org.apache.commons.beanutils.converters;

import java.util.List;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/LongArrayConverter.class */
public final class LongArrayConverter extends AbstractArrayConverter {
    private static final long[] MODEL = new long[0];

    public LongArrayConverter() {
        this.defaultValue = null;
        this.useDefault = false;
    }

    public LongArrayConverter(Object defaultValue) {
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
        if (strings.getClass() == value.getClass()) {
            try {
                String[] values = (String[]) value;
                long[] results = new long[values.length];
                for (int i = 0; i < values.length; i++) {
                    results[i] = Long.parseLong(values[i]);
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
            long[] results2 = new long[list.size()];
            for (int i2 = 0; i2 < results2.length; i2++) {
                results2[i2] = Long.parseLong((String) list.get(i2));
            }
            return results2;
        } catch (Exception e2) {
            if (this.useDefault) {
                return this.defaultValue;
            }
            throw new ConversionException(value.toString(), e2);
        }
    }
}
