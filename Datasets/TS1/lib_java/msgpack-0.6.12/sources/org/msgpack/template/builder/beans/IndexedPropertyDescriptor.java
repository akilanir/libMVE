package org.msgpack.template.builder.beans;

import java.lang.reflect.Method;
import org.apache.harmony.beans.BeansUtils;
import org.apache.harmony.beans.internal.nls.Messages;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/IndexedPropertyDescriptor.class */
public class IndexedPropertyDescriptor extends PropertyDescriptor {
    private Class<?> indexedPropertyType;
    private Method indexedGetter;
    private Method indexedSetter;

    public IndexedPropertyDescriptor(String propertyName, Class<?> beanClass, String getterName, String setterName, String indexedGetterName, String indexedSetterName) throws IntrospectionException {
        super(propertyName, beanClass, getterName, setterName);
        setIndexedByName(beanClass, indexedGetterName, indexedSetterName);
    }

    private void setIndexedByName(Class<?> beanClass, String indexedGetterName, String indexedSetterName) throws IntrospectionException {
        String theIndexedGetterName = indexedGetterName;
        if (theIndexedGetterName == null) {
            if (indexedSetterName != null) {
                setIndexedWriteMethod(beanClass, indexedSetterName);
            }
        } else {
            if (theIndexedGetterName.length() == 0) {
                theIndexedGetterName = BeansUtils.GET + this.name;
            }
            setIndexedReadMethod(beanClass, theIndexedGetterName);
            if (indexedSetterName != null) {
                setIndexedWriteMethod(beanClass, indexedSetterName, this.indexedPropertyType);
            }
        }
        if (!isCompatible()) {
            throw new IntrospectionException(Messages.getString("custom.beans.57"));
        }
    }

    private boolean isCompatible() {
        Class<?> propertyType = getPropertyType();
        if (propertyType == null) {
            return true;
        }
        Class<?> componentTypeOfProperty = propertyType.getComponentType();
        if (componentTypeOfProperty == null || this.indexedPropertyType == null) {
            return false;
        }
        return componentTypeOfProperty.getName().equals(this.indexedPropertyType.getName());
    }

    public IndexedPropertyDescriptor(String propertyName, Method getter, Method setter, Method indexedGetter, Method indexedSetter) throws IntrospectionException {
        super(propertyName, getter, setter);
        if (indexedGetter != null) {
            internalSetIndexedReadMethod(indexedGetter);
            internalSetIndexedWriteMethod(indexedSetter, true);
        } else {
            internalSetIndexedWriteMethod(indexedSetter, true);
            internalSetIndexedReadMethod(indexedGetter);
        }
        if (!isCompatible()) {
            throw new IntrospectionException(Messages.getString("custom.beans.57"));
        }
    }

    public IndexedPropertyDescriptor(String propertyName, Class<?> beanClass) throws IntrospectionException {
        super(propertyName, beanClass);
        setIndexedByName(beanClass, BeansUtils.GET.concat(initialUpperCase(propertyName)), BeansUtils.SET.concat(initialUpperCase(propertyName)));
    }

    public void setIndexedReadMethod(Method indexedGetter) throws IntrospectionException {
        internalSetIndexedReadMethod(indexedGetter);
    }

    public void setIndexedWriteMethod(Method indexedSetter) throws IntrospectionException {
        internalSetIndexedWriteMethod(indexedSetter, false);
    }

    public Method getIndexedWriteMethod() {
        return this.indexedSetter;
    }

    public Method getIndexedReadMethod() {
        return this.indexedGetter;
    }

    @Override // org.msgpack.template.builder.beans.PropertyDescriptor
    public boolean equals(Object obj) {
        if (!(obj instanceof IndexedPropertyDescriptor)) {
            return false;
        }
        IndexedPropertyDescriptor other = (IndexedPropertyDescriptor) obj;
        return super.equals(other) && (this.indexedPropertyType != null ? this.indexedPropertyType.equals(other.indexedPropertyType) : other.indexedPropertyType == null) && (this.indexedGetter != null ? this.indexedGetter.equals(other.indexedGetter) : other.indexedGetter == null) && (this.indexedSetter != null ? this.indexedSetter.equals(other.indexedSetter) : other.indexedSetter == null);
    }

    @Override // org.msgpack.template.builder.beans.PropertyDescriptor
    public int hashCode() {
        return super.hashCode() + BeansUtils.getHashCode(this.indexedPropertyType) + BeansUtils.getHashCode(this.indexedGetter) + BeansUtils.getHashCode(this.indexedSetter);
    }

