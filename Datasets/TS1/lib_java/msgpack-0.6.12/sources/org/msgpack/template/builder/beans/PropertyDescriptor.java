package org.msgpack.template.builder.beans;

import java.lang.reflect.Constructor;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import org.apache.harmony.beans.BeansUtils;
import org.apache.harmony.beans.internal.nls.Messages;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/builder/beans/PropertyDescriptor.class */
public class PropertyDescriptor extends FeatureDescriptor {
    private Method getter;
    private Method setter;
    private Class<?> propertyEditorClass;
    boolean constrained;
    boolean bound;

    public PropertyDescriptor(String propertyName, Class<?> beanClass, String getterName, String setterName) throws IntrospectionException {
        if (beanClass == null) {
            throw new IntrospectionException(Messages.getString("custom.beans.03"));
        }
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(Messages.getString("custom.beans.04"));
        }
        setName(propertyName);
        if (getterName != null) {
            if (getterName.length() == 0) {
                throw new IntrospectionException("read or write method cannot be empty.");
            }
            try {
                setReadMethod(beanClass, getterName);
            } catch (IntrospectionException e) {
                setReadMethod(beanClass, createDefaultMethodName(propertyName, BeansUtils.GET));
            }
        }
        if (setterName != null) {
            if (setterName.length() == 0) {
                throw new IntrospectionException("read or write method cannot be empty.");
            }
            setWriteMethod(beanClass, setterName);
        }
    }

    public PropertyDescriptor(String propertyName, Method getter, Method setter) throws IntrospectionException {
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(Messages.getString("custom.beans.04"));
        }
        setName(propertyName);
        setReadMethod(getter);
        setWriteMethod(setter);
    }

    public PropertyDescriptor(String propertyName, Class<?> beanClass) throws IntrospectionException {
        if (beanClass == null) {
            throw new IntrospectionException(Messages.getString("custom.beans.03"));
        }
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(Messages.getString("custom.beans.04"));
        }
        setName(propertyName);
        try {
            setReadMethod(beanClass, createDefaultMethodName(propertyName, BeansUtils.IS));
        } catch (Exception e) {
            setReadMethod(beanClass, createDefaultMethodName(propertyName, BeansUtils.GET));
        }
        setWriteMethod(beanClass, createDefaultMethodName(propertyName, BeansUtils.SET));
    }

    public void setWriteMethod(Method setter) throws IntrospectionException {
        if (setter != null) {
            int modifiers = setter.getModifiers();
            if (!Modifier.isPublic(modifiers)) {
                throw new IntrospectionException(Messages.getString("custom.beans.05"));
            }
            Class<?>[] parameterTypes = setter.getParameterTypes();
            if (parameterTypes.length != 1) {
                throw new IntrospectionException(Messages.getString("custom.beans.06"));
            }
            Class<?> parameterType = parameterTypes[0];
            Class<?> propertyType = getPropertyType();
            if (propertyType != null && !propertyType.equals(parameterType)) {
                throw new IntrospectionException(Messages.getString("custom.beans.07"));
            }
        }
        this.setter = setter;
    }

    public void setReadMethod(Method getter) throws IntrospectionException {
        if (getter != null) {
            int modifiers = getter.getModifiers();
            if (!Modifier.isPublic(modifiers)) {
                throw new IntrospectionException(Messages.getString("custom.beans.0A"));
            }
            Class<?>[] parameterTypes = getter.getParameterTypes();
            if (parameterTypes.length != 0) {
                throw new IntrospectionException(Messages.getString("custom.beans.08"));
            }
            Class<?> returnType = getter.getReturnType();
            if (returnType.equals(Void.TYPE)) {
                throw new IntrospectionException(Messages.getString("custom.beans.33"));
            }
            Class<?> propertyType = getPropertyType();
            if (propertyType != null && !returnType.equals(propertyType)) {
                throw new IntrospectionException(Messages.getString("custom.beans.09"));
            }
        }
        this.getter = getter;
    }

    public Method getWriteMethod() {
        return this.setter;
    }

    public Method getReadMethod() {
        return this.getter;
    }

    public boolean equals(Object object) {
        boolean result = object instanceof PropertyDescriptor;
        if (result) {
            PropertyDescriptor pd = (PropertyDescriptor) object;
            boolean gettersAreEqual = (this.getter == null && pd.getReadMethod() == null) || (this.getter != null && this.getter.equals(pd.getReadMethod()));
            boolean settersAreEqual = (this.setter == null && pd.getWriteMethod() == null) || (this.setter != null && this.setter.equals(pd.getWriteMethod()));
            boolean propertyTypesAreEqual = getPropertyType() == pd.getPropertyType();
            boolean propertyEditorClassesAreEqual = getPropertyEditorClass() == pd.getPropertyEditorClass();
            boolean boundPropertyAreEqual = isBound() == pd.isBound();
            boolean constrainedPropertyAreEqual = isConstrained() == pd.isConstrained();
            result = gettersAreEqual && settersAreEqual && propertyTypesAreEqual && propertyEditorClassesAreEqual && boundPropertyAreEqual && constrainedPropertyAreEqual;
        }
        return result;
    }

    public int hashCode() {
        return BeansUtils.getHashCode(this.getter) + BeansUtils.getHashCode(this.setter) + BeansUtils.getHashCode(getPropertyType()) + BeansUtils.getHashCode(getPropertyEditorClass()) + BeansUtils.getHashCode(isBound()) + BeansUtils.getHashCode(isConstrained());
    }

    public void setPropertyEditorClass(Class<?> propertyEditorClass) {
        this.propertyEditorClass = propertyEditorClass;
    }

    public Class<?> getPropertyType() {
        Class<?> result = null;
        if (this.getter != null) {
            result = this.getter.getReturnType();
        } else if (this.setter != null) {
            Class<?>[] parameterTypes = this.setter.getParameterTypes();
            result = parameterTypes[0];
        }
        return result;
    }

    public Class<?> getPropertyEditorClass() {
        return this.propertyEditorClass;
    }

    public void setConstrained(boolean constrained) {
        this.constrained = constrained;
    }

    public void setBound(boolean bound) {
        this.bound = bound;
    }

    public boolean isConstrained() {
        return this.constrained;
    }

    public boolean isBound() {
        return this.bound;
    }

    String createDefaultMethodName(String propertyName, String prefix) {
        String result = null;
        if (propertyName != null) {
            String bos = BeansUtils.toASCIIUpperCase(propertyName.substring(0, 1));
            String eos = propertyName.substring(1, propertyName.length());
            result = prefix + bos + eos;
        }
        return result;
    }

    void setReadMethod(Class<?> beanClass, String getterName) throws IntrospectionException {
        try {
            Method readMethod = beanClass.getMethod(getterName, new Class[0]);
            setReadMethod(readMethod);
        } catch (Exception e) {
            throw new IntrospectionException(e.getLocalizedMessage());
        }
    }

    void setWriteMethod(Class<?> beanClass, String setterName) throws IntrospectionException {
        Method writeMethod = null;
        try {
            if (this.getter != null) {
                writeMethod = beanClass.getMethod(setterName, this.getter.getReturnType());
            } else {
                for (Class<?> clazz = beanClass; clazz != null && writeMethod == null; clazz = clazz.getSuperclass()) {
                    Method[] methods = clazz.getDeclaredMethods();
                    int len$ = methods.length;
                    int i$ = 0;
                    while (true) {
                        if (i$ < len$) {
                            Method method = methods[i$];
                            if (!setterName.equals(method.getName()) || method.getParameterTypes().length != 1) {
                                i$++;
                            } else {
                                writeMethod = method;
                                break;
                            }
                        }
                    }
                }
            }
            if (writeMethod == null) {
                throw new IntrospectionException(Messages.getString("custom.beans.64", setterName));
            }
            setWriteMethod(writeMethod);
        } catch (Exception e) {
            throw new IntrospectionException(e.getLocalizedMessage());
        }
    }

    public PropertyEditor createPropertyEditor(Object bean) {
        PropertyEditor editor;
        if (this.propertyEditorClass == null) {
            return null;
        }
        if (!PropertyEditor.class.isAssignableFrom(this.propertyEditorClass)) {
            throw new ClassCastException(Messages.getString("custom.beans.48"));
        }
        try {
            try {
                Constructor<?> constr = this.propertyEditorClass.getConstructor(Object.class);
                editor = (PropertyEditor) constr.newInstance(bean);
            } catch (NoSuchMethodException e) {
                Constructor<?> constr2 = this.propertyEditorClass.getConstructor(new Class[0]);
                editor = (PropertyEditor) constr2.newInstance(new Object[0]);
            }
            return editor;
        } catch (Exception e2) {
            RuntimeException re = new RuntimeException(Messages.getString("custom.beans.47"), e2);
            throw re;
        }
    }
}
