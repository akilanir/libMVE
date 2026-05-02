package org.apache.commons.beanutils;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.ref.Reference;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/MappedPropertyDescriptor.class */
public class MappedPropertyDescriptor extends PropertyDescriptor {
    private Reference mappedPropertyTypeRef;
    private MappedMethodReference mappedReadMethodRef;
    private MappedMethodReference mappedWriteMethodRef;
    private static final Class[] STRING_CLASS_PARAMETER;
    static Class class$java$lang$String;
    static Class class$org$apache$commons$beanutils$MappedPropertyDescriptor;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    static {
        Class cls;
        Class[] clsArr = new Class[1];
        if (class$java$lang$String == null) {
            cls = class$("java.lang.String");
            class$java$lang$String = cls;
        } else {
            cls = class$java$lang$String;
        }
        clsArr[0] = cls;
        STRING_CLASS_PARAMETER = clsArr;
    }

    public MappedPropertyDescriptor(String propertyName, Class beanClass) throws IntrospectionException {
        Class cls;
        super(propertyName, (Method) null, (Method) null);
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(new StringBuffer().append("bad property name: ").append(propertyName).append(" on class: ").append(beanClass.getClass().getName()).toString());
        }
        setName(propertyName);
        String base = capitalizePropertyName(propertyName);
        Method mappedReadMethod = null;
        Method mappedWriteMethod = null;
        try {
            try {
                mappedReadMethod = getMethod(beanClass, new StringBuffer().append("get").append(base).toString(), STRING_CLASS_PARAMETER);
            } catch (IntrospectionException e) {
                mappedReadMethod = getMethod(beanClass, new StringBuffer().append("is").append(base).toString(), STRING_CLASS_PARAMETER);
            }
            Class[] params = new Class[2];
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            params[0] = cls;
            params[1] = mappedReadMethod.getReturnType();
            mappedWriteMethod = getMethod(beanClass, new StringBuffer().append("set").append(base).toString(), params);
        } catch (IntrospectionException e2) {
        }
        mappedWriteMethod = mappedReadMethod == null ? getMethod(beanClass, new StringBuffer().append("set").append(base).toString(), 2) : mappedWriteMethod;
        if (mappedReadMethod == null && mappedWriteMethod == null) {
            throw new IntrospectionException(new StringBuffer().append("Property '").append(propertyName).append("' not found on ").append(beanClass.getName()).toString());
        }
        this.mappedReadMethodRef = new MappedMethodReference(mappedReadMethod);
        this.mappedWriteMethodRef = new MappedMethodReference(mappedWriteMethod);
        findMappedPropertyType();
    }

    public MappedPropertyDescriptor(String propertyName, Class beanClass, String mappedGetterName, String mappedSetterName) throws IntrospectionException {
        Method mappedWriteMethod;
        Class cls;
        super(propertyName, (Method) null, (Method) null);
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(new StringBuffer().append("bad property name: ").append(propertyName).toString());
        }
        setName(propertyName);
        Method mappedReadMethod = getMethod(beanClass, mappedGetterName, STRING_CLASS_PARAMETER);
        if (mappedReadMethod != null) {
            Class[] params = new Class[2];
            if (class$java$lang$String == null) {
                cls = class$("java.lang.String");
                class$java$lang$String = cls;
            } else {
                cls = class$java$lang$String;
            }
            params[0] = cls;
            params[1] = mappedReadMethod.getReturnType();
            mappedWriteMethod = getMethod(beanClass, mappedSetterName, params);
        } else {
            mappedWriteMethod = getMethod(beanClass, mappedSetterName, 2);
        }
        this.mappedReadMethodRef = new MappedMethodReference(mappedReadMethod);
        this.mappedWriteMethodRef = new MappedMethodReference(mappedWriteMethod);
        findMappedPropertyType();
    }

    public MappedPropertyDescriptor(String propertyName, Method mappedGetter, Method mappedSetter) throws IntrospectionException {
        super(propertyName, mappedGetter, mappedSetter);
        if (propertyName == null || propertyName.length() == 0) {
            throw new IntrospectionException(new StringBuffer().append("bad property name: ").append(propertyName).toString());
        }
        setName(propertyName);
        this.mappedReadMethodRef = new MappedMethodReference(mappedGetter);
        this.mappedWriteMethodRef = new MappedMethodReference(mappedSetter);
        findMappedPropertyType();
    }

    public Class getMappedPropertyType() {
        return (Class) this.mappedPropertyTypeRef.get();
    }

    public Method getMappedReadMethod() {
        return this.mappedReadMethodRef.get();
    }

    public void setMappedReadMethod(Method mappedGetter) throws IntrospectionException {
        this.mappedReadMethodRef = new MappedMethodReference(mappedGetter);
        findMappedPropertyType();
    }

    public Method getMappedWriteMethod() {
        return this.mappedWriteMethodRef.get();
    }

    public void setMappedWriteMethod(Method mappedSetter) throws IntrospectionException {
        this.mappedWriteMethodRef = new MappedMethodReference(mappedSetter);
        findMappedPropertyType();
    }

    private void findMappedPropertyType() throws IntrospectionException {
        try {
            Method mappedReadMethod = getMappedReadMethod();
            Method mappedWriteMethod = getMappedWriteMethod();
            Class mappedPropertyType = null;
            if (mappedReadMethod != null) {
                if (mappedReadMethod.getParameterTypes().length != 1) {
                    throw new IntrospectionException("bad mapped read method arg count");
                }
                mappedPropertyType = mappedReadMethod.getReturnType();
                if (mappedPropertyType == Void.TYPE) {
                    throw new IntrospectionException(new StringBuffer().append("mapped read method ").append(mappedReadMethod.getName()).append(" returns void").toString());
                }
            }
            if (mappedWriteMethod != null) {
                Class[] params = mappedWriteMethod.getParameterTypes();
                if (params.length != 2) {
                    throw new IntrospectionException("bad mapped write method arg count");
                }
                if (mappedPropertyType != null && mappedPropertyType != params[1]) {
                    throw new IntrospectionException("type mismatch between mapped read and write methods");
                }
                mappedPropertyType = params[1];
            }
            this.mappedPropertyTypeRef = new SoftReference(mappedPropertyType);
        } catch (IntrospectionException ex) {
            throw ex;
        }
    }

    private static String capitalizePropertyName(String s) {
        if (s.length() == 0) {
            return s;
        }
        char[] chars = s.toCharArray();
        chars[0] = Character.toUpperCase(chars[0]);
        return new String(chars);
    }

    private static Method internalGetMethod(Class initial, String methodName, int parameterCount) {
        Class cls = initial;
        while (true) {
            Class clazz = cls;
            if (clazz != null) {
                Method[] methods = clazz.getDeclaredMethods();
                for (Method method : methods) {
                    if (method != null) {
                        int mods = method.getModifiers();
                        if (Modifier.isPublic(mods) && !Modifier.isStatic(mods) && method.getName().equals(methodName) && method.getParameterTypes().length == parameterCount) {
                            return method;
                        }
                    }
                }
                cls = clazz.getSuperclass();
            } else {
                Class[] interfaces = initial.getInterfaces();
                for (Class cls2 : interfaces) {
                    Method method2 = internalGetMethod(cls2, methodName, parameterCount);
                    if (method2 != null) {
                        return method2;
                    }
                }
                return null;
            }
        }
    }

    private static Method getMethod(Class clazz, String methodName, int parameterCount) throws IntrospectionException {
        if (methodName == null) {
            return null;
        }
        Method method = internalGetMethod(clazz, methodName, parameterCount);
        if (method != null) {
            return method;
        }
        throw new IntrospectionException(new StringBuffer().append("No method \"").append(methodName).append("\" with ").append(parameterCount).append(" parameter(s)").toString());
    }

    private static Method getMethod(Class clazz, String methodName, Class[] parameterTypes) throws IntrospectionException {
        if (methodName == null) {
            return null;
        }
        Method method = MethodUtils.getMatchingAccessibleMethod(clazz, methodName, parameterTypes);
        if (method != null) {
            return method;
        }
        int parameterCount = parameterTypes == null ? 0 : parameterTypes.length;
        throw new IntrospectionException(new StringBuffer().append("No method \"").append(methodName).append("\" with ").append(parameterCount).append(" parameter(s) of matching types.").toString());
    }

    /* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/MappedPropertyDescriptor$MappedMethodReference.class */
    private static class MappedMethodReference {
        private String className;
        private String methodName;
        private Reference methodRef;
        private Reference classRef;
        private Reference writeParamTypeRef0;
        private Reference writeParamTypeRef1;
        private String[] writeParamClassNames;

        MappedMethodReference(Method m) {
            if (m != null) {
                this.className = m.getDeclaringClass().getName();
                this.methodName = m.getName();
                this.methodRef = new SoftReference(m);
                this.classRef = new WeakReference(m.getDeclaringClass());
                Class[] types = m.getParameterTypes();
                if (types.length == 2) {
                    this.writeParamTypeRef0 = new WeakReference(types[0]);
                    this.writeParamTypeRef1 = new WeakReference(types[1]);
                    this.writeParamClassNames = new String[2];
                    this.writeParamClassNames[0] = types[0].getName();
                    this.writeParamClassNames[1] = types[1].getName();
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public Method get() {
            Class[] paramTypes;
            if (this.methodRef == null) {
                return null;
            }
            Method m = (Method) this.methodRef.get();
            if (m == null) {
                Class clazz = (Class) this.classRef.get();
                if (clazz == null) {
                    clazz = reLoadClass();
                    if (clazz != null) {
                        this.classRef = new WeakReference(clazz);
                    }
                }
                if (clazz == null) {
                    throw new RuntimeException(new StringBuffer().append("Method ").append(this.methodName).append(" for ").append(this.className).append(" could not be reconstructed - class reference has gone").toString());
                }
                if (this.writeParamClassNames == null) {
                    paramTypes = MappedPropertyDescriptor.STRING_CLASS_PARAMETER;
                } else {
                    paramTypes = new Class[2];
                    paramTypes[0] = (Class) this.writeParamTypeRef0.get();
                    if (paramTypes[0] == null) {
                        paramTypes[0] = reLoadClass(this.writeParamClassNames[0]);
                        if (paramTypes[0] != null) {
                            this.writeParamTypeRef0 = new WeakReference(paramTypes[0]);
                        }
                    }
                    paramTypes[1] = (Class) this.writeParamTypeRef1.get();
                    if (paramTypes[1] == null) {
                        paramTypes[1] = reLoadClass(this.writeParamClassNames[1]);
                        if (paramTypes[1] != null) {
                            this.writeParamTypeRef1 = new WeakReference(paramTypes[1]);
                        }
                    }
                }
                try {
                    m = clazz.getMethod(this.methodName, paramTypes);
                    this.methodRef = new SoftReference(m);
                } catch (NoSuchMethodException e) {
                    throw new RuntimeException(new StringBuffer().append("Method ").append(this.methodName).append(" for ").append(this.className).append(" could not be reconstructed - method not found").toString());
                }
            }
            return m;
        }

        private Class reLoadClass() {
            return reLoadClass(this.className);
        }

        private Class reLoadClass(String name) {
            Class cls;
            ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
            if (classLoader != null) {
                try {
                    return classLoader.loadClass(name);
                } catch (ClassNotFoundException e) {
                }
            }
            if (MappedPropertyDescriptor.class$org$apache$commons$beanutils$MappedPropertyDescriptor == null) {
                cls = MappedPropertyDescriptor.class$("org.apache.commons.beanutils.MappedPropertyDescriptor");
                MappedPropertyDescriptor.class$org$apache$commons$beanutils$MappedPropertyDescriptor = cls;
            } else {
                cls = MappedPropertyDescriptor.class$org$apache$commons$beanutils$MappedPropertyDescriptor;
            }
            try {
                return cls.getClassLoader().loadClass(name);
            } catch (ClassNotFoundException e2) {
                return null;
            }
        }
    }
}
