package org.apache.commons.beanutils.converters;

import java.util.List;
import org.apache.commons.beanutils.ConversionException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ByteArrayConverter.class */
public final class ByteArrayConverter extends AbstractArrayConverter {
    private static final byte[] MODEL = new byte[0];

    public ByteArrayConverter() {
        this.defaultValue = null;
        this.useDefault = false;
    }

    public ByteArrayConverter(Object defaultValue) {
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
                byte[] results = new byte[values.length];
                for (int i = 0; i < values.length; i++) {
                    results[i] = Byte.parseByte(values[i]);
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
            byte[] results2 = new byte[list.size()];
            for (int i2 = 0; i2 < results2.length; i2++) {
                results2[i2] = Byte.parseByte((String) list.get(i2));
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
