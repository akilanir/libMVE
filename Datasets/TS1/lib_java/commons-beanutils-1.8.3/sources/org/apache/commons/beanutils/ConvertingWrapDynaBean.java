package org.apache.commons.beanutils;

import java.lang.reflect.InvocationTargetException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/ConvertingWrapDynaBean.class */
public class ConvertingWrapDynaBean extends WrapDynaBean {
    public ConvertingWrapDynaBean(Object instance) {
        super(instance);
    }

    @Override // org.apache.commons.beanutils.WrapDynaBean, org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        try {
            BeanUtils.copyProperty(this.instance, name, value);
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error setting property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            IllegalArgumentException iae = new IllegalArgumentException(new StringBuffer().append("Error setting property '").append(name).append("', exception - ").append(t).toString());
            BeanUtils.initCause(iae, t);
            throw iae;
        }
    }
}
