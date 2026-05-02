package org.apache.commons.beanutils;

import java.beans.IndexedPropertyDescriptor;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Array;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.beanutils.expression.Resolver;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BeanUtilsBean.class */
public class BeanUtilsBean {
    private Log log;
    private ConvertUtilsBean convertUtilsBean;
    private PropertyUtilsBean propertyUtilsBean;
    static Class class$org$apache$commons$beanutils$BeanUtils;
    static Class class$java$lang$Object;
    static Class class$java$lang$Throwable;
    private static final ContextClassLoaderLocal BEANS_BY_CLASSLOADER = new ContextClassLoaderLocal() { // from class: org.apache.commons.beanutils.BeanUtilsBean.1
        @Override // org.apache.commons.beanutils.ContextClassLoaderLocal
        protected Object initialValue() {
            return new BeanUtilsBean();
        }
    };
    private static final Method INIT_CAUSE_METHOD = getInitCauseMethod();

    public static BeanUtilsBean getInstance() {
        return (BeanUtilsBean) BEANS_BY_CLASSLOADER.get();
    }

    public static void setInstance(BeanUtilsBean newInstance) {
        BEANS_BY_CLASSLOADER.set(newInstance);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public BeanUtilsBean() {
        this(new ConvertUtilsBean(), new PropertyUtilsBean());
    }

    public BeanUtilsBean(ConvertUtilsBean convertUtilsBean) {
        this(convertUtilsBean, new PropertyUtilsBean());
    }

    public BeanUtilsBean(ConvertUtilsBean convertUtilsBean, PropertyUtilsBean propertyUtilsBean) {
        Class cls;
        if (class$org$apache$commons$beanutils$BeanUtils == null) {
            cls = class$("org.apache.commons.beanutils.BeanUtils");
            class$org$apache$commons$beanutils$BeanUtils = cls;
        } else {
            cls = class$org$apache$commons$beanutils$BeanUtils;
        }
        this.log = LogFactory.getLog(cls);
        this.convertUtilsBean = convertUtilsBean;
        this.propertyUtilsBean = propertyUtilsBean;
    }

    public Object cloneBean(Object bean) throws IllegalAccessException, InstantiationException, InvocationTargetException, NoSuchMethodException {
        Object newBean;
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Cloning bean: ").append(bean.getClass().getName()).toString());
        }
        if (bean instanceof DynaBean) {
            newBean = ((DynaBean) bean).getDynaClass().newInstance();
        } else {
            newBean = bean.getClass().newInstance();
        }
        getPropertyUtils().copyProperties(newBean, bean);
        return newBean;
    }