    public Class<?> getIndexedPropertyType() {
        return this.indexedPropertyType;
    }

    private void setIndexedReadMethod(Class<?> beanClass, String indexedGetterName) throws IntrospectionException {
        try {
            Method getter = beanClass.getMethod(indexedGetterName, Integer.TYPE);
            internalSetIndexedReadMethod(getter);
        } catch (NoSuchMethodException e) {
            throw new IntrospectionException(Messages.getString("custom.beans.58"));
        } catch (SecurityException e2) {
            throw new IntrospectionException(Messages.getString("custom.beans.59"));
        }
    }

    private void internalSetIndexedReadMethod(Method indexGetter) throws IntrospectionException {
        if (indexGetter == null) {
            if (this.indexedSetter == null) {
                if (getPropertyType() != null) {
                    throw new IntrospectionException(Messages.getString("custom.beans.5A"));
                }
                this.indexedPropertyType = null;
            }
            this.indexedGetter = null;
            return;
        }
        if (indexGetter.getParameterTypes().length != 1 || indexGetter.getParameterTypes()[0] != Integer.TYPE) {
            throw new IntrospectionException(Messages.getString("custom.beans.5B"));
        }
        Class<?> indexedReadType = indexGetter.getReturnType();
        if (indexedReadType == Void.TYPE) {
            throw new IntrospectionException(Messages.getString("custom.beans.5B"));
        }
        if (this.indexedSetter != null && indexGetter.getReturnType() != this.indexedSetter.getParameterTypes()[1]) {
            throw new IntrospectionException(Messages.getString("custom.beans.5A"));
        }
        if (this.indexedGetter == null) {
            this.indexedPropertyType = indexedReadType;
        } else if (this.indexedPropertyType != indexedReadType) {
            throw new IntrospectionException(Messages.getString("custom.beans.5A"));
        }
        this.indexedGetter = indexGetter;
    }

    private void setIndexedWriteMethod(Class<?> beanClass, String indexedSetterName) throws IntrospectionException {
        try {
            Method setter = beanClass.getMethod(indexedSetterName, Integer.TYPE, getPropertyType().getComponentType());
            internalSetIndexedWriteMethod(setter, true);
        } catch (NoSuchMethodException e) {
            throw new IntrospectionException(Messages.getString("custom.beans.5D"));
        } catch (SecurityException e2) {
            throw new IntrospectionException(Messages.getString("custom.beans.5C"));
        }
    }

    private void setIndexedWriteMethod(Class<?> beanClass, String indexedSetterName, Class<?> argType) throws IntrospectionException {
        try {
            Method setter = beanClass.getMethod(indexedSetterName, Integer.TYPE, argType);
            internalSetIndexedWriteMethod(setter, true);
        } catch (NoSuchMethodException e) {
            throw new IntrospectionException(Messages.getString("custom.beans.5D"));
        } catch (SecurityException e2) {
            throw new IntrospectionException(Messages.getString("custom.beans.5C"));
        }
    }

    private void internalSetIndexedWriteMethod(Method indexSetter, boolean initialize) throws IntrospectionException {
        if (indexSetter == null) {
            if (this.indexedGetter == null) {
                if (getPropertyType() != null) {
                    throw new IntrospectionException(Messages.getString("custom.beans.5E"));
                }
                this.indexedPropertyType = null;
            }
            this.indexedSetter = null;
            return;
        }
        Class<?>[] indexedSetterArgs = indexSetter.getParameterTypes();
        if (indexedSetterArgs.length != 2) {
            throw new IntrospectionException(Messages.getString("custom.beans.5F"));
        }
        if (indexedSetterArgs[0] != Integer.TYPE) {
            throw new IntrospectionException(Messages.getString("custom.beans.60"));
        }
        Class<?> indexedWriteType = indexedSetterArgs[1];
        if (initialize && this.indexedGetter == null) {
            this.indexedPropertyType = indexedWriteType;
        } else if (this.indexedPropertyType != indexedWriteType) {
            throw new IntrospectionException(Messages.getString("custom.beans.61"));
        }
        this.indexedSetter = indexSetter;
    }

    private static String initialUpperCase(String string) {
        if (Character.isUpperCase(string.charAt(0))) {
            return string;
        }
        String initial = string.substring(0, 1).toUpperCase();
        return initial.concat(string.substring(1));
    }
}
