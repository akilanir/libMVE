package org.msgpack.template.builder.beans;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/BeanInfo.class */
public interface BeanInfo {
    PropertyDescriptor[] getPropertyDescriptors();

    MethodDescriptor[] getMethodDescriptors();

    EventSetDescriptor[] getEventSetDescriptors();

    BeanInfo[] getAdditionalBeanInfo();

    BeanDescriptor getBeanDescriptor();

    int getDefaultPropertyIndex();

    int getDefaultEventIndex();
}
