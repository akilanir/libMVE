package org.apache.commons.beanutils;

import java.util.Map;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/LazyDynaMap.class */
public class LazyDynaMap extends LazyDynaBean implements MutableDynaClass {
    protected String name;
    protected boolean restricted;
    protected boolean returnNull;

    public LazyDynaMap() {
        this((String) null, (Map) null);
    }

    public LazyDynaMap(String name) {
        this(name, (Map) null);
    }

    public LazyDynaMap(Map values) {
        this((String) null, values);
    }

    public LazyDynaMap(String name, Map values) {
        this.returnNull = false;
        this.name = name == null ? "LazyDynaMap" : name;
        this.values = values == null ? newMap() : values;
        this.dynaClass = this;
    }

    public LazyDynaMap(DynaProperty[] properties) {
        this((String) null, properties);
    }

    public LazyDynaMap(String name, DynaProperty[] properties) {
        this(name, (Map) null);
        if (properties != null) {
            for (DynaProperty dynaProperty : properties) {
                add(dynaProperty);
            }
        }
    }

    public LazyDynaMap(DynaClass dynaClass) {
        this(dynaClass.getName(), dynaClass.getDynaProperties());
    }

    public void setMap(Map values) {
        this.values = values;
    }

    @Override // org.apache.commons.beanutils.LazyDynaBean
    public Map getMap() {
        return this.values;
    }

    @Override // org.apache.commons.beanutils.LazyDynaBean, org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        if (isRestricted() && !this.values.containsKey(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid property name '").append(name).append("' (DynaClass is restricted)").toString());
        }
        this.values.put(name, value);
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public String getName() {
        return this.name;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty getDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        if (!this.values.containsKey(name) && isReturnNull()) {
            return null;
        }
        Object value = this.values.get(name);
        if (value == null) {
            return new DynaProperty(name);
        }
        return new DynaProperty(name, value.getClass());
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaProperty[] getDynaProperties() {
        int i = 0;
        DynaProperty[] properties = new DynaProperty[this.values.size()];
        for (String name : this.values.keySet()) {
            Object value = this.values.get(name);
            int i2 = i;
            i++;
            properties[i2] = new DynaProperty(name, value == null ? null : value.getClass());
        }
        return properties;
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public DynaBean newInstance() {
        Map newMap;
        try {
            newMap = (Map) getMap().getClass().newInstance();
        } catch (Exception e) {
            newMap = newMap();
        }
        LazyDynaMap lazyMap = new LazyDynaMap(newMap);
        DynaProperty[] properties = getDynaProperties();
        if (properties != null) {
            for (DynaProperty dynaProperty : properties) {
                lazyMap.add(dynaProperty);
            }
        }
        return lazyMap;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public boolean isRestricted() {
        return this.restricted;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void setRestricted(boolean restricted) {
        this.restricted = restricted;
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name) {
        add(name, null);
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name, Class type) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        if (isRestricted()) {
            throw new IllegalStateException("DynaClass is currently restricted. No new properties can be added.");
        }
        Object value = this.values.get(name);
        if (value == null) {
            this.values.put(name, type == null ? null : createProperty(name, type));
        }
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void add(String name, Class type, boolean readable, boolean writeable) {
        throw new UnsupportedOperationException("readable/writable properties not supported");
    }

    protected void add(DynaProperty property) {
        add(property.getName(), property.getType());
    }

    @Override // org.apache.commons.beanutils.MutableDynaClass
    public void remove(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        if (isRestricted()) {
            throw new IllegalStateException("DynaClass is currently restricted. No properties can be removed.");
        }
        if (this.values.containsKey(name)) {
            this.values.remove(name);
        }
    }

    public boolean isReturnNull() {
        return this.returnNull;
    }

    public void setReturnNull(boolean returnNull) {
        this.returnNull = returnNull;
    }

    @Override // org.apache.commons.beanutils.LazyDynaBean
    protected boolean isDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("Property name is missing.");
        }
        return this.values.containsKey(name);
    }
}
