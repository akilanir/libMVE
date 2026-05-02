package org.apache.commons.beanutils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/DynaBeanMapDecorator.class */
public class DynaBeanMapDecorator implements Map {
    private DynaBean dynaBean;
    private boolean readOnly;
    private transient Set keySet;

    public DynaBeanMapDecorator(DynaBean dynaBean) {
        this(dynaBean, true);
    }

    public DynaBeanMapDecorator(DynaBean dynaBean, boolean readOnly) {
        if (dynaBean == null) {
            throw new IllegalArgumentException("DynaBean is null");
        }
        this.dynaBean = dynaBean;
        this.readOnly = readOnly;
    }

    public boolean isReadOnly() {
        return this.readOnly;
    }

    @Override // java.util.Map
    public void clear() {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public boolean containsKey(Object key) {
        DynaClass dynaClass = getDynaBean().getDynaClass();
        DynaProperty dynaProperty = dynaClass.getDynaProperty(toString(key));
        return dynaProperty != null;
    }

    @Override // java.util.Map
    public boolean containsValue(Object value) {
        DynaProperty[] properties = getDynaProperties();
        for (DynaProperty dynaProperty : properties) {
            String key = dynaProperty.getName();
            Object prop = getDynaBean().get(key);
            if (value == null) {
                if (prop == null) {
                    return true;
                }
            } else if (value.equals(prop)) {
                return true;
            }
        }
        return false;
    }

    @Override // java.util.Map
    public Set entrySet() {
        DynaProperty[] properties = getDynaProperties();
        Set set = new HashSet(properties.length);
        for (DynaProperty dynaProperty : properties) {
            String key = dynaProperty.getName();
            Object value = getDynaBean().get(key);
            set.add(new MapEntry(key, value));
        }
        return Collections.unmodifiableSet(set);
    }

    @Override // java.util.Map
    public Object get(Object key) {
        return getDynaBean().get(toString(key));
    }

    @Override // java.util.Map
    public boolean isEmpty() {
        return getDynaProperties().length == 0;
    }

    @Override // java.util.Map
    public Set keySet() {
        if (this.keySet != null) {
            return this.keySet;
        }
        DynaProperty[] properties = getDynaProperties();
        Set set = new HashSet(properties.length);
        for (DynaProperty dynaProperty : properties) {
            set.add(dynaProperty.getName());
        }
        Set set2 = Collections.unmodifiableSet(set);
        DynaClass dynaClass = getDynaBean().getDynaClass();
        if (!(dynaClass instanceof MutableDynaClass)) {
            this.keySet = set2;
        }
        return set2;
    }

    @Override // java.util.Map
    public Object put(Object key, Object value) {
        if (isReadOnly()) {
            throw new UnsupportedOperationException("Map is read only");
        }
        String property = toString(key);
        Object previous = getDynaBean().get(property);
        getDynaBean().set(property, value);
        return previous;
    }

    @Override // java.util.Map
    public void putAll(Map map) {
        if (isReadOnly()) {
            throw new UnsupportedOperationException("Map is read only");
        }
        for (Object key : map.keySet()) {
            put(key, map.get(key));
        }
    }

    @Override // java.util.Map
    public Object remove(Object key) {
        throw new UnsupportedOperationException();
    }

    @Override // java.util.Map
    public int size() {
        return getDynaProperties().length;
    }

    @Override // java.util.Map
    public Collection values() {
        DynaProperty[] properties = getDynaProperties();
        List values = new ArrayList(properties.length);
        for (DynaProperty dynaProperty : properties) {
            String key = dynaProperty.getName();
            Object value = getDynaBean().get(key);
            values.add(value);
        }
        return Collections.unmodifiableList(values);
    }

    public DynaBean getDynaBean() {
        return this.dynaBean;
    }

    private DynaProperty[] getDynaProperties() {
        return getDynaBean().getDynaClass().getDynaProperties();
    }

    private String toString(Object obj) {
        if (obj == null) {
            return null;
        }
        return obj.toString();
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/DynaBeanMapDecorator$MapEntry.class */
    private static class MapEntry implements Map.Entry {
        private Object key;
        private Object value;

        MapEntry(Object key, Object value) {
            this.key = key;
            this.value = value;
        }

        @Override // java.util.Map.Entry
        public boolean equals(Object o) {
            if (!(o instanceof Map.Entry)) {
                return false;
            }
            Map.Entry e = (Map.Entry) o;
            return this.key.equals(e.getKey()) && (this.value != null ? this.value.equals(e.getValue()) : e.getValue() == null);
        }

        @Override // java.util.Map.Entry
        public int hashCode() {
            return this.key.hashCode() + (this.value == null ? 0 : this.value.hashCode());
        }

        @Override // java.util.Map.Entry
        public Object getKey() {
            return this.key;
        }

        @Override // java.util.Map.Entry
        public Object getValue() {
            return this.value;
        }

        @Override // java.util.Map.Entry
        public Object setValue(Object value) {
            throw new UnsupportedOperationException();
        }
    }
}
