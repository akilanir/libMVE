package org.apache.commons.beanutils.converters;

import org.apache.commons.beanutils.Converter;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/converters/ConverterFacade.class */
public final class ConverterFacade implements Converter {
    private final Converter converter;

    public ConverterFacade(Converter converter) {
        if (converter == null) {
            throw new IllegalArgumentException("Converter is missing");
        }
        this.converter = converter;
    }

    @Override // org.apache.commons.beanutils.Converter
    public Object convert(Class type, Object value) {
        return this.converter.convert(type, value);
    }

    public String toString() {
        return new StringBuffer().append("ConverterFacade[").append(this.converter.toString()).append("]").toString();
    }
}
