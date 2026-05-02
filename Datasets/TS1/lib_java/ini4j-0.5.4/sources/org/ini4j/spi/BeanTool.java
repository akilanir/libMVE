package org.ini4j.spi;

import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.lang.reflect.Array;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.net.URI;
import java.net.URL;
import java.util.TimeZone;

/* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/BeanTool.class */
public class BeanTool {
    private static final String PARSE_METHOD = "valueOf";
    private static final BeanTool INSTANCE = (BeanTool) ServiceFinder.findService(BeanTool.class);

    public static final BeanTool getInstance() {
        return INSTANCE;
    }

    public void inject(Object bean, BeanAccess props) {
        Object value;
        PropertyDescriptor[] arr$ = getPropertyDescriptors(bean.getClass());
        for (PropertyDescriptor pd : arr$) {
            try {
                Method method = pd.getWriteMethod();
                String name = pd.getName();
                if (method != null && props.propLength(name) != 0) {
                    if (pd.getPropertyType().isArray()) {
                        value = Array.newInstance(pd.getPropertyType().getComponentType(), props.propLength(name));
                        for (int i = 0; i < props.propLength(name); i++) {
                            Array.set(value, i, parse(props.propGet(name, i), pd.getPropertyType().getComponentType()));
                        }
                    } else {
                        value = parse(props.propGet(name), pd.getPropertyType());
                    }
                    method.invoke(bean, value);
                }
            } catch (Exception x) {
                throw ((IllegalArgumentException) new IllegalArgumentException("Failed to set property: " + pd.getDisplayName()).initCause(x));
            }
        }
    }

    public void inject(BeanAccess props, Object bean) {
        Object value;
        PropertyDescriptor[] arr$ = getPropertyDescriptors(bean.getClass());
        for (PropertyDescriptor pd : arr$) {
            try {
                Method method = pd.getReadMethod();
                if (method != null && !"class".equals(pd.getName()) && (value = method.invoke(bean, (Object[]) null)) != null) {
                    if (pd.getPropertyType().isArray()) {
                        for (int i = 0; i < Array.getLength(value); i++) {
                            Object v = Array.get(value, i);
                            if (v != null && !v.getClass().equals(String.class)) {
                                v = v.toString();
                            }
                            props.propAdd(pd.getName(), (String) v);
                        }
                    } else {
                        props.propSet(pd.getName(), value.toString());
                    }
                }
            } catch (Exception x) {
                throw new IllegalArgumentException("Failed to set property: " + pd.getDisplayName(), x);
            }
        }
    }

    public <T> T parse(String str, Class<T> cls) throws IllegalArgumentException {
        Object parseSpecialValue;
        if (cls == null) {
            throw new IllegalArgumentException("null argument");
        }
        if (str == null) {
            parseSpecialValue = zero(cls);
        } else if (cls.isPrimitive()) {
            parseSpecialValue = parsePrimitiveValue(str, cls);
        } else if (cls == String.class) {
            parseSpecialValue = str;
        } else if (cls == Character.class) {
            parseSpecialValue = new Character(str.charAt(0));
        } else {
            parseSpecialValue = parseSpecialValue(str, cls);
        }
        return (T) parseSpecialValue;
    }

