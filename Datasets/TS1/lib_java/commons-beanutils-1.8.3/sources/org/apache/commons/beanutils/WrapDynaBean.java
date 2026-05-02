package org.apache.commons.beanutils;

import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/WrapDynaBean.class */
public class WrapDynaBean implements DynaBean, Serializable {
    protected transient WrapDynaClass dynaClass;
    protected Object instance;

    public WrapDynaBean(Object instance) {
        this.dynaClass = null;
        this.instance = null;
        this.instance = instance;
        this.dynaClass = (WrapDynaClass) getDynaClass();
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public boolean contains(String name, String key) {
        throw new UnsupportedOperationException("WrapDynaBean does not support contains()");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name) {
        try {
            Object value = PropertyUtils.getSimpleProperty(this.instance, name);
            return value;
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error reading property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error reading property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, int index) {
        try {
            Object value = PropertyUtils.getIndexedProperty(this.instance, name, index);
            return value;
        } catch (IndexOutOfBoundsException e) {
            throw e;
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error reading indexed property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error reading indexed property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, String key) {
        try {
            Object value = PropertyUtils.getMappedProperty(this.instance, name, key);
            return value;
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error reading mapped property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error reading mapped property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public DynaClass getDynaClass() {
        if (this.dynaClass == null) {
            this.dynaClass = WrapDynaClass.createDynaClass(this.instance.getClass());
        }
        return this.dynaClass;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void remove(String name, String key) {
        throw new UnsupportedOperationException("WrapDynaBean does not support remove()");
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        try {
            PropertyUtils.setSimpleProperty(this.instance, name, value);
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error setting property '").append(name).append("' nested exception -").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error setting property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, int index, Object value) {
        try {
            PropertyUtils.setIndexedProperty(this.instance, name, index, value);
        } catch (IndexOutOfBoundsException e) {
            throw e;
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error setting indexed property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error setting indexed property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, String key, Object value) {
        try {
            PropertyUtils.setMappedProperty(this.instance, name, key, value);
        } catch (InvocationTargetException ite) {
            Throwable cause = ite.getTargetException();
            throw new IllegalArgumentException(new StringBuffer().append("Error setting mapped property '").append(name).append("' nested exception - ").append(cause).toString());
        } catch (Throwable t) {
            throw new IllegalArgumentException(new StringBuffer().append("Error setting mapped property '").append(name).append("', exception - ").append(t).toString());
        }
    }

    public Object getInstance() {
        return this.instance;
    }

    protected DynaProperty getDynaProperty(String name) {
        DynaProperty descriptor = getDynaClass().getDynaProperty(name);
        if (descriptor == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid property name '").append(name).append("'").toString());
        }
        return descriptor;
    }
}