    public void copyProperties(Object dest, Object orig) throws IllegalAccessException, InvocationTargetException {
        if (dest == null) {
            throw new IllegalArgumentException("No destination bean specified");
        }
        if (orig == null) {
            throw new IllegalArgumentException("No origin bean specified");
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("BeanUtils.copyProperties(").append(dest).append(", ").append(orig).append(")").toString());
        }
        if (orig instanceof DynaBean) {
            for (DynaProperty dynaProperty : ((DynaBean) orig).getDynaClass().getDynaProperties()) {
                String name = dynaProperty.getName();
                if (getPropertyUtils().isReadable(orig, name) && getPropertyUtils().isWriteable(dest, name)) {
                    Object value = ((DynaBean) orig).get(name);
                    copyProperty(dest, name, value);
                }
            }
            return;
        }
        if (orig instanceof Map) {
            for (Map.Entry entry : ((Map) orig).entrySet()) {
                String name2 = (String) entry.getKey();
                if (getPropertyUtils().isWriteable(dest, name2)) {
                    copyProperty(dest, name2, entry.getValue());
                }
            }
            return;
        }
        PropertyDescriptor[] origDescriptors = getPropertyUtils().getPropertyDescriptors(orig);
        for (PropertyDescriptor propertyDescriptor : origDescriptors) {
            String name3 = propertyDescriptor.getName();
            if (!"class".equals(name3) && getPropertyUtils().isReadable(orig, name3) && getPropertyUtils().isWriteable(dest, name3)) {
                try {
                    Object value2 = getPropertyUtils().getSimpleProperty(orig, name3);
                    copyProperty(dest, name3, value2);
                } catch (NoSuchMethodException e) {
                }
            }
        }
    }

    public void copyProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException {
        Class type;
        if (this.log.isTraceEnabled()) {
            StringBuffer sb = new StringBuffer("  copyProperty(");
            sb.append(bean);
            sb.append(", ");
            sb.append(name);
            sb.append(", ");
            if (value == null) {
                sb.append("<NULL>");
            } else if (value instanceof String) {
                sb.append((String) value);
            } else if (value instanceof String[]) {
                String[] values = (String[]) value;
                sb.append('[');
                for (int i = 0; i < values.length; i++) {
                    if (i > 0) {
                        sb.append(',');
                    }
                    sb.append(values[i]);
                }
                sb.append(']');
            } else {
                sb.append(value.toString());
            }
            sb.append(')');
            this.log.trace(sb.toString());
        }
        Object target = bean;
        Resolver resolver = getPropertyUtils().getResolver();
        while (resolver.hasNested(name)) {
            try {
                target = getPropertyUtils().getProperty(target, resolver.next(name));
                name = resolver.remove(name);
            } catch (NoSuchMethodException e) {
                return;
            }
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("    Target bean = ").append(target).toString());
            this.log.trace(new StringBuffer().append("    Target name = ").append(name).toString());
        }
        String propName = resolver.getProperty(name);
        int index = resolver.getIndex(name);
        String key = resolver.getKey(name);
        if (target instanceof DynaBean) {
            DynaClass dynaClass = ((DynaBean) target).getDynaClass();
            DynaProperty dynaProperty = dynaClass.getDynaProperty(propName);
            if (dynaProperty == null) {
                return;
            } else {
                type = dynaProperty.getType();
            }
        } else {
            try {
                PropertyDescriptor descriptor = getPropertyUtils().getPropertyDescriptor(target, name);
                if (descriptor == null) {
                    return;
                }
                type = descriptor.getPropertyType();
                if (type == null) {
                    if (this.log.isTraceEnabled()) {
                        this.log.trace(new StringBuffer().append("    target type for property '").append(propName).append("' is null, so skipping ths setter").toString());
                        return;
                    }
                    return;
                }
            } catch (NoSuchMethodException e2) {
                return;
            }
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("    target propName=").append(propName).append(", type=").append(type).append(", index=").append(index).append(", key=").append(key).toString());
        }
        if (index >= 0) {
            try {
                getPropertyUtils().setIndexedProperty(target, propName, index, convert(value, type.getComponentType()));
                return;
            } catch (NoSuchMethodException e3) {
                throw new InvocationTargetException(e3, new StringBuffer().append("Cannot set ").append(propName).toString());
            }
        }
        if (key != null) {
            try {
                getPropertyUtils().setMappedProperty(target, propName, key, value);
            } catch (NoSuchMethodException e4) {
                throw new InvocationTargetException(e4, new StringBuffer().append("Cannot set ").append(propName).toString());
            }
        } else {
            try {
                getPropertyUtils().setSimpleProperty(target, propName, convert(value, type));
            } catch (NoSuchMethodException e5) {
                throw new InvocationTargetException(e5, new StringBuffer().append("Cannot set ").append(propName).toString());
            }
        }
    }

    public Map describe(Object bean) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        if (bean == null) {
            return new HashMap();
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("Describing bean: ").append(bean.getClass().getName()).toString());
        }
        Map description = new HashMap();
        if (bean instanceof DynaBean) {
            for (DynaProperty dynaProperty : ((DynaBean) bean).getDynaClass().getDynaProperties()) {
                String name = dynaProperty.getName();
                description.put(name, getProperty(bean, name));
            }
        } else {
            PropertyDescriptor[] descriptors = getPropertyUtils().getPropertyDescriptors(bean);
            Class clazz = bean.getClass();
            for (int i = 0; i < descriptors.length; i++) {
                String name2 = descriptors[i].getName();
                if (getPropertyUtils().getReadMethod(clazz, descriptors[i]) != null) {
                    description.put(name2, getProperty(bean, name2));
                }
            }
        }
        return description;
    }

    public String[] getArrayProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getProperty(bean, name);
        if (value == null) {
            return null;
        }
        if (value instanceof Collection) {
            ArrayList values = new ArrayList();
            for (Object item : (Collection) value) {
                if (item == null) {
                    values.add((String) null);
                } else {
                    values.add(getConvertUtils().convert(item));
                }
            }
            return (String[]) values.toArray(new String[values.size()]);
        }
        if (value.getClass().isArray()) {
            int n = Array.getLength(value);
            String[] results = new String[n];
            for (int i = 0; i < n; i++) {
                Object item2 = Array.get(value, i);
                if (item2 == null) {
                    results[i] = null;
                } else {
                    results[i] = getConvertUtils().convert(item2);
                }
            }
            return results;
        }
        return new String[]{getConvertUtils().convert(value)};
    }

    public String getIndexedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getIndexedProperty(bean, name);
        return getConvertUtils().convert(value);
    }

    public String getIndexedProperty(Object bean, String name, int index) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getIndexedProperty(bean, name, index);
        return getConvertUtils().convert(value);
    }

    public String getMappedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getMappedProperty(bean, name);
        return getConvertUtils().convert(value);
    }

    public String getMappedProperty(Object bean, String name, String key) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getMappedProperty(bean, name, key);
        return getConvertUtils().convert(value);
    }

    public String getNestedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getNestedProperty(bean, name);
        return getConvertUtils().convert(value);
    }

    public String getProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getNestedProperty(bean, name);
    }

    public String getSimpleProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getSimpleProperty(bean, name);
        return getConvertUtils().convert(value);
    }

    public void populate(Object bean, Map properties) throws IllegalAccessException, InvocationTargetException {
        if (bean == null || properties == null) {
            return;
        }
        if (this.log.isDebugEnabled()) {
            this.log.debug(new StringBuffer().append("BeanUtils.populate(").append(bean).append(", ").append(properties).append(")").toString());
        }
        for (Map.Entry entry : properties.entrySet()) {
            String name = (String) entry.getKey();
            if (name != null) {
                setProperty(bean, name, entry.getValue());
            }
        }
    }

    public void setProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException {
        Class type;
        Class cls;
        Class cls2;
        Object newValue;
        if (this.log.isTraceEnabled()) {
            StringBuffer sb = new StringBuffer("  setProperty(");
            sb.append(bean);
            sb.append(", ");
            sb.append(name);
            sb.append(", ");
            if (value == null) {
                sb.append("<NULL>");
            } else if (value instanceof String) {
                sb.append((String) value);
            } else if (value instanceof String[]) {
                String[] values = (String[]) value;
                sb.append('[');
                for (int i = 0; i < values.length; i++) {
                    if (i > 0) {
                        sb.append(',');
                    }
                    sb.append(values[i]);
                }
                sb.append(']');
            } else {
                sb.append(value.toString());
            }
            sb.append(')');
            this.log.trace(sb.toString());
        }
        Object target = bean;
        Resolver resolver = getPropertyUtils().getResolver();
        while (resolver.hasNested(name)) {
            try {
                target = getPropertyUtils().getProperty(target, resolver.next(name));
                name = resolver.remove(name);
            } catch (NoSuchMethodException e) {
                return;
            }
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("    Target bean = ").append(target).toString());
            this.log.trace(new StringBuffer().append("    Target name = ").append(name).toString());
        }
        String propName = resolver.getProperty(name);
        int index = resolver.getIndex(name);
        String key = resolver.getKey(name);
        if (target instanceof DynaBean) {
            DynaClass dynaClass = ((DynaBean) target).getDynaClass();
            DynaProperty dynaProperty = dynaClass.getDynaProperty(propName);
            if (dynaProperty == null) {
                return;
            } else {
                type = dynaProperty.getType();
            }
        } else if (target instanceof Map) {
            if (class$java$lang$Object == null) {
                cls2 = class$("java.lang.Object");
                class$java$lang$Object = cls2;
            } else {
                cls2 = class$java$lang$Object;
            }
            type = cls2;
        } else if (target != null && target.getClass().isArray() && index >= 0) {
            type = Array.get(target, index).getClass();
        } else {
            try {
                IndexedPropertyDescriptor propertyDescriptor = getPropertyUtils().getPropertyDescriptor(target, name);
                if (propertyDescriptor == null) {
                    return;
                }
                if (propertyDescriptor instanceof MappedPropertyDescriptor) {
                    if (((MappedPropertyDescriptor) propertyDescriptor).getMappedWriteMethod() == null) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Skipping read-only property");
                            return;
                        }
                        return;
                    }
                    type = ((MappedPropertyDescriptor) propertyDescriptor).getMappedPropertyType();
                } else if (index >= 0 && (propertyDescriptor instanceof IndexedPropertyDescriptor)) {
                    if (propertyDescriptor.getIndexedWriteMethod() == null) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Skipping read-only property");
                            return;
                        }
                        return;
                    }
                    type = propertyDescriptor.getIndexedPropertyType();
                } else if (key != null) {
                    if (propertyDescriptor.getReadMethod() == null) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Skipping read-only property");
                            return;
                        }
                        return;
                    } else {
                        if (value != null) {
                            cls = value.getClass();
                        } else if (class$java$lang$Object == null) {
                            cls = class$("java.lang.Object");
                            class$java$lang$Object = cls;
                        } else {
                            cls = class$java$lang$Object;
                        }
                        type = cls;
                    }
                } else {
                    if (propertyDescriptor.getWriteMethod() == null) {
                        if (this.log.isDebugEnabled()) {
                            this.log.debug("Skipping read-only property");
                            return;
                        }
                        return;
                    }
                    type = propertyDescriptor.getPropertyType();
                }
            } catch (NoSuchMethodException e2) {
                return;
            }
        }
        if (type.isArray() && index < 0) {
            if (value == null) {
                newValue = getConvertUtils().convert(new String[]{null}, type);
            } else if (value instanceof String) {
                newValue = getConvertUtils().convert(value, type);
            } else if (value instanceof String[]) {
                newValue = getConvertUtils().convert((String[]) value, type);
            } else {
                newValue = convert(value, type);
            }
        } else if (type.isArray()) {
            if ((value instanceof String) || value == null) {
                newValue = getConvertUtils().convert((String) value, (Class) type.getComponentType());
            } else if (value instanceof String[]) {
                newValue = getConvertUtils().convert(((String[]) value)[0], (Class) type.getComponentType());
            } else {
                newValue = convert(value, type.getComponentType());
            }
        } else if (value instanceof String) {
            newValue = getConvertUtils().convert((String) value, type);
        } else if (value instanceof String[]) {
            newValue = getConvertUtils().convert(((String[]) value)[0], type);
        } else {
            newValue = convert(value, type);
        }
        try {
            getPropertyUtils().setProperty(target, name, newValue);
        } catch (NoSuchMethodException e3) {
            throw new InvocationTargetException(e3, new StringBuffer().append("Cannot set ").append(propName).toString());
        }
    }

    public ConvertUtilsBean getConvertUtils() {
        return this.convertUtilsBean;
    }

    public PropertyUtilsBean getPropertyUtils() {
        return this.propertyUtilsBean;
    }

    public boolean initCause(Throwable throwable, Throwable cause) {
        if (INIT_CAUSE_METHOD != null && cause != null) {
            try {
                INIT_CAUSE_METHOD.invoke(throwable, cause);
                return true;
            } catch (Throwable th) {
                return false;
            }
        }
        return false;
    }

    protected Object convert(Object value, Class type) {
        Converter converter = getConvertUtils().lookup(type);
        if (converter != null) {
            this.log.trace(new StringBuffer().append("        USING CONVERTER ").append(converter).toString());
            return converter.convert(type, value);
        }
        return value;
    }

    private static Method getInitCauseMethod() {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        try {
            Class[] paramsClasses = new Class[1];
            if (class$java$lang$Throwable == null) {
                cls3 = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls3;
            } else {
                cls3 = class$java$lang$Throwable;
            }
            paramsClasses[0] = cls3;
            if (class$java$lang$Throwable == null) {
                cls4 = class$("java.lang.Throwable");
                class$java$lang$Throwable = cls4;
            } else {
                cls4 = class$java$lang$Throwable;
            }
            return cls4.getMethod("initCause", paramsClasses);
        } catch (NoSuchMethodException e) {
            if (class$org$apache$commons$beanutils$BeanUtils == null) {
                cls2 = class$("org.apache.commons.beanutils.BeanUtils");
                class$org$apache$commons$beanutils$BeanUtils = cls2;
            } else {
                cls2 = class$org$apache$commons$beanutils$BeanUtils;
            }
            Log log = LogFactory.getLog(cls2);
            if (log.isWarnEnabled()) {
                log.warn("Throwable does not have initCause() method in JDK 1.3");
                return null;
            }
            return null;
        } catch (Throwable e2) {
            if (class$org$apache$commons$beanutils$BeanUtils == null) {
                cls = class$("org.apache.commons.beanutils.BeanUtils");
                class$org$apache$commons$beanutils$BeanUtils = cls;
            } else {
                cls = class$org$apache$commons$beanutils$BeanUtils;
            }
            Log log2 = LogFactory.getLog(cls);
            if (log2.isWarnEnabled()) {
                log2.warn("Error getting the Throwable initCause() method", e2);
                return null;
            }
            return null;
        }
    }
}
