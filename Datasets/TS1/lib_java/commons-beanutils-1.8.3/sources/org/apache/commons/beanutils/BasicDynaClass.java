package org.apache.commons.beanutils;

import java.io.Serializable;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.util.HashMap;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BasicDynaClass.class */
public class BasicDynaClass implements DynaClass, Serializable {
    protected transient Constructor constructor;
    protected static Class[] constructorTypes;
    protected Object[] constructorValues;
    protected Class dynaBeanClass;
    protected String name;
    protected DynaProperty[] properties;
    protected HashMap propertiesMap;
    static Class class$org$apache$commons$beanutils$BasicDynaBean;
    static Class class$org$apache$commons$beanutils$DynaClass;
    static Class class$org$apache$commons$beanutils$DynaBean;

    public BasicDynaClass() {
        this(null, null, null);
    }

    public BasicDynaClass(String name, Class dynaBeanClass) {
        this(name, dynaBeanClass, null);
    }

    public BasicDynaClass(String name, Class dynaBeanClass, DynaProperty[] properties) {
        Class cls;
        Class cls2;
        this.constructor = null;
        this.constructorValues = new Object[]{this};
        if (class$org$apache$commons$beanutils$BasicDynaBean == null) {
            cls = class$("org.apache.commons.beanutils.BasicDynaBean");
            class$org$apache$commons$beanutils$BasicDynaBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$BasicDynaBean;
        }
        this.dynaBeanClass = cls;
        this.name = getClass().getName();
        this.properties = new DynaProperty[0];
        this.propertiesMap = new HashMap();
        if (name != null) {
            this.name = name;
        }
        if (dynaBeanClass == null) {
            if (class$org$apache$commons$beanutils$BasicDynaBean == null) {
                cls2 = class$("org.apache.commons.beanutils.BasicDynaBean");
                class$org$apache$commons$beanutils$BasicDynaBean = cls2;
            } else {
                cls2 = class$org$apache$commons$beanutils$BasicDynaBean;
            }
            dynaBeanClass = cls2;
        }
        setDynaBeanClass(dynaBeanClass);
        if (properties != null) {
            setProperties(properties);
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        Class[] clsArr = new Class[1];
        if (class$org$apache$commons$beanutils$DynaClass == null) {
            cls = class$("org.apache.commons.beanutils.DynaClass");
            class$org$apache$commons$beanutils$DynaClass = cls;
        } else {
            cls = class$org$apache$commons$beanutils$DynaClass;
        }
        clsArr[0] = cls;
        constructorTypes = clsArr;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public String getName() {
        return this.name;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty getDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        return (DynaProperty) this.propertiesMap.get(name);
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty[] getDynaProperties() {
        return this.properties;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaBean newInstance() throws IllegalAccessException, InstantiationException {
        try {
            if (this.constructor == null) {
                setDynaBeanClass(this.dynaBeanClass);
            }
            return (DynaBean) this.constructor.newInstance(this.constructorValues);
        } catch (InvocationTargetException e) {
            throw new InstantiationException(e.getTargetException().getMessage());
        }
    }

    public Class getDynaBeanClass() {
        return this.dynaBeanClass;
    }

    protected void setDynaBeanClass(Class dynaBeanClass) {
        Class cls;
        if (dynaBeanClass.isInterface()) {
            throw new IllegalArgumentException(new StringBuffer().append("Class ").append(dynaBeanClass.getName()).append(" is an interface, not a class").toString());
        }
        if (class$org$apache$commons$beanutils$DynaBean == null) {
            cls = class$("org.apache.commons.beanutils.DynaBean");
            class$org$apache$commons$beanutils$DynaBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$DynaBean;
        }
        if (!cls.isAssignableFrom(dynaBeanClass)) {
            throw new IllegalArgumentException(new StringBuffer().append("Class ").append(dynaBeanClass.getName()).append(" does not implement DynaBean").toString());
        }
        try {
            this.constructor = dynaBeanClass.getConstructor(constructorTypes);
            this.dynaBeanClass = dynaBeanClass;
        } catch (NoSuchMethodException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Class ").append(dynaBeanClass.getName()).append(" does not have an appropriate constructor").toString());
        }
    }

    protected void setProperties(DynaProperty[] properties) {
        this.properties = properties;
        this.propertiesMap.clear();
        for (int i = 0; i < properties.length; i++) {
            this.propertiesMap.put(properties[i].getName(), properties[i]);
        }
    }
}
