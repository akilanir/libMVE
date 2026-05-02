package com.alibaba.fastjson;

import com.alibaba.fastjson.util.ParameterizedTypeImpl;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/TypeReference.class */
public class TypeReference<T> {
    protected final Type type;

    protected TypeReference() {
        Type superClass = getClass().getGenericSuperclass();
        this.type = ((ParameterizedType) superClass).getActualTypeArguments()[0];
    }

    protected TypeReference(Type... actualTypeArguments) {
        Type superClass = getClass().getGenericSuperclass();
        ParameterizedType argType = (ParameterizedType) ((ParameterizedType) superClass).getActualTypeArguments()[0];
        Type rawType = argType.getRawType();
        Type[] argTypes = argType.getActualTypeArguments();
        int actualIndex = 0;
        for (int i = 0; i < argTypes.length; i++) {
            if (argTypes[i] instanceof TypeVariable) {
                int i2 = actualIndex;
                actualIndex++;
                argTypes[i] = actualTypeArguments[i2];
                if (actualIndex >= actualTypeArguments.length) {
                    break;
                }
            }
        }
        this.type = new ParameterizedTypeImpl(argTypes, getClass(), rawType);
    }

    public Type getType() {
        return this.type;
    }
}