    public <T> T proxy(Class<T> clazz, BeanAccess props) {
        return clazz.cast(Proxy.newProxyInstance(Thread.currentThread().getContextClassLoader(), new Class[]{clazz}, new BeanInvocationHandler(props)));
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v13, types: [java.lang.Short] */
    /* JADX WARN: Type inference failed for: r0v15, types: [java.lang.Long] */
    /* JADX WARN: Type inference failed for: r0v17, types: [java.lang.Integer] */
    /* JADX WARN: Type inference failed for: r0v18, types: [java.lang.Float] */
    /* JADX WARN: Type inference failed for: r0v19, types: [java.lang.Double] */
    /* JADX WARN: Type inference failed for: r0v20, types: [java.lang.Character] */
    /* JADX WARN: Type inference failed for: r0v22, types: [java.lang.Byte] */
    /* JADX WARN: Type inference failed for: r0v23, types: [java.lang.Boolean] */
    public <T> T zero(Class<T> clazz) {
        T t = null;
        if (clazz.isPrimitive()) {
            if (clazz == Boolean.TYPE) {
                t = Boolean.FALSE;
            } else if (clazz == Byte.TYPE) {
                t = (byte) 0;
            } else if (clazz == Character.TYPE) {
                t = new Character((char) 0);
            } else if (clazz == Double.TYPE) {
                t = new Double(0.0d);
            } else if (clazz == Float.TYPE) {
                t = new Float(0.0f);
            } else if (clazz == Integer.TYPE) {
                t = 0;
            } else if (clazz == Long.TYPE) {
                t = 0L;
            } else if (clazz == Short.TYPE) {
                t = (short) 0;
            }
        }
        return t;
    }

    protected Object parseSpecialValue(String value, Class clazz) throws IllegalArgumentException {
        Object o;
        try {
            if (clazz == File.class) {
                o = new File(value);
            } else if (clazz == URL.class) {
                o = new URL(value);
            } else if (clazz == URI.class) {
                o = new URI(value);
            } else if (clazz == Class.class) {
                o = Class.forName(value);
            } else if (clazz == TimeZone.class) {
                o = TimeZone.getTimeZone(value);
            } else {
                Method parser = clazz.getMethod(PARSE_METHOD, String.class);
                o = parser.invoke(null, value);
            }
            return o;
        } catch (Exception x) {
            throw ((IllegalArgumentException) new IllegalArgumentException().initCause(x));
        }
    }

    private PropertyDescriptor[] getPropertyDescriptors(Class clazz) {
        try {
            return Introspector.getBeanInfo(clazz).getPropertyDescriptors();
        } catch (IntrospectionException x) {
            throw new IllegalArgumentException((Throwable) x);
        }
    }

    private Object parsePrimitiveValue(String value, Class clazz) throws IllegalArgumentException {
        Object o = null;
        try {
            if (clazz == Boolean.TYPE) {
                o = Boolean.valueOf(value);
            } else if (clazz == Byte.TYPE) {
                o = Byte.valueOf(value);
            } else if (clazz == Character.TYPE) {
                o = new Character(value.charAt(0));
            } else if (clazz == Double.TYPE) {
                o = Double.valueOf(value);
            } else if (clazz == Float.TYPE) {
                o = Float.valueOf(value);
            } else if (clazz == Integer.TYPE) {
                o = Integer.valueOf(value);
            } else if (clazz == Long.TYPE) {
                o = Long.valueOf(value);
            } else if (clazz == Short.TYPE) {
                o = Short.valueOf(value);
            }
            return o;
        } catch (Exception x) {
            throw ((IllegalArgumentException) new IllegalArgumentException().initCause(x));
        }
    }

    /* loaded from: ini4j-0.5.4.jar:org/ini4j/spi/BeanTool$BeanInvocationHandler.class */
    static class BeanInvocationHandler extends AbstractBeanInvocationHandler {
        private final BeanAccess _backend;

        BeanInvocationHandler(BeanAccess backend) {
            this._backend = backend;
        }

        @Override // org.ini4j.spi.AbstractBeanInvocationHandler
        protected Object getPropertySpi(String property, Class<?> clazz) {
            Object ret = null;
            if (clazz.isArray()) {
                int length = this._backend.propLength(property);
                if (length != 0) {
                    String[] all = new String[length];
                    for (int i = 0; i < all.length; i++) {
                        all[i] = this._backend.propGet(property, i);
                    }
                    ret = all;
                }
            } else {
                ret = this._backend.propGet(property);
            }
            return ret;
        }

        @Override // org.ini4j.spi.AbstractBeanInvocationHandler
        protected void setPropertySpi(String property, Object value, Class<?> clazz) {
            if (clazz.isArray()) {
                this._backend.propDel(property);
                for (int i = 0; i < Array.getLength(value); i++) {
                    this._backend.propAdd(property, Array.get(value, i).toString());
                }
                return;
            }
            this._backend.propSet(property, value.toString());
        }

        @Override // org.ini4j.spi.AbstractBeanInvocationHandler
        protected boolean hasPropertySpi(String property) {
            return this._backend.propLength(property) != 0;
        }
    }
}
