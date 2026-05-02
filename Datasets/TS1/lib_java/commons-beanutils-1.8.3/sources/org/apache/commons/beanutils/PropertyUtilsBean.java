package org.apache.commons.beanutils;

import java.beans.BeanInfo;
import java.beans.IndexedPropertyDescriptor;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.beanutils.expression.DefaultResolver;
import org.apache.commons.beanutils.expression.Resolver;
import org.apache.commons.collections.FastHashMap;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/PropertyUtilsBean.class */
public class PropertyUtilsBean {
    private Resolver resolver = new DefaultResolver();
    private WeakFastHashMap descriptorsCache;
    private WeakFastHashMap mappedDescriptorsCache;
    private static final Class[] EMPTY_CLASS_PARAMETERS = new Class[0];
    private static final Class[] LIST_CLASS_PARAMETER;
    private static final Object[] EMPTY_OBJECT_ARRAY;
    private Log log;
    static Class class$java$util$List;
    static Class class$org$apache$commons$beanutils$PropertyUtils;

    protected static PropertyUtilsBean getInstance() {
        return BeanUtilsBean.getInstance().getPropertyUtils();
    }

    static {
        Class cls;
        Class[] clsArr = new Class[1];
        if (class$java$util$List == null) {
            cls = class$("java.util.List");
            class$java$util$List = cls;
        } else {
            cls = class$java$util$List;
        }
        clsArr[0] = cls;
        LIST_CLASS_PARAMETER = clsArr;
        EMPTY_OBJECT_ARRAY = new Object[0];
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public PropertyUtilsBean() {
        Class cls;
        this.descriptorsCache = null;
        this.mappedDescriptorsCache = null;
        if (class$org$apache$commons$beanutils$PropertyUtils == null) {
            cls = class$("org.apache.commons.beanutils.PropertyUtils");
            class$org$apache$commons$beanutils$PropertyUtils = cls;
        } else {
            cls = class$org$apache$commons$beanutils$PropertyUtils;
        }
        this.log = LogFactory.getLog(cls);
        this.descriptorsCache = new WeakFastHashMap();
        this.descriptorsCache.setFast(true);
        this.mappedDescriptorsCache = new WeakFastHashMap();
        this.mappedDescriptorsCache.setFast(true);
    }

    public Resolver getResolver() {
        return this.resolver;
    }

    public void setResolver(Resolver resolver) {
        if (resolver == null) {
            this.resolver = new DefaultResolver();
        } else {
            this.resolver = resolver;
        }
    }

    public void clearDescriptors() {
        this.descriptorsCache.clear();
        this.mappedDescriptorsCache.clear();
        Introspector.flushCaches();
    }

    public void copyProperties(Object dest, Object orig) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (dest == null) {
            throw new IllegalArgumentException("No destination bean specified");
        }
        if (orig == null) {
            throw new IllegalArgumentException("No origin bean specified");
        }
        if (orig instanceof DynaBean) {
            for (DynaProperty dynaProperty : ((DynaBean) orig).getDynaClass().getDynaProperties()) {
                String name = dynaProperty.getName();
                if (isReadable(orig, name) && isWriteable(dest, name)) {
                    try {
                        Object value = ((DynaBean) orig).get(name);
                        if (dest instanceof DynaBean) {
                            ((DynaBean) dest).set(name, value);
                        } else {
                            setSimpleProperty(dest, name, value);
                        }
                    } catch (NoSuchMethodException e) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug(new StringBuffer().append("Error writing to '").append(name).append("' on class '").append(dest.getClass()).append("'").toString(), e);
                        }
                    }
                }
            }
            return;
        }
        if (orig instanceof Map) {
            for (Map.Entry entry : ((Map) orig).entrySet()) {
                String name2 = (String) entry.getKey();
                if (isWriteable(dest, name2)) {
                    try {
                        if (dest instanceof DynaBean) {
                            ((DynaBean) dest).set(name2, entry.getValue());
                        } else {
                            setSimpleProperty(dest, name2, entry.getValue());
                        }
                    } catch (NoSuchMethodException e2) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug(new StringBuffer().append("Error writing to '").append(name2).append("' on class '").append(dest.getClass()).append("'").toString(), e2);
                        }
                    }
                }
            }
            return;
        }
        PropertyDescriptor[] origDescriptors = getPropertyDescriptors(orig);
        for (PropertyDescriptor propertyDescriptor : origDescriptors) {
            String name3 = propertyDescriptor.getName();
            if (isReadable(orig, name3) && isWriteable(dest, name3)) {
                try {
                    Object value2 = getSimpleProperty(orig, name3);
                    if (dest instanceof DynaBean) {
                        ((DynaBean) dest).set(name3, value2);
                    } else {
                        setSimpleProperty(dest, name3, value2);
                    }
                } catch (NoSuchMethodException e3) {
                    if (this.log.isDebugEnabled()) {
                        this.log.debug(new StringBuffer().append("Error writing to '").append(name3).append("' on class '").append(dest.getClass()).append("'").toString(), e3);
                    }
                }
            }
        }
    }

    public Map describe(Object bean) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        Map description = new HashMap();
        if (bean instanceof DynaBean) {
            for (DynaProperty dynaProperty : ((DynaBean) bean).getDynaClass().getDynaProperties()) {
                String name = dynaProperty.getName();
                description.put(name, getProperty(bean, name));
            }
        } else {
            PropertyDescriptor[] descriptors = getPropertyDescriptors(bean);
            for (int i = 0; i < descriptors.length; i++) {
                String name2 = descriptors[i].getName();
                if (descriptors[i].getReadMethod() != null) {
                    description.put(name2, getProperty(bean, name2));
                }
            }
        }
        return description;
    }

    public Object getIndexedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        try {
            int index = this.resolver.getIndex(name);
            if (index < 0) {
                throw new IllegalArgumentException(new StringBuffer().append("Invalid indexed property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            return getIndexedProperty(bean, this.resolver.getProperty(name), index);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid indexed property '").append(name).append("' on bean class '").append(bean.getClass()).append("' ").append(e.getMessage()).toString());
        }
    }

    public Object getIndexedProperty(Object bean, String name, int index) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Method readMethod;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null || name.length() == 0) {
            if (bean.getClass().isArray()) {
                return Array.get(bean, index);
            }
            if (bean instanceof List) {
                return ((List) bean).get(index);
            }
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            DynaProperty descriptor = ((DynaBean) bean).getDynaClass().getDynaProperty(name);
            if (descriptor == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            return ((DynaBean) bean).get(name, index);
        }
        IndexedPropertyDescriptor propertyDescriptor = getPropertyDescriptor(bean, name);
        if (propertyDescriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if ((propertyDescriptor instanceof IndexedPropertyDescriptor) && (readMethod = MethodUtils.getAccessibleMethod(bean.getClass(), propertyDescriptor.getIndexedReadMethod())) != null) {
            Object[] subscript = {new Integer(index)};
            try {
                return invokeMethod(readMethod, bean, subscript);
            } catch (InvocationTargetException e) {
                if (e.getTargetException() instanceof IndexOutOfBoundsException) {
                    throw ((IndexOutOfBoundsException) e.getTargetException());
                }
                throw e;
            }
        }
        Method readMethod2 = getReadMethod(bean.getClass(), propertyDescriptor);
        if (readMethod2 == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no ").append("getter method on bean class '").append(bean.getClass()).append("'").toString());
        }
        Object value = invokeMethod(readMethod2, bean, EMPTY_OBJECT_ARRAY);
        if (!value.getClass().isArray()) {
            if (!(value instanceof List)) {
                throw new IllegalArgumentException(new StringBuffer().append("Property '").append(name).append("' is not indexed on bean class '").append(bean.getClass()).append("'").toString());
            }
            return ((List) value).get(index);
        }
        try {
            return Array.get(value, index);
        } catch (ArrayIndexOutOfBoundsException e2) {
            throw new ArrayIndexOutOfBoundsException(new StringBuffer().append("Index: ").append(index).append(", Size: ").append(Array.getLength(value)).append(" for property '").append(name).append("'").toString());
        }
    }

    public Object getMappedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        try {
            String key = this.resolver.getKey(name);
            if (key == null) {
                throw new IllegalArgumentException(new StringBuffer().append("Invalid mapped property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            return getMappedProperty(bean, this.resolver.getProperty(name), key);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid mapped property '").append(name).append("' on bean class '").append(bean.getClass()).append("' ").append(e.getMessage()).toString());
        }
    }

    public Object getMappedProperty(Object bean, String name, String key) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (key == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No key specified for property '").append(name).append("' on bean class ").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            if (((DynaBean) bean).getDynaClass().getDynaProperty(name) == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("'+ on bean class '").append(bean.getClass()).append("'").toString());
            }
            return ((DynaBean) bean).get(name, key);
        }
        Object result = null;
        PropertyDescriptor descriptor = getPropertyDescriptor(bean, name);
        if (descriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("'+ on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (descriptor instanceof MappedPropertyDescriptor) {
            Method readMethod = MethodUtils.getAccessibleMethod(bean.getClass(), ((MappedPropertyDescriptor) descriptor).getMappedReadMethod());
            if (readMethod != null) {
                Object[] keyArray = {key};
                result = invokeMethod(readMethod, bean, keyArray);
            } else {
                throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no mapped getter method on bean class '").append(bean.getClass()).append("'").toString());
            }
        } else {
            Method readMethod2 = getReadMethod(bean.getClass(), descriptor);
            if (readMethod2 != null) {
                Object invokeResult = invokeMethod(readMethod2, bean, EMPTY_OBJECT_ARRAY);
                if (invokeResult instanceof Map) {
                    result = ((Map) invokeResult).get(key);
                }
            } else {
                throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no mapped getter method on bean class '").append(bean.getClass()).append("'").toString());
            }
        }
        return result;
    }

    public FastHashMap getMappedPropertyDescriptors(Class beanClass) {
        if (beanClass == null) {
            return null;
        }
        return (FastHashMap) this.mappedDescriptorsCache.get(beanClass);
    }

    public FastHashMap getMappedPropertyDescriptors(Object bean) {
        if (bean == null) {
            return null;
        }
        return getMappedPropertyDescriptors((Class) bean.getClass());
    }

    public Object getNestedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object bean2;
        Object nestedBean;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            if (bean instanceof Map) {
                nestedBean = getPropertyOfMapBean((Map) bean, next);
            } else if (this.resolver.isMapped(next)) {
                nestedBean = getMappedProperty(bean, next);
            } else if (this.resolver.isIndexed(next)) {
                nestedBean = getIndexedProperty(bean, next);
            } else {
                nestedBean = getSimpleProperty(bean, next);
            }
            if (nestedBean == null) {
                throw new NestedNullException(new StringBuffer().append("Null property value for '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            bean = nestedBean;
            name = this.resolver.remove(name);
        }
        if (bean instanceof Map) {
            bean2 = getPropertyOfMapBean((Map) bean, name);
        } else if (this.resolver.isMapped(name)) {
            bean2 = getMappedProperty(bean, name);
        } else if (this.resolver.isIndexed(name)) {
            bean2 = getIndexedProperty(bean, name);
        } else {
            bean2 = getSimpleProperty(bean, name);
        }
        return bean2;
    }

    protected Object getPropertyOfMapBean(Map bean, String propertyName) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        String name;
        if (this.resolver.isMapped(propertyName) && ((name = this.resolver.getProperty(propertyName)) == null || name.length() == 0)) {
            propertyName = this.resolver.getKey(propertyName);
        }
        if (this.resolver.isIndexed(propertyName) || this.resolver.isMapped(propertyName)) {
            throw new IllegalArgumentException(new StringBuffer().append("Indexed or mapped properties are not supported on objects of type Map: ").append(propertyName).toString());
        }
        return bean.get(propertyName);
    }

    public Object getProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getNestedProperty(bean, name);
    }

    public PropertyDescriptor getPropertyDescriptor(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            Object nestedBean = getProperty(bean, next);
            if (nestedBean == null) {
                throw new NestedNullException(new StringBuffer().append("Null property value for '").append(next).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            bean = nestedBean;
            name = this.resolver.remove(name);
        }
        String name2 = this.resolver.getProperty(name);
        if (name2 == null) {
            return null;
        }
        PropertyDescriptor[] descriptors = getPropertyDescriptors(bean);
        if (descriptors != null) {
            for (int i = 0; i < descriptors.length; i++) {
                if (name2.equals(descriptors[i].getName())) {
                    return descriptors[i];
                }
            }
        }
        FastHashMap mappedDescriptors = getMappedPropertyDescriptors(bean);
        if (mappedDescriptors == null) {
            mappedDescriptors = new FastHashMap();
            mappedDescriptors.setFast(true);
            this.mappedDescriptorsCache.put(bean.getClass(), mappedDescriptors);
        }
        PropertyDescriptor result = (PropertyDescriptor) mappedDescriptors.get(name2);
        if (result == null) {
            try {
                result = new MappedPropertyDescriptor(name2, bean.getClass());
            } catch (IntrospectionException e) {
            }
            if (result != null) {
                mappedDescriptors.put(name2, result);
            }
        }
        return result;
    }

    public PropertyDescriptor[] getPropertyDescriptors(Class beanClass) {
        Class cls;
        if (beanClass == null) {
            throw new IllegalArgumentException("No bean class specified");
        }
        PropertyDescriptor[] descriptors = (PropertyDescriptor[]) this.descriptorsCache.get(beanClass);
        if (descriptors != null) {
            return descriptors;
        }
        try {
            BeanInfo beanInfo = Introspector.getBeanInfo(beanClass);
            PropertyDescriptor[] descriptors2 = beanInfo.getPropertyDescriptors();
            if (descriptors2 == null) {
                descriptors2 = new PropertyDescriptor[0];
            }
            for (int i = 0; i < descriptors2.length; i++) {
                if (descriptors2[i] instanceof IndexedPropertyDescriptor) {
                    IndexedPropertyDescriptor descriptor = (IndexedPropertyDescriptor) descriptors2[i];
                    String propName = new StringBuffer().append(descriptor.getName().substring(0, 1).toUpperCase()).append(descriptor.getName().substring(1)).toString();
                    if (descriptor.getReadMethod() == null) {
                        Method readMethod = MethodUtils.getMatchingAccessibleMethod(beanClass, descriptor.getIndexedReadMethod() != null ? descriptor.getIndexedReadMethod().getName() : new StringBuffer().append("get").append(propName).toString(), EMPTY_CLASS_PARAMETERS);
                        if (readMethod != null) {
                            try {
                                descriptor.setReadMethod(readMethod);
                            } catch (Exception e) {
                                this.log.error("Error setting indexed property read method", e);
                            }
                        }
                    }
                    if (descriptor.getWriteMethod() == null) {
                        String methodName = descriptor.getIndexedWriteMethod() != null ? descriptor.getIndexedWriteMethod().getName() : new StringBuffer().append("set").append(propName).toString();
                        Method writeMethod = MethodUtils.getMatchingAccessibleMethod(beanClass, methodName, LIST_CLASS_PARAMETER);
                        if (writeMethod == null) {
                            Method[] methods = beanClass.getMethods();
                            int j = 0;
                            while (true) {
                                if (j >= methods.length) {
                                    break;
                                }
                                if (methods[j].getName().equals(methodName)) {
                                    Class[] parameterTypes = methods[j].getParameterTypes();
                                    if (parameterTypes.length == 1) {
                                        if (class$java$util$List == null) {
                                            cls = class$("java.util.List");
                                            class$java$util$List = cls;
                                        } else {
                                            cls = class$java$util$List;
                                        }
                                        if (cls.isAssignableFrom(parameterTypes[0])) {
                                            writeMethod = methods[j];
                                            break;
                                        }
                                    } else {
                                        continue;
                                    }
                                }
                                j++;
                            }
                        }
                        if (writeMethod != null) {
                            try {
                                descriptor.setWriteMethod(writeMethod);
                            } catch (Exception e2) {
                                this.log.error("Error setting indexed property write method", e2);
                            }
                        }
                    }
                }
            }
            this.descriptorsCache.put(beanClass, descriptors2);
            return descriptors2;
        } catch (IntrospectionException e3) {
            return new PropertyDescriptor[0];
        }
    }

    public PropertyDescriptor[] getPropertyDescriptors(Object bean) {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        return getPropertyDescriptors((Class) bean.getClass());
    }

    public Class getPropertyEditorClass(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        PropertyDescriptor descriptor = getPropertyDescriptor(bean, name);
        if (descriptor != null) {
            return descriptor.getPropertyEditorClass();
        }
        return null;
    }

    public Class getPropertyType(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Class type;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            Object nestedBean = getProperty(bean, next);
            if (nestedBean == null) {
                throw new NestedNullException(new StringBuffer().append("Null property value for '").append(next).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            bean = nestedBean;
            name = this.resolver.remove(name);
        }
        String name2 = this.resolver.getProperty(name);
        if (bean instanceof DynaBean) {
            DynaProperty descriptor = ((DynaBean) bean).getDynaClass().getDynaProperty(name2);
            if (descriptor == null || (type = descriptor.getType()) == null) {
                return null;
            }
            if (type.isArray()) {
                return type.getComponentType();
            }
            return type;
        }
        IndexedPropertyDescriptor propertyDescriptor = getPropertyDescriptor(bean, name2);
        if (propertyDescriptor == null) {
            return null;
        }
        if (propertyDescriptor instanceof IndexedPropertyDescriptor) {
            return propertyDescriptor.getIndexedPropertyType();
        }
        if (propertyDescriptor instanceof MappedPropertyDescriptor) {
            return ((MappedPropertyDescriptor) propertyDescriptor).getMappedPropertyType();
        }
        return propertyDescriptor.getPropertyType();
    }

    public Method getReadMethod(PropertyDescriptor descriptor) {
        return MethodUtils.getAccessibleMethod(descriptor.getReadMethod());
    }

    Method getReadMethod(Class clazz, PropertyDescriptor descriptor) {
        return MethodUtils.getAccessibleMethod(clazz, descriptor.getReadMethod());
    }

    public Object getSimpleProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.hasNested(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Nested property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.isIndexed(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Indexed property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.isMapped(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Mapped property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            if (((DynaBean) bean).getDynaClass().getDynaProperty(name) == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on dynaclass '").append(((DynaBean) bean).getDynaClass()).append("'").toString());
            }
            return ((DynaBean) bean).get(name);
        }
        PropertyDescriptor descriptor = getPropertyDescriptor(bean, name);
        if (descriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on class '").append(bean.getClass()).append("'").toString());
        }
        Method readMethod = getReadMethod(bean.getClass(), descriptor);
        if (readMethod == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no getter method in class '").append(bean.getClass()).append("'").toString());
        }
        Object value = invokeMethod(readMethod, bean, EMPTY_OBJECT_ARRAY);
        return value;
    }

    public Method getWriteMethod(PropertyDescriptor descriptor) {
        return MethodUtils.getAccessibleMethod(descriptor.getWriteMethod());
    }

    Method getWriteMethod(Class clazz, PropertyDescriptor descriptor) {
        return MethodUtils.getAccessibleMethod(clazz, descriptor.getWriteMethod());
    }

    public boolean isReadable(Object bean, String name) {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            try {
                Object nestedBean = getProperty(bean, next);
                if (nestedBean == null) {
                    throw new NestedNullException(new StringBuffer().append("Null property value for '").append(next).append("' on bean class '").append(bean.getClass()).append("'").toString());
                }
                bean = nestedBean;
                name = this.resolver.remove(name);
            } catch (IllegalAccessException e) {
                return false;
            } catch (NoSuchMethodException e2) {
                return false;
            } catch (InvocationTargetException e3) {
                return false;
            }
        }
        String name2 = this.resolver.getProperty(name);
        if (bean instanceof WrapDynaBean) {
            bean = ((WrapDynaBean) bean).getInstance();
        }
        if (bean instanceof DynaBean) {
            return ((DynaBean) bean).getDynaClass().getDynaProperty(name2) != null;
        }
        try {
            IndexedPropertyDescriptor propertyDescriptor = getPropertyDescriptor(bean, name2);
            if (propertyDescriptor != null) {
                Method readMethod = getReadMethod(bean.getClass(), propertyDescriptor);
                if (readMethod == null) {
                    if (propertyDescriptor instanceof IndexedPropertyDescriptor) {
                        readMethod = propertyDescriptor.getIndexedReadMethod();
                    } else if (propertyDescriptor instanceof MappedPropertyDescriptor) {
                        readMethod = ((MappedPropertyDescriptor) propertyDescriptor).getMappedReadMethod();
                    }
                    readMethod = MethodUtils.getAccessibleMethod(bean.getClass(), readMethod);
                }
                return readMethod != null;
            }
            return false;
        } catch (IllegalAccessException e4) {
            return false;
        } catch (NoSuchMethodException e5) {
            return false;
        } catch (InvocationTargetException e6) {
            return false;
        }
    }

    public boolean isWriteable(Object bean, String name) {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            try {
                Object nestedBean = getProperty(bean, next);
                if (nestedBean == null) {
                    throw new NestedNullException(new StringBuffer().append("Null property value for '").append(next).append("' on bean class '").append(bean.getClass()).append("'").toString());
                }
                bean = nestedBean;
                name = this.resolver.remove(name);
            } catch (IllegalAccessException e) {
                return false;
            } catch (NoSuchMethodException e2) {
                return false;
            } catch (InvocationTargetException e3) {
                return false;
            }
        }
        String name2 = this.resolver.getProperty(name);
        if (bean instanceof WrapDynaBean) {
            bean = ((WrapDynaBean) bean).getInstance();
        }
        if (bean instanceof DynaBean) {
            return ((DynaBean) bean).getDynaClass().getDynaProperty(name2) != null;
        }
        try {
            IndexedPropertyDescriptor propertyDescriptor = getPropertyDescriptor(bean, name2);
            if (propertyDescriptor != null) {
                Method writeMethod = getWriteMethod(bean.getClass(), propertyDescriptor);
                if (writeMethod == null) {
                    if (propertyDescriptor instanceof IndexedPropertyDescriptor) {
                        writeMethod = propertyDescriptor.getIndexedWriteMethod();
                    } else if (propertyDescriptor instanceof MappedPropertyDescriptor) {
                        writeMethod = ((MappedPropertyDescriptor) propertyDescriptor).getMappedWriteMethod();
                    }
                    writeMethod = MethodUtils.getAccessibleMethod(bean.getClass(), writeMethod);
                }
                return writeMethod != null;
            }
            return false;
        } catch (IllegalAccessException e4) {
            return false;
        } catch (NoSuchMethodException e5) {
            return false;
        } catch (InvocationTargetException e6) {
            return false;
        }
    }

    public void setIndexedProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        try {
            int index = this.resolver.getIndex(name);
            if (index < 0) {
                throw new IllegalArgumentException(new StringBuffer().append("Invalid indexed property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            setIndexedProperty(bean, this.resolver.getProperty(name), index, value);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid indexed property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
    }

    public void setIndexedProperty(Object bean, String name, int index, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Method writeMethod;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null || name.length() == 0) {
            if (bean.getClass().isArray()) {
                Array.set(bean, index, value);
                return;
            } else if (bean instanceof List) {
                ((List) bean).set(index, value);
                return;
            }
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            DynaProperty descriptor = ((DynaBean) bean).getDynaClass().getDynaProperty(name);
            if (descriptor == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            ((DynaBean) bean).set(name, index, value);
            return;
        }
        IndexedPropertyDescriptor propertyDescriptor = getPropertyDescriptor(bean, name);
        if (propertyDescriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if ((propertyDescriptor instanceof IndexedPropertyDescriptor) && (writeMethod = MethodUtils.getAccessibleMethod(bean.getClass(), propertyDescriptor.getIndexedWriteMethod())) != null) {
            Object[] subscript = {new Integer(index), value};
            try {
                if (this.log.isTraceEnabled()) {
                    String valueClassName = value == null ? "<null>" : value.getClass().getName();
                    this.log.trace(new StringBuffer().append("setSimpleProperty: Invoking method ").append(writeMethod).append(" with index=").append(index).append(", value=").append(value).append(" (class ").append(valueClassName).append(")").toString());
                }
                invokeMethod(writeMethod, bean, subscript);
                return;
            } catch (InvocationTargetException e) {
                if (e.getTargetException() instanceof IndexOutOfBoundsException) {
                    throw ((IndexOutOfBoundsException) e.getTargetException());
                }
                throw e;
            }
        }
        Method readMethod = getReadMethod(bean.getClass(), propertyDescriptor);
        if (readMethod == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no getter method on bean class '").append(bean.getClass()).append("'").toString());
        }
        Object array = invokeMethod(readMethod, bean, EMPTY_OBJECT_ARRAY);
        if (!array.getClass().isArray()) {
            if (array instanceof List) {
                ((List) array).set(index, value);
                return;
            }
            throw new IllegalArgumentException(new StringBuffer().append("Property '").append(name).append("' is not indexed on bean class '").append(bean.getClass()).append("'").toString());
        }
        Array.set(array, index, value);
    }

    public void setMappedProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        try {
            String key = this.resolver.getKey(name);
            if (key == null) {
                throw new IllegalArgumentException(new StringBuffer().append("Invalid mapped property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            setMappedProperty(bean, this.resolver.getProperty(name), key, value);
        } catch (IllegalArgumentException e) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid mapped property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
    }

    public void setMappedProperty(Object bean, String name, String key, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (key == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No key specified for property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            if (((DynaBean) bean).getDynaClass().getDynaProperty(name) == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            ((DynaBean) bean).set(name, key, value);
            return;
        }
        PropertyDescriptor descriptor = getPropertyDescriptor(bean, name);
        if (descriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (descriptor instanceof MappedPropertyDescriptor) {
            Method mappedWriteMethod = MethodUtils.getAccessibleMethod(bean.getClass(), ((MappedPropertyDescriptor) descriptor).getMappedWriteMethod());
            if (mappedWriteMethod != null) {
                Object[] params = {key, value};
                if (this.log.isTraceEnabled()) {
                    String valueClassName = value == null ? "<null>" : value.getClass().getName();
                    this.log.trace(new StringBuffer().append("setSimpleProperty: Invoking method ").append(mappedWriteMethod).append(" with key=").append(key).append(", value=").append(value).append(" (class ").append(valueClassName).append(")").toString());
                }
                invokeMethod(mappedWriteMethod, bean, params);
                return;
            }
            throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no mapped setter method").append("on bean class '").append(bean.getClass()).append("'").toString());
        }
        Method readMethod = getReadMethod(bean.getClass(), descriptor);
        if (readMethod != null) {
            Object invokeResult = invokeMethod(readMethod, bean, EMPTY_OBJECT_ARRAY);
            if (invokeResult instanceof Map) {
                ((Map) invokeResult).put(key, value);
                return;
            }
            return;
        }
        throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no mapped getter method on bean class '").append(bean.getClass()).append("'").toString());
    }

    public void setNestedProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object nestedBean;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        while (this.resolver.hasNested(name)) {
            String next = this.resolver.next(name);
            if (bean instanceof Map) {
                nestedBean = getPropertyOfMapBean((Map) bean, next);
            } else if (this.resolver.isMapped(next)) {
                nestedBean = getMappedProperty(bean, next);
            } else if (this.resolver.isIndexed(next)) {
                nestedBean = getIndexedProperty(bean, next);
            } else {
                nestedBean = getSimpleProperty(bean, next);
            }
            if (nestedBean == null) {
                throw new NestedNullException(new StringBuffer().append("Null property value for '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
            }
            bean = nestedBean;
            name = this.resolver.remove(name);
        }
        if (bean instanceof Map) {
            setPropertyOfMapBean((Map) bean, name, value);
            return;
        }
        if (this.resolver.isMapped(name)) {
            setMappedProperty(bean, name, value);
        } else if (this.resolver.isIndexed(name)) {
            setIndexedProperty(bean, name, value);
        } else {
            setSimpleProperty(bean, name, value);
        }
    }

    protected void setPropertyOfMapBean(Map bean, String propertyName, Object value) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        String name;
        if (this.resolver.isMapped(propertyName) && ((name = this.resolver.getProperty(propertyName)) == null || name.length() == 0)) {
            propertyName = this.resolver.getKey(propertyName);
        }
        if (this.resolver.isIndexed(propertyName) || this.resolver.isMapped(propertyName)) {
            throw new IllegalArgumentException(new StringBuffer().append("Indexed or mapped properties are not supported on objects of type Map: ").append(propertyName).toString());
        }
        bean.put(propertyName, value);
    }

    public void setProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        setNestedProperty(bean, name, value);
    }

    public void setSimpleProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified");
        }
        if (name == null) {
            throw new IllegalArgumentException(new StringBuffer().append("No name specified for bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.hasNested(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Nested property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.isIndexed(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Indexed property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (this.resolver.isMapped(name)) {
            throw new IllegalArgumentException(new StringBuffer().append("Mapped property names are not allowed: Property '").append(name).append("' on bean class '").append(bean.getClass()).append("'").toString());
        }
        if (bean instanceof DynaBean) {
            if (((DynaBean) bean).getDynaClass().getDynaProperty(name) == null) {
                throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on dynaclass '").append(((DynaBean) bean).getDynaClass()).append("'").toString());
            }
            ((DynaBean) bean).set(name, value);
            return;
        }
        PropertyDescriptor descriptor = getPropertyDescriptor(bean, name);
        if (descriptor == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Unknown property '").append(name).append("' on class '").append(bean.getClass()).append("'").toString());
        }
        Method writeMethod = getWriteMethod(bean.getClass(), descriptor);
        if (writeMethod == null) {
            throw new NoSuchMethodException(new StringBuffer().append("Property '").append(name).append("' has no setter method in class '").append(bean.getClass()).append("'").toString());
        }
        Object[] values = {value};
        if (this.log.isTraceEnabled()) {
            String valueClassName = value == null ? "<null>" : value.getClass().getName();
            this.log.trace(new StringBuffer().append("setSimpleProperty: Invoking method ").append(writeMethod).append(" with value ").append(value).append(" (class ").append(valueClassName).append(")").toString());
        }
        invokeMethod(writeMethod, bean, values);
    }

    private Object invokeMethod(Method method, Object bean, Object[] values) throws IllegalAccessException, InvocationTargetException {
        String stringBuffer;
        String stringBuffer2;
        if (bean == null) {
            throw new IllegalArgumentException("No bean specified - this should have been checked before reaching this method");
        }
        try {
            return method.invoke(bean, values);
        } catch (IllegalArgumentException cause) {
            String valueString = "";
            if (values != null) {
                for (int i = 0; i < values.length; i++) {
                    if (i > 0) {
                        valueString = new StringBuffer().append(valueString).append(", ").toString();
                    }
                    if (values[i] == null) {
                        stringBuffer2 = new StringBuffer().append(valueString).append("<null>").toString();
                    } else {
                        stringBuffer2 = new StringBuffer().append(valueString).append(values[i].getClass().getName()).toString();
                    }
                    valueString = stringBuffer2;
                }
            }
            String expectedString = "";
            Class[] parTypes = method.getParameterTypes();
            if (parTypes != null) {
                for (int i2 = 0; i2 < parTypes.length; i2++) {
                    if (i2 > 0) {
                        expectedString = new StringBuffer().append(expectedString).append(", ").toString();
                    }
                    expectedString = new StringBuffer().append(expectedString).append(parTypes[i2].getName()).toString();
                }
            }
            IllegalArgumentException e = new IllegalArgumentException(new StringBuffer().append("Cannot invoke ").append(method.getDeclaringClass().getName()).append(".").append(method.getName()).append(" on bean class '").append(bean.getClass()).append("' - ").append(cause.getMessage()).append(" - had objects of type \"").append(valueString).append("\" but expected signature \"").append(expectedString).append("\"").toString());
            if (!BeanUtils.initCause(e, cause)) {
                this.log.error("Method invocation failed", cause);
            }
            throw e;
        } catch (NullPointerException cause2) {
            String valueString2 = "";
            if (values != null) {
                for (int i3 = 0; i3 < values.length; i3++) {
                    if (i3 > 0) {
                        valueString2 = new StringBuffer().append(valueString2).append(", ").toString();
                    }
                    if (values[i3] == null) {
                        stringBuffer = new StringBuffer().append(valueString2).append("<null>").toString();
                    } else {
                        stringBuffer = new StringBuffer().append(valueString2).append(values[i3].getClass().getName()).toString();
                    }
                    valueString2 = stringBuffer;
                }
            }
            String expectedString2 = "";
            Class[] parTypes2 = method.getParameterTypes();
            if (parTypes2 != null) {
                for (int i4 = 0; i4 < parTypes2.length; i4++) {
                    if (i4 > 0) {
                        expectedString2 = new StringBuffer().append(expectedString2).append(", ").toString();
                    }
                    expectedString2 = new StringBuffer().append(expectedString2).append(parTypes2[i4].getName()).toString();
                }
            }
            IllegalArgumentException e2 = new IllegalArgumentException(new StringBuffer().append("Cannot invoke ").append(method.getDeclaringClass().getName()).append(".").append(method.getName()).append(" on bean class '").append(bean.getClass()).append("' - ").append(cause2.getMessage()).append(" - had objects of type \"").append(valueString2).append("\" but expected signature \"").append(expectedString2).append("\"").toString());
            if (!BeanUtils.initCause(e2, cause2)) {
                this.log.error("Method invocation failed", cause2);
            }
            throw e2;
        }
    }
}
