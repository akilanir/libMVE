package org.apache.commons.beanutils;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/LazyDynaClass.class */
public class LazyDynaClass extends BasicDynaClass implements MutableDynaClass {
    protected boolean restricted;
    protected boolean returnNull;
    static Class class$org$apache$commons$beanutils$LazyDynaBean;

    public LazyDynaClass() {
        this((String) null, (DynaProperty[]) null);
    }

    public LazyDynaClass(String name) {
        this(name, (DynaProperty[]) null);
    }

    public LazyDynaClass(String name, Class dynaBeanClass) {
        this(name, dynaBeanClass, null);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public LazyDynaClass(String name, DynaProperty[] properties) {
        Class cls;
        if (class$org$apache$commons$beanutils$LazyDynaBean == null) {
            cls = class$("org.apache.commons.beanutils.LazyDynaBean");
            class$org$apache$commons$beanutils$LazyDynaBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$LazyDynaBean;
        }
        this(name, cls, properties);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public LazyDynaClass(String name, Class dynaBeanClass, DynaProperty[] properties) {
        super(name, dynaBeanClass, properties);
        this.returnNull = false;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public boolean isRestricted() {
        return this.restricted;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void setRestricted(boolean restricted) {
        this.restricted = restricted;
    }

    public boolean isReturnNull() {
        return this.returnNull;
    }

    public void setReturnNull(boolean returnNull) {
        this.returnNull = returnNull;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name) {
        add(new DynaProperty(name));
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name, Class type) {
        if (type == null) {
            add(name);
        } else {
            add(new DynaProperty(name, type));
        }
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name, Class type, boolean readable, boolean writeable) {
        throw new UnsupportedOperationException("readable/writable properties not supported");
    }

    protected void add(DynaProperty property) {
        if (property.getName() == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        if (isRestricted()) {
            throw new IllegalStateException("DynaClass is currently restricted. No new properties can be added.");
        }
        if (this.propertiesMap.get(property.getName()) != null) {
            return;
        }
        DynaProperty[] oldProperties = getDynaProperties();
        DynaProperty[] newProperties = new DynaProperty[oldProperties.length + 1];
        System.arraycopy(oldProperties, 0, newProperties, 0, oldProperties.length);
        newProperties[oldProperties.length] = property;
        setProperties(newProperties);
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void remove(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        if (isRestricted()) {
            throw new IllegalStateException("DynaClass is currently restricted. No properties can be removed.");
        }
        if (this.propertiesMap.get(name) == null) {
            return;
        }
        DynaProperty[] oldProperties = getDynaProperties();
        DynaProperty[] newProperties = new DynaProperty[oldProperties.length - 1];
        int j = 0;
        for (int i = 0; i < oldProperties.length; i++) {
            if (!name.equals(oldProperties[i].getName())) {
                newProperties[j] = oldProperties[i];
                j++;
            }
        }
        setProperties(newProperties);
    }

    @Override // org.apache.commons.beanutils.BasicDynaClass, org.apache.commons.beanutils.DynaClass
    public DynaProperty getDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        DynaProperty dynaProperty = (DynaProperty) this.propertiesMap.get(name);
        if (dynaProperty == null && !isReturnNull() && !isRestricted()) {
            dynaProperty = new DynaProperty(name);
        }
        return dynaProperty;
    }

    public boolean isDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        return this.propertiesMap.get(name) != null;
    }
}
