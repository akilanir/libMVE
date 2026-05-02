package org.apache.commons.beanutils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.AbstractMap;
import java.util.AbstractSet;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import org.apache.commons.collections.Transformer;
import org.apache.commons.collections.keyvalue.AbstractMapEntry;
import org.apache.commons.collections.list.UnmodifiableList;
import org.apache.commons.collections.set.UnmodifiableSet;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanMap.class */
public class BeanMap extends AbstractMap implements Cloneable {
    private transient Object bean;
    private transient HashMap readMethods = new HashMap();
    private transient HashMap writeMethods = new HashMap();
    private transient HashMap types = new HashMap();
    public static final Object[] NULL_ARGUMENTS = new Object[0];
    private static final Map typeTransformers = Collections.unmodifiableMap(createTypeTransformers());
    public static HashMap defaultTransformers = new HashMap() { // from class: org.apache.commons.beanutils.BeanMap.1
        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void clear() {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsKey(Object key) {
            return BeanMap.typeTransformers.containsKey(key);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean containsValue(Object value) {
            return BeanMap.typeTransformers.containsValue(value);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set entrySet() {
            return BeanMap.typeTransformers.entrySet();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object get(Object key) {
            return BeanMap.typeTransformers.get(key);
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public boolean isEmpty() {
            return false;
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Set keySet() {
            return BeanMap.typeTransformers.keySet();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object put(Object key, Object value) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public void putAll(Map m) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Object remove(Object key) {
            throw new UnsupportedOperationException();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public int size() {
            return BeanMap.typeTransformers.size();
        }

        @Override // java.util.HashMap, java.util.AbstractMap, java.util.Map
        public Collection values() {
            return BeanMap.typeTransformers.values();
        }
    };

    private static Map createTypeTransformers() {
        Map defaultTransformers2 = new HashMap();
        defaultTransformers2.put(Boolean.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.2
            public Object transform(Object input) {
                return Boolean.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Character.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.3
            public Object transform(Object input) {
                return new Character(input.toString().charAt(0));
            }
        });
        defaultTransformers2.put(Byte.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.4
            public Object transform(Object input) {
                return Byte.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Short.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.5
            public Object transform(Object input) {
                return Short.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Integer.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.6
            public Object transform(Object input) {
                return Integer.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Long.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.7
            public Object transform(Object input) {
                return Long.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Float.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.8
            public Object transform(Object input) {
                return Float.valueOf(input.toString());
            }
        });
        defaultTransformers2.put(Double.TYPE, new Transformer() { // from class: org.apache.commons.beanutils.BeanMap.9
            public Object transform(Object input) {
                return Double.valueOf(input.toString());
            }
        });
        return defaultTransformers2;
    }

    public BeanMap() {
    }

    public BeanMap(Object bean) {
        this.bean = bean;
        initialise();
    }

    @Override // java.util.AbstractMap
    public String toString() {
        return new StringBuffer().append("BeanMap<").append(String.valueOf(this.bean)).append(">").toString();
    }

    @Override // java.util.AbstractMap
    public Object clone() throws CloneNotSupportedException {
        BeanMap newMap = (BeanMap) super.clone();
        if (this.bean == null) {
            return newMap;
        }
        Class beanClass = this.bean.getClass();
        try {
            Object newBean = beanClass.newInstance();
            try {
                newMap.setBean(newBean);
                try {
                    for (Object key : this.readMethods.keySet()) {
                        if (getWriteMethod(key) != null) {
                            newMap.put(key, get(key));
                        }
                    }
                    return newMap;
                } catch (Exception exception) {
                    throw new CloneNotSupportedException(new StringBuffer().append("Unable to copy bean values to cloned bean map: ").append(exception).toString());
                }
            } catch (Exception exception2) {
                throw new CloneNotSupportedException(new StringBuffer().append("Unable to set bean in the cloned bean map: ").append(exception2).toString());
            }
        } catch (Exception e) {
            throw new CloneNotSupportedException(new StringBuffer().append("Unable to instantiate the underlying bean \"").append(beanClass.getName()).append("\": ").append(e).toString());
        }
    }

    public void putAllWriteable(BeanMap map) {
        for (Object key : map.readMethods.keySet()) {
            if (getWriteMethod(key) != null) {
                put(key, map.get(key));
            }
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public void clear() {
        if (this.bean == null) {
            return;
        }
        Class beanClass = null;
        try {
            beanClass = this.bean.getClass();
            this.bean = beanClass.newInstance();
        } catch (Exception e) {
            throw new UnsupportedOperationException(new StringBuffer().append("Could not create new instance of class: ").append(beanClass).toString());
        }
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsKey(Object name) {
        Method method = getReadMethod(name);
        return method != null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public boolean containsValue(Object value) {
        return super.containsValue(value);
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object get(Object name) {
        Method method;
        if (this.bean != null && (method = getReadMethod(name)) != null) {
            try {
                return method.invoke(this.bean, NULL_ARGUMENTS);
            } catch (IllegalAccessException e) {
                logWarn(e);
                return null;
            } catch (IllegalArgumentException e2) {
                logWarn(e2);
                return null;
            } catch (NullPointerException e3) {
                logWarn(e3);
                return null;
            } catch (InvocationTargetException e4) {
                logWarn(e4);
                return null;
            }
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Object put(Object name, Object value) throws IllegalArgumentException, ClassCastException {
        if (this.bean != null) {
            Object oldValue = get(name);
            Method method = getWriteMethod(name);
            if (method == null) {
                throw new IllegalArgumentException(new StringBuffer().append("The bean of type: ").append(this.bean.getClass().getName()).append(" has no property called: ").append(name).toString());
            }
            try {
                Object[] arguments = createWriteMethodArguments(method, value);
                method.invoke(this.bean, arguments);
                Object newValue = get(name);
                firePropertyChange(name, oldValue, newValue);
                return oldValue;
            } catch (IllegalAccessException e) {
                logInfo(e);
                throw new IllegalArgumentException(e.getMessage());
            } catch (InvocationTargetException e2) {
                logInfo(e2);
                throw new IllegalArgumentException(e2.getMessage());
            }
        }
        return null;
    }

    @Override // java.util.AbstractMap, java.util.Map
    public int size() {
        return this.readMethods.size();
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set keySet() {
        return UnmodifiableSet.decorate(this.readMethods.keySet());
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Set entrySet() {
        return UnmodifiableSet.decorate(new AbstractSet(this) { // from class: org.apache.commons.beanutils.BeanMap.10
            private final BeanMap this$0;

            {
                this.this$0 = this;
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.lang.Iterable, java.util.Set
            public Iterator iterator() {
                return this.this$0.entryIterator();
            }

            @Override // java.util.AbstractCollection, java.util.Collection, java.util.Set
            public int size() {
                return this.this$0.readMethods.size();
            }
        });
    }

    @Override // java.util.AbstractMap, java.util.Map
    public Collection values() {
        ArrayList answer = new ArrayList(this.readMethods.size());
        Iterator iter = valueIterator();
        while (iter.hasNext()) {
            answer.add(iter.next());
        }
        return UnmodifiableList.decorate(answer);
    }

    public Class getType(String name) {
        return (Class) this.types.get(name);
    }

    public Iterator keyIterator() {
        return this.readMethods.keySet().iterator();
    }

    public Iterator valueIterator() {
        Iterator iter = keyIterator();
        return new Iterator(this, iter) { // from class: org.apache.commons.beanutils.BeanMap.11
            private final Iterator val$iter;
            private final BeanMap this$0;

            {
                this.this$0 = this;
                this.val$iter = iter;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.val$iter.hasNext();
            }

            @Override // java.util.Iterator
            public Object next() {
                Object key = this.val$iter.next();
                return this.this$0.get(key);
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("remove() not supported for BeanMap");
            }
        };
    }

    public Iterator entryIterator() {
        Iterator iter = keyIterator();
        return new Iterator(this, iter) { // from class: org.apache.commons.beanutils.BeanMap.12
            private final Iterator val$iter;
            private final BeanMap this$0;

            {
                this.this$0 = this;
                this.val$iter = iter;
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.val$iter.hasNext();
            }

            @Override // java.util.Iterator
            public Object next() {
                Object key = this.val$iter.next();
                Object value = this.this$0.get(key);
                return new Entry(this.this$0, key, value);
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("remove() not supported for BeanMap");
            }
        };
    }

    public Object getBean() {
        return this.bean;
    }

    public void setBean(Object newBean) {
        this.bean = newBean;
        reinitialise();
    }

    public Method getReadMethod(String name) {
        return (Method) this.readMethods.get(name);
    }

    public Method getWriteMethod(String name) {
        return (Method) this.writeMethods.get(name);
    }

    protected Method getReadMethod(Object name) {
        return (Method) this.readMethods.get(name);
    }

    protected Method getWriteMethod(Object name) {
        return (Method) this.writeMethods.get(name);
    }

    protected void reinitialise() {
        this.readMethods.clear();
        this.writeMethods.clear();
        this.types.clear();
        initialise();
    }

    private void initialise() {
        if (getBean() == null) {
            return;
        }
        Class beanClass = getBean().getClass();
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(beanClass);
            PropertyDescriptor[] propertyDescriptors = beanInfo.getPropertyDescriptors();
            if (propertyDescriptors != null) {
                for (PropertyDescriptor propertyDescriptor : propertyDescriptors) {
                    if (propertyDescriptor != null) {
                        String name = propertyDescriptor.getName();
                        Method readMethod = propertyDescriptor.getReadMethod();
                        Method writeMethod = propertyDescriptor.getWriteMethod();
                        Class aType = propertyDescriptor.getPropertyType();
                        if (readMethod != null) {
                            this.readMethods.put(name, readMethod);
                        }
                        if (writeMethod != null) {
                            this.writeMethods.put(name, writeMethod);
                        }
                        this.types.put(name, aType);
                    }
                }
            }
        } catch (IntrospectionException e) {
            logWarn(e);
        }
    }

    protected void firePropertyChange(Object key, Object oldValue, Object newValue) {
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanMap$Entry.class */
    protected static class Entry extends AbstractMapEntry {
        private BeanMap owner;

        protected Entry(BeanMap owner, Object key, Object value) {
            super(key, value);
            this.owner = owner;
        }

        public Object setValue(Object value) {
            Object key = getKey();
            Object oldValue = this.owner.get(key);
            this.owner.put(key, value);
            Object newValue = this.owner.get(key);
            super.setValue(newValue);
            return oldValue;
        }
    }

    protected Object[] createWriteMethodArguments(Method method, Object value) throws IllegalAccessException, ClassCastException {
        if (value != null) {
            try {
                Class[] types = method.getParameterTypes();
                if (types != null && types.length > 0) {
                    Class paramType = types[0];
                    if (!paramType.isAssignableFrom(value.getClass())) {
                        value = convertType(paramType, value);
                    }
                }
            } catch (InstantiationException e) {
                logInfo(e);
                throw new IllegalArgumentException(e.getMessage());
            } catch (InvocationTargetException e2) {
                logInfo(e2);
                throw new IllegalArgumentException(e2.getMessage());
            }
        }
        Object[] answer = {value};
        return answer;
    }

    protected Object convertType(Class newType, Object value) throws InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Class[] types = {value.getClass()};
        try {
            Constructor constructor = newType.getConstructor(types);
            Object[] arguments = {value};
            return constructor.newInstance(arguments);
        } catch (NoSuchMethodException e) {
            Transformer transformer = getTypeTransformer(newType);
            if (transformer != null) {
                return transformer.transform(value);
            }
            return value;
        }
    }

    protected Transformer getTypeTransformer(Class aType) {
        return (Transformer) typeTransformers.get(aType);
    }

    protected void logInfo(Exception ex) {
        System.out.println(new StringBuffer().append("INFO: Exception: ").append(ex).toString());
    }

    protected void logWarn(Exception ex) {
        System.out.println(new StringBuffer().append("WARN: Exception: ").append(ex).toString());
        ex.printStackTrace();
    }
}
