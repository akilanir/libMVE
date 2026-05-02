package com.fasterxml.jackson.databind.util;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;

/* loaded from: jackson-databind-2.4.2.jar:com/fasterxml/jackson/databind/util/StdConverter.class */
public abstract class StdConverter<IN, OUT> implements Converter<IN, OUT> {
    @Override // com.fasterxml.jackson.databind.util.Converter
    public abstract OUT convert(IN in);

    @Override // com.fasterxml.jackson.databind.util.Converter
    public JavaType getInputType(TypeFactory typeFactory) {
        JavaType[] types = typeFactory.findTypeParameters(getClass(), Converter.class);
        if (types == null || types.length < 2) {
            throw new IllegalStateException("Can not find OUT type parameter for Converter of type " + getClass().getName());
        }
        return types[0];
    }

    @Override // com.fasterxml.jackson.databind.util.Converter
    public JavaType getOutputType(TypeFactory typeFactory) {
        JavaType[] types = typeFactory.findTypeParameters(getClass(), Converter.class);
        if (types == null || types.length < 2) {
            throw new IllegalStateException("Can not find OUT type parameter for Converter of type " + getClass().getName());
        }
        return types[1];
    }
}
