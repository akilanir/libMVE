package org.msgpack.template.builder.beans;

import org.msgpack.util.TemplatePrecompiler;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/BeanDescriptor.class */
public class BeanDescriptor extends FeatureDescriptor {
    private Class<?> beanClass;
    private Class<?> customizerClass;

    public BeanDescriptor(Class<?> beanClass, Class<?> customizerClass) {
        if (beanClass == null) {
            throw new NullPointerException();
        }
        setName(getShortClassName(beanClass));
        this.beanClass = beanClass;
        this.customizerClass = customizerClass;
    }

    public BeanDescriptor(Class<?> beanClass) {
        this(beanClass, null);
    }

    public Class<?> getCustomizerClass() {
        return this.customizerClass;
    }

    public Class<?> getBeanClass() {
        return this.beanClass;
    }

    private String getShortClassName(Class<?> leguminaClass) {
        if (leguminaClass == null) {
            return null;
        }
        String beanClassName = leguminaClass.getName();
        int lastIndex = beanClassName.lastIndexOf(TemplatePrecompiler.DEFAULT_DEST);
        return lastIndex == -1 ? beanClassName : beanClassName.substring(lastIndex + 1);
    }
}
