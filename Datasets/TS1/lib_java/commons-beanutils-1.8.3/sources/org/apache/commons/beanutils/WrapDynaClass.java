package org.apache.commons.beanutils;

import java.beans.PropertyDescriptor;
import java.lang.ref.Reference;
import java.lang.ref.SoftReference;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.WeakHashMap;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/WrapDynaClass.class */
public class WrapDynaClass implements DynaClass {
    private String beanClassName;
    private Reference beanClassRef;
    protected Class beanClass = null;
    protected PropertyDescriptor[] descriptors = null;
    protected HashMap descriptorsMap = new HashMap();
    protected DynaProperty[] properties = null;
    protected HashMap propertiesMap = new HashMap();
    private static final ContextClassLoaderLocal CLASSLOADER_CACHE = new ContextClassLoaderLocal() { // from class: org.apache.commons.beanutils.WrapDynaClass.1
        @Override // org.apache.commons.beanutils.ContextClassLoaderLocal
        protected Object initialValue() {
            return new WeakHashMap();
        }
    };
    protected static HashMap dynaClasses = new HashMap() { // from class: org.apache.commons.beanutils.WrapDynaClass.2
        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            WrapDynaClass.getDynaClassesMap().clear();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object key) {
            return WrapDynaClass.getDynaClassesMap().containsKey(key);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object value) {
            return WrapDynaClass.getDynaClassesMap().containsValue(value);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set entrySet() {
            return WrapDynaClass.getDynaClassesMap().entrySet();
        }

        @Override // java.util.AbstractMap, java.util.Map
        public boolean equals(Object o) {
            return WrapDynaClass.getDynaClassesMap().equals(o);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object get(Object key) {
            return WrapDynaClass.getDynaClassesMap().get(key);
        }

        @Override // java.util.AbstractMap, java.util.Map
        public int hashCode() {
            return WrapDynaClass.getDynaClassesMap().hashCode();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return WrapDynaClass.getDynaClassesMap().isEmpty();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set keySet() {
            return WrapDynaClass.getDynaClassesMap().keySet();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object put(Object key, Object value) {
            return WrapDynaClass.getDynaClassesMap().put(key, value);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void putAll(Map m) {
            WrapDynaClass.getDynaClassesMap().putAll(m);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object remove(Object key) {
            return WrapDynaClass.getDynaClassesMap().remove(key);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return WrapDynaClass.getDynaClassesMap().size();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Collection values() {
            return WrapDynaClass.getDynaClassesMap().values();
        }
    };
    static Class class$java$util$Map;

    private WrapDynaClass(Class beanClass) {
        this.beanClassName = null;
        this.beanClassRef = null;
        this.beanClassRef = new SoftReference(beanClass);
        this.beanClassName = beanClass.getName();
        introspect();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Map getDynaClassesMap() {
        return (Map) CLASSLOADER_CACHE.get();
    }

    protected Class getBeanClass() {
        return (Class) this.beanClassRef.get();
    }

    @Override // org.apache.commons.beanutils.DynaClass
    public String getName() {
        return this.beanClassName;
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
        return new WrapDynaBean(getBeanClass().newInstance());
    }

    public PropertyDescriptor getPropertyDescriptor(String name) {
        return (PropertyDescriptor) this.descriptorsMap.get(name);
    }

    public static void clear() {
        getDynaClassesMap().clear();
    }

    public static WrapDynaClass createDynaClass(Class beanClass) {
        WrapDynaClass dynaClass = (WrapDynaClass) getDynaClassesMap().get(beanClass);
        if (dynaClass == null) {
            dynaClass = new WrapDynaClass(beanClass);
            getDynaClassesMap().put(beanClass, dynaClass);
        }
        return dynaClass;
    }

    protected void introspect() {
        Class cls;
        Class beanClass = getBeanClass();
        PropertyDescriptor[] regulars = PropertyUtils.getPropertyDescriptors(beanClass);
        if (regulars == null) {
            regulars = new PropertyDescriptor[0];
        }
        Map mappeds = PropertyUtils.getMappedPropertyDescriptors(beanClass);
        if (mappeds == null) {
            mappeds = new HashMap();
        }
        this.properties = new DynaProperty[regulars.length + mappeds.size()];
        for (int i = 0; i < regulars.length; i++) {
            this.descriptorsMap.put(regulars[i].getName(), regulars[i]);
            this.properties[i] = new DynaProperty(regulars[i].getName(), regulars[i].getPropertyType());
            this.propertiesMap.put(this.properties[i].getName(), this.properties[i]);
        }
        int j = regulars.length;
        for (String name : mappeds.keySet()) {
            PropertyDescriptor descriptor = (PropertyDescriptor) mappeds.get(name);
            DynaProperty[] dynaPropertyArr = this.properties;
            int i2 = j;
            String name2 = descriptor.getName();
            if (class$java$util$Map == null) {
                cls = class$("java.util.Map");
                class$java$util$Map = cls;
            } else {
                cls = class$java$util$Map;
            }
            dynaPropertyArr[i2] = new DynaProperty(name2, cls);
            this.propertiesMap.put(this.properties[j].getName(), this.properties[j]);
            j++;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
