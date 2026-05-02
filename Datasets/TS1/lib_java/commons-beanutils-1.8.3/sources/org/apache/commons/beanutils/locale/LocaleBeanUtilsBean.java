package org.apache.commons.beanutils.locale;

import java.beans.IndexedPropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.Locale;
import org.apache.commons.beanutils.BeanUtilsBean;
import org.apache.commons.beanutils.ContextClassLoaderLocal;
import org.apache.commons.beanutils.ConvertUtils;
import org.apache.commons.beanutils.ConvertUtilsBean;
import org.apache.commons.beanutils.DynaBean;
import org.apache.commons.beanutils.DynaClass;
import org.apache.commons.beanutils.DynaProperty;
import org.apache.commons.beanutils.MappedPropertyDescriptor;
import org.apache.commons.beanutils.PropertyUtilsBean;
import org.apache.commons.beanutils.expression.Resolver;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleBeanUtilsBean.class */
public class LocaleBeanUtilsBean extends BeanUtilsBean {
    private static final ContextClassLoaderLocal LOCALE_BEANS_BY_CLASSLOADER = new ContextClassLoaderLocal() { // from class: org.apache.commons.beanutils.locale.LocaleBeanUtilsBean.1
        @Override // org.apache.commons.beanutils.ContextClassLoaderLocal
        protected Object initialValue() {
            return new LocaleBeanUtilsBean();
        }
    };
    private Log log;
    private LocaleConvertUtilsBean localeConvertUtils;
    static Class class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean;

    public static LocaleBeanUtilsBean getLocaleBeanUtilsInstance() {
        return (LocaleBeanUtilsBean) LOCALE_BEANS_BY_CLASSLOADER.get();
    }

    public static void setInstance(LocaleBeanUtilsBean newInstance) {
        LOCALE_BEANS_BY_CLASSLOADER.set(newInstance);
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public LocaleBeanUtilsBean() {
        Class cls;
        if (class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean == null) {
            cls = class$("org.apache.commons.beanutils.locale.LocaleBeanUtilsBean");
            class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean;
        }
        this.log = LogFactory.getLog(cls);
        this.localeConvertUtils = new LocaleConvertUtilsBean();
    }

    public LocaleBeanUtilsBean(LocaleConvertUtilsBean localeConvertUtils, ConvertUtilsBean convertUtilsBean, PropertyUtilsBean propertyUtilsBean) {
        Class cls;
        super(convertUtilsBean, propertyUtilsBean);
        if (class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean == null) {
            cls = class$("org.apache.commons.beanutils.locale.LocaleBeanUtilsBean");
            class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean;
        }
        this.log = LogFactory.getLog(cls);
        this.localeConvertUtils = localeConvertUtils;
    }

    public LocaleBeanUtilsBean(LocaleConvertUtilsBean localeConvertUtils) {
        Class cls;
        if (class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean == null) {
            cls = class$("org.apache.commons.beanutils.locale.LocaleBeanUtilsBean");
            class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$locale$LocaleBeanUtilsBean;
        }
        this.log = LogFactory.getLog(cls);
        this.localeConvertUtils = localeConvertUtils;
    }

    public LocaleConvertUtilsBean getLocaleConvertUtils() {
        return this.localeConvertUtils;
    }

    public Locale getDefaultLocale() {
        return getLocaleConvertUtils().getDefaultLocale();
    }

    public void setDefaultLocale(Locale locale) {
        getLocaleConvertUtils().setDefaultLocale(locale);
    }

    public boolean getApplyLocalized() {
        return getLocaleConvertUtils().getApplyLocalized();
    }

    public void setApplyLocalized(boolean newApplyLocalized) {
        getLocaleConvertUtils().setApplyLocalized(newApplyLocalized);
    }

    public String getIndexedProperty(Object bean, String name, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getIndexedProperty(bean, name);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getIndexedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getIndexedProperty(bean, name, (String) null);
    }

    public String getIndexedProperty(Object bean, String name, int index, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getIndexedProperty(bean, name, index);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getIndexedProperty(Object bean, String name, int index) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getIndexedProperty(bean, name, index, null);
    }

    public String getSimpleProperty(Object bean, String name, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getSimpleProperty(bean, name);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getSimpleProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getSimpleProperty(bean, name, null);
    }

    public String getMappedProperty(Object bean, String name, String key, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getMappedProperty(bean, name, key);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getMappedProperty(Object bean, String name, String key) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getMappedProperty(bean, name, key, null);
    }

    public String getMappedPropertyLocale(Object bean, String name, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getMappedProperty(bean, name);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getMappedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getMappedPropertyLocale(bean, name, null);
    }

    public String getNestedProperty(Object bean, String name, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        Object value = getPropertyUtils().getNestedProperty(bean, name);
        return getLocaleConvertUtils().convert(value, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getNestedProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getNestedProperty(bean, name, null);
    }

    public String getProperty(Object bean, String name, String pattern) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getNestedProperty(bean, name, pattern);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public String getProperty(Object bean, String name) throws IllegalAccessException, InvocationTargetException, NoSuchMethodException {
        return getNestedProperty(bean, name);
    }

    @Override // org.apache.commons.beanutils.BeanUtilsBean
    public void setProperty(Object bean, String name, Object value) throws IllegalAccessException, InvocationTargetException {
        setProperty(bean, name, value, null);
    }

    public void setProperty(Object bean, String name, Object value, String pattern) throws IllegalAccessException, InvocationTargetException {
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
        Class type = definePropertyType(target, name, propName);
        if (type != null) {
            Object newValue = convert(type, index, value, pattern);
            invokeSetter(target, propName, key, index, newValue);
        }
    }

    protected Class definePropertyType(Object target, String name, String propName) throws IllegalAccessException, InvocationTargetException {
        Class type;
        if (target instanceof DynaBean) {
            DynaClass dynaClass = ((DynaBean) target).getDynaClass();
            DynaProperty dynaProperty = dynaClass.getDynaProperty(propName);
            if (dynaProperty == null) {
                return null;
            }
            type = dynaProperty.getType();
        } else {
            try {
                IndexedPropertyDescriptor propertyDescriptor = getPropertyUtils().getPropertyDescriptor(target, name);
                if (propertyDescriptor == null) {
                    return null;
                }
                if (propertyDescriptor instanceof MappedPropertyDescriptor) {
                    type = ((MappedPropertyDescriptor) propertyDescriptor).getMappedPropertyType();
                } else if (propertyDescriptor instanceof IndexedPropertyDescriptor) {
                    type = propertyDescriptor.getIndexedPropertyType();
                } else {
                    type = propertyDescriptor.getPropertyType();
                }
            } catch (NoSuchMethodException e) {
                return null;
            }
        }
        return type;
    }

    protected Object convert(Class type, int index, Object value, String pattern) {
        Object newValue;
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("Converting value '").append(value).append("' to type:").append(type).toString());
        }
        if (type.isArray() && index < 0) {
            if (value instanceof String) {
                String[] values = {(String) value};
                newValue = getLocaleConvertUtils().convert(values, type, pattern);
            } else if (value instanceof String[]) {
                newValue = getLocaleConvertUtils().convert((String[]) value, type, pattern);
            } else {
                newValue = value;
            }
        } else if (type.isArray()) {
            if (value instanceof String) {
                newValue = getLocaleConvertUtils().convert((String) value, type.getComponentType(), pattern);
            } else if (value instanceof String[]) {
                newValue = getLocaleConvertUtils().convert(((String[]) value)[0], type.getComponentType(), pattern);
            } else {
                newValue = value;
            }
        } else if (value instanceof String) {
            newValue = getLocaleConvertUtils().convert((String) value, type, pattern);
        } else if (value instanceof String[]) {
            newValue = getLocaleConvertUtils().convert(((String[]) value)[0], type, pattern);
        } else {
            newValue = value;
        }
        return newValue;
    }

