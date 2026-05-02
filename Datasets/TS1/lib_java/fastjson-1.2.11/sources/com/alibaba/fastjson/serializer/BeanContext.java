package com.alibaba.fastjson.serializer;

import com.alibaba.fastjson.util.FieldInfo;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;

/* loaded from: fastjson-1.2.11.jar:com/alibaba/fastjson/serializer/BeanContext.class */
public final class BeanContext {
    private final Class<?> beanClass;
    private final FieldInfo fieldInfo;

    BeanContext(Class<?> beanClass, FieldInfo fieldInfo) {
        this.beanClass = beanClass;
        this.fieldInfo = fieldInfo;
    }

    public Class<?> getBeanClass() {
        return this.beanClass;
    }

    public Method getMethod() {
        return this.fieldInfo.method;
    }

    public Field getField() {
        return this.fieldInfo.field;
    }

    public String getName() {
        return this.fieldInfo.name;
    }

    public String getLabel() {
        return this.fieldInfo.label;
    }

    public Class<?> getFieldClass() {
        return this.fieldInfo.fieldClass;
    }

    public Type getFieldType() {
        return this.fieldInfo.fieldType;
    }

    public int getFeatures() {
        return this.fieldInfo.serialzeFeatures;
    }

    public <T extends Annotation> T getAnnation(Class<T> cls) {
        return (T) this.fieldInfo.getAnnation(cls);
    }
}