    protected Object convert(Class type, int index, Object value) {
        Object newValue;
        if (type.isArray() && index < 0) {
            if (value instanceof String) {
                String[] values = {(String) value};
                newValue = ConvertUtils.convert(values, type);
            } else if (value instanceof String[]) {
                newValue = ConvertUtils.convert((String[]) value, type);
            } else {
                newValue = value;
            }
        } else if (type.isArray()) {
            if (value instanceof String) {
                newValue = ConvertUtils.convert((String) value, (Class) type.getComponentType());
            } else if (value instanceof String[]) {
                newValue = ConvertUtils.convert(((String[]) value)[0], (Class) type.getComponentType());
            } else {
                newValue = value;
            }
        } else if (value instanceof String) {
            newValue = ConvertUtils.convert((String) value, type);
        } else if (value instanceof String[]) {
            newValue = ConvertUtils.convert(((String[]) value)[0], type);
        } else {
            newValue = value;
        }
        return newValue;
    }

    protected void invokeSetter(Object target, String propName, String key, int index, Object newValue) throws IllegalAccessException, InvocationTargetException {
        try {
            if (index >= 0) {
                getPropertyUtils().setIndexedProperty(target, propName, index, newValue);
            } else if (key != null) {
                getPropertyUtils().setMappedProperty(target, propName, key, newValue);
            } else {
                getPropertyUtils().setProperty(target, propName, newValue);
            }
        } catch (NoSuchMethodException e) {
            throw new InvocationTargetException(e, new StringBuffer().append("Cannot set ").append(propName).toString());
        }
    }

    protected Descriptor calculate(Object bean, String name) throws IllegalAccessException, InvocationTargetException {
        Object target = bean;
        Resolver resolver = getPropertyUtils().getResolver();
        while (resolver.hasNested(name)) {
            try {
                target = getPropertyUtils().getProperty(target, resolver.next(name));
                name = resolver.remove(name);
            } catch (NoSuchMethodException e) {
                return null;
            }
        }
        if (this.log.isTraceEnabled()) {
            this.log.trace(new StringBuffer().append("    Target bean = ").append(target).toString());
            this.log.trace(new StringBuffer().append("    Target name = ").append(name).toString());
        }
        String propName = resolver.getProperty(name);
        int index = resolver.getIndex(name);
        String key = resolver.getKey(name);
        return new Descriptor(this, target, name, propName, key, index);
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/locale/LocaleBeanUtilsBean$Descriptor.class */
    protected class Descriptor {
        private int index = -1;
        private String name;
        private String propName;
        private String key;
        private Object target;
        private final LocaleBeanUtilsBean this$0;

        public Descriptor(LocaleBeanUtilsBean localeBeanUtilsBean, Object target, String name, String propName, String key, int index) {
            this.this$0 = localeBeanUtilsBean;
            setTarget(target);
            setName(name);
            setPropName(propName);
            setKey(key);
            setIndex(index);
        }

        public Object getTarget() {
            return this.target;
        }

        public void setTarget(Object target) {
            this.target = target;
        }

        public String getKey() {
            return this.key;
        }

        public void setKey(String key) {
            this.key = key;
        }

        public int getIndex() {
            return this.index;
        }

        public void setIndex(int index) {
            this.index = index;
        }

        public String getName() {
            return this.name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPropName() {
            return this.propName;
        }

        public void setPropName(String propName) {
            this.propName = propName;
        }
    }
}
