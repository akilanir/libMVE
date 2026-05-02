package org.apache.commons.beanutils;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/LazyDynaBean.class */
public class LazyDynaBean implements DynaBean, Serializable {
    private transient Log logger;
    protected static final BigInteger BigInteger_ZERO = new BigInteger("0");
    protected static final BigDecimal BigDecimal_ZERO = new BigDecimal("0");
    protected static final Character Character_SPACE = new Character(' ');
    protected static final Byte Byte_ZERO = new Byte((byte) 0);
    protected static final Short Short_ZERO = new Short((short) 0);
    protected static final Integer Integer_ZERO = new Integer(0);
    protected static final Long Long_ZERO = new Long(0);
    protected static final Float Float_ZERO = new Float(0.0f);
    protected static final Double Double_ZERO = new Double(0.0d);
    protected Map values;
    private transient Map mapDecorator;
    protected MutableDynaClass dynaClass;
    static Class class$org$apache$commons$beanutils$LazyDynaBean;
    static Class class$java$util$List;
    static Class class$java$util$Map;
    static Class class$org$apache$commons$beanutils$DynaBean;
    static Class class$java$lang$Number;
    static Class class$java$lang$Object;
    static Class class$java$lang$String;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Character;
    static Class class$java$util$Date;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Short;

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public LazyDynaBean() {
        this(new LazyDynaClass());
    }

    public LazyDynaBean(String name) {
        this(new LazyDynaClass(name));
    }

    public LazyDynaBean(DynaClass dynaClass) {
        Class cls;
        if (class$org$apache$commons$beanutils$LazyDynaBean == null) {
            cls = class$("org.apache.commons.beanutils.LazyDynaBean");
            class$org$apache$commons$beanutils$LazyDynaBean = cls;
        } else {
            cls = class$org$apache$commons$beanutils$LazyDynaBean;
        }
        this.logger = LogFactory.getLog(cls);
        this.values = newMap();
        if (dynaClass instanceof MutableDynaClass) {
            this.dynaClass = (MutableDynaClass) dynaClass;
        } else {
            this.dynaClass = new LazyDynaClass(dynaClass.getName(), dynaClass.getDynaProperties());
        }
    }

    public Map getMap() {
        if (this.mapDecorator == null) {
            this.mapDecorator = new DynaBeanMapDecorator(this);
        }
        return this.mapDecorator;
    }

    public int size(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        Object value = this.values.get(name);
        if (value == null) {
            return 0;
        }
        if (value instanceof Map) {
            return ((Map) value).size();
        }
        if (value instanceof List) {
            return ((List) value).size();
        }
        if (value.getClass().isArray()) {
            return Array.getLength(value);
        }
        return 0;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public boolean contains(String name, String key) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        Object value = this.values.get(name);
        if (value != null && (value instanceof Map)) {
            return ((Map) value).containsKey(key);
        }
        return false;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        Object value = this.values.get(name);
        if (value != null) {
            return value;
        }
        if (!isDynaProperty(name)) {
            return null;
        }
        Object value2 = createProperty(name, this.dynaClass.getDynaProperty(name).getType());
        if (value2 != null) {
            set(name, value2);
        }
        return value2;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, int index) {
        if (!isDynaProperty(name)) {
            set(name, defaultIndexedProperty(name));
        }
        Object indexedProperty = get(name);
        if (!this.dynaClass.getDynaProperty(name).isIndexed()) {
            throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]' ").append(this.dynaClass.getDynaProperty(name).getName()).toString());
        }
        Object indexedProperty2 = growIndexedProperty(name, indexedProperty, index);
        if (indexedProperty2.getClass().isArray()) {
            return Array.get(indexedProperty2, index);
        }
        if (indexedProperty2 instanceof List) {
            return ((List) indexedProperty2).get(index);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]' ").append(indexedProperty2.getClass().getName()).toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, String key) {
        if (!isDynaProperty(name)) {
            set(name, defaultMappedProperty(name));
        }
        Object mappedProperty = get(name);
        if (!this.dynaClass.getDynaProperty(name).isMapped()) {
            throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")' ").append(this.dynaClass.getDynaProperty(name).getType().getName()).toString());
        }
        if (mappedProperty instanceof Map) {
            return ((Map) mappedProperty).get(key);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").append(mappedProperty.getClass().getName()).toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public DynaClass getDynaClass() {
        return this.dynaClass;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void remove(String name, String key) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        Object value = this.values.get(name);
        if (value == null) {
            return;
        }
        if (value instanceof Map) {
            ((Map) value).remove(key);
            return;
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").append(value.getClass().getName()).toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        if (!isDynaProperty(name)) {
            if (this.dynaClass.isRestricted()) {
                throw new IllegalArgumentException(new StringBuffer().append("Invalid property name '").append(name).append("' (DynaClass is restricted)").toString());
            }
            if (value == null) {
                this.dynaClass.add(name);
            } else {
                this.dynaClass.add(name, value.getClass());
            }
        }
        DynaProperty descriptor = this.dynaClass.getDynaProperty(name);
        if (value == null) {
            if (descriptor.getType().isPrimitive()) {
                throw new NullPointerException(new StringBuffer().append("Primitive value for '").append(name).append("'").toString());
            }
        } else if (!isAssignable(descriptor.getType(), value.getClass())) {
            throw new ConversionException(new StringBuffer().append("Cannot assign value of type '").append(value.getClass().getName()).append("' to property '").append(name).append("' of type '").append(descriptor.getType().getName()).append("'").toString());
        }
        this.values.put(name, value);
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, int index, Object value) {
        if (!isDynaProperty(name)) {
            set(name, defaultIndexedProperty(name));
        }
        Object indexedProperty = get(name);
        if (!this.dynaClass.getDynaProperty(name).isIndexed()) {
            throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]'").append(this.dynaClass.getDynaProperty(name).getType().getName()).toString());
        }
        Object indexedProperty2 = growIndexedProperty(name, indexedProperty, index);
        if (indexedProperty2.getClass().isArray()) {
            Array.set(indexedProperty2, index, value);
        } else {
            if (indexedProperty2 instanceof List) {
                ((List) indexedProperty2).set(index, value);
                return;
            }
            throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]' ").append(indexedProperty2.getClass().getName()).toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, String key, Object value) {
        if (!isDynaProperty(name)) {
            set(name, defaultMappedProperty(name));
        }
        Object mappedProperty = get(name);
        if (!this.dynaClass.getDynaProperty(name).isMapped()) {
            throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").append(this.dynaClass.getDynaProperty(name).getType().getName()).toString());
        }
        ((Map) mappedProperty).put(key, value);
    }

    protected Object growIndexedProperty(String name, Object indexedProperty, int index) {
        int length;
        if (indexedProperty instanceof List) {
            List list = (List) indexedProperty;
            while (index >= list.size()) {
                Class contentType = getDynaClass().getDynaProperty(name).getContentType();
                Object value = null;
                if (contentType != null) {
                    value = createProperty(new StringBuffer().append(name).append("[").append(list.size()).append("]").toString(), contentType);
                }
                list.add(value);
            }
        }
        if (indexedProperty.getClass().isArray() && index >= (length = Array.getLength(indexedProperty))) {
            Class componentType = indexedProperty.getClass().getComponentType();
            Object newArray = Array.newInstance((Class<?>) componentType, index + 1);
            System.arraycopy(indexedProperty, 0, newArray, 0, length);
            indexedProperty = newArray;
            set(name, indexedProperty);
            int newLength = Array.getLength(indexedProperty);
            for (int i = length; i < newLength; i++) {
                Array.set(indexedProperty, i, createProperty(new StringBuffer().append(name).append("[").append(i).append("]").toString(), componentType));
            }
        }
        return indexedProperty;
    }

    protected Object createProperty(String name, Class type) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        if (type == null) {
            return null;
        }
        if (!type.isArray()) {
            if (class$java$util$List == null) {
                cls = class$("java.util.List");
                class$java$util$List = cls;
            } else {
                cls = class$java$util$List;
            }
            if (!cls.isAssignableFrom(type)) {
                if (class$java$util$Map == null) {
                    cls2 = class$("java.util.Map");
                    class$java$util$Map = cls2;
                } else {
                    cls2 = class$java$util$Map;
                }
                if (cls2.isAssignableFrom(type)) {
                    return createMappedProperty(name, type);
                }
                if (class$org$apache$commons$beanutils$DynaBean == null) {
                    cls3 = class$("org.apache.commons.beanutils.DynaBean");
                    class$org$apache$commons$beanutils$DynaBean = cls3;
                } else {
                    cls3 = class$org$apache$commons$beanutils$DynaBean;
                }
                if (cls3.isAssignableFrom(type)) {
                    return createDynaBeanProperty(name, type);
                }
                if (type.isPrimitive()) {
                    return createPrimitiveProperty(name, type);
                }
                if (class$java$lang$Number == null) {
                    cls4 = class$("java.lang.Number");
                    class$java$lang$Number = cls4;
                } else {
                    cls4 = class$java$lang$Number;
                }
                if (cls4.isAssignableFrom(type)) {
                    return createNumberProperty(name, type);
                }
                return createOtherProperty(name, type);
            }
        }
        return createIndexedProperty(name, type);
    }

    protected Object createIndexedProperty(String name, Class type) {
        Class cls;
        Object indexedProperty;
        if (type == null) {
            indexedProperty = defaultIndexedProperty(name);
        } else if (type.isArray()) {
            indexedProperty = Array.newInstance(type.getComponentType(), 0);
        } else {
            if (class$java$util$List == null) {
                cls = class$("java.util.List");
                class$java$util$List = cls;
            } else {
                cls = class$java$util$List;
            }
            if (cls.isAssignableFrom(type)) {
                if (type.isInterface()) {
                    indexedProperty = defaultIndexedProperty(name);
                } else {
                    try {
                        indexedProperty = type.newInstance();
                    } catch (Exception ex) {
                        throw new IllegalArgumentException(new StringBuffer().append("Error instantiating indexed property of type '").append(type.getName()).append("' for '").append(name).append("' ").append(ex).toString());
                    }
                }
            } else {
                throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property of type '").append(type.getName()).append("' for '").append(name).append("'").toString());
            }
        }
        return indexedProperty;
    }

    protected Object createMappedProperty(String name, Class type) {
        Class cls;
        Object mappedProperty;
        if (type == null || type.isInterface()) {
            mappedProperty = defaultMappedProperty(name);
        } else {
            if (class$java$util$Map == null) {
                cls = class$("java.util.Map");
                class$java$util$Map = cls;
            } else {
                cls = class$java$util$Map;
            }
            if (cls.isAssignableFrom(type)) {
                try {
                    mappedProperty = type.newInstance();
                } catch (Exception ex) {
                    throw new IllegalArgumentException(new StringBuffer().append("Error instantiating mapped property of type '").append(type.getName()).append("' for '").append(name).append("' ").append(ex).toString());
                }
            } else {
                throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property of type '").append(type.getName()).append("' for '").append(name).append("'").toString());
            }
        }
        return mappedProperty;
    }

    protected Object createDynaBeanProperty(String name, Class type) {
        try {
            return type.newInstance();
        } catch (Exception ex) {
            if (logger().isWarnEnabled()) {
                logger().warn(new StringBuffer().append("Error instantiating DynaBean property of type '").append(type.getName()).append("' for '").append(name).append("' ").append(ex).toString());
                return null;
            }
            return null;
        }
    }

    protected Object createPrimitiveProperty(String name, Class type) {
        if (type == Boolean.TYPE) {
            return Boolean.FALSE;
        }
        if (type == Integer.TYPE) {
            return Integer_ZERO;
        }
        if (type == Long.TYPE) {
            return Long_ZERO;
        }
        if (type == Double.TYPE) {
            return Double_ZERO;
        }
        if (type == Float.TYPE) {
            return Float_ZERO;
        }
        if (type == Byte.TYPE) {
            return Byte_ZERO;
        }
        if (type == Short.TYPE) {
            return Short_ZERO;
        }
        if (type == Character.TYPE) {
            return Character_SPACE;
        }
        return null;
    }

    protected Object createNumberProperty(String name, Class type) {
        return null;
    }

    protected Object createOtherProperty(String name, Class type) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        if (class$java$lang$Object == null) {
            cls = class$("java.lang.Object");
            class$java$lang$Object = cls;
        } else {
            cls = class$java$lang$Object;
        }
        if (type == cls) {
            return null;
        }
        if (class$java$lang$String == null) {
            cls2 = class$("java.lang.String");
            class$java$lang$String = cls2;
        } else {
            cls2 = class$java$lang$String;
        }
        if (type == cls2) {
            return null;
        }
        if (class$java$lang$Boolean == null) {
            cls3 = class$("java.lang.Boolean");
            class$java$lang$Boolean = cls3;
        } else {
            cls3 = class$java$lang$Boolean;
        }
        if (type == cls3) {
            return null;
        }
        if (class$java$lang$Character == null) {
            cls4 = class$("java.lang.Character");
            class$java$lang$Character = cls4;
        } else {
            cls4 = class$java$lang$Character;
        }
        if (type == cls4) {
            return null;
        }
        if (class$java$util$Date == null) {
            cls5 = class$("java.util.Date");
            class$java$util$Date = cls5;
        } else {
            cls5 = class$java$util$Date;
        }
        if (cls5.isAssignableFrom(type)) {
            return null;
        }
        try {
            return type.newInstance();
        } catch (Exception ex) {
            if (logger().isWarnEnabled()) {
                logger().warn(new StringBuffer().append("Error instantiating property of type '").append(type.getName()).append("' for '").append(name).append("' ").append(ex).toString());
                return null;
            }
            return null;
        }
    }

    protected Object defaultIndexedProperty(String name) {
        return new ArrayList();
    }

    protected Map defaultMappedProperty(String name) {
        return new HashMap();
    }

    protected boolean isDynaProperty(String name) {
        if (name == null) {
            throw new IllegalArgumentException("No property name specified");
        }
        if (this.dynaClass instanceof LazyDynaClass) {
            return ((LazyDynaClass) this.dynaClass).isDynaProperty(name);
        }
        return this.dynaClass.getDynaProperty(name) != null;
    }

    protected boolean isAssignable(Class dest, Class source) {
        Class cls;
        Class cls2;
        Class cls3;
        Class cls4;
        Class cls5;
        Class cls6;
        Class cls7;
        Class cls8;
        if (dest.isAssignableFrom(source)) {
            return true;
        }
        if (dest == Boolean.TYPE) {
            if (class$java$lang$Boolean == null) {
                cls8 = class$("java.lang.Boolean");
                class$java$lang$Boolean = cls8;
            } else {
                cls8 = class$java$lang$Boolean;
            }
            if (source == cls8) {
                return true;
            }
        }
        if (dest == Byte.TYPE) {
            if (class$java$lang$Byte == null) {
                cls7 = class$("java.lang.Byte");
                class$java$lang$Byte = cls7;
            } else {
                cls7 = class$java$lang$Byte;
            }
            if (source == cls7) {
                return true;
            }
        }
        if (dest == Character.TYPE) {
            if (class$java$lang$Character == null) {
                cls6 = class$("java.lang.Character");
                class$java$lang$Character = cls6;
            } else {
                cls6 = class$java$lang$Character;
            }
            if (source == cls6) {
                return true;
            }
        }
        if (dest == Double.TYPE) {
            if (class$java$lang$Double == null) {
                cls5 = class$("java.lang.Double");
                class$java$lang$Double = cls5;
            } else {
                cls5 = class$java$lang$Double;
            }
            if (source == cls5) {
                return true;
            }
        }
        if (dest == Float.TYPE) {
            if (class$java$lang$Float == null) {
                cls4 = class$("java.lang.Float");
                class$java$lang$Float = cls4;
            } else {
                cls4 = class$java$lang$Float;
            }
            if (source == cls4) {
                return true;
            }
        }
        if (dest == Integer.TYPE) {
            if (class$java$lang$Integer == null) {
                cls3 = class$("java.lang.Integer");
                class$java$lang$Integer = cls3;
            } else {
                cls3 = class$java$lang$Integer;
            }
            if (source == cls3) {
                return true;
            }
        }
        if (dest == Long.TYPE) {
            if (class$java$lang$Long == null) {
                cls2 = class$("java.lang.Long");
                class$java$lang$Long = cls2;
            } else {
                cls2 = class$java$lang$Long;
            }
            if (source == cls2) {
                return true;
            }
        }
        if (dest != Short.TYPE) {
            return false;
        }
        if (class$java$lang$Short == null) {
            cls = class$("java.lang.Short");
            class$java$lang$Short = cls;
        } else {
            cls = class$java$lang$Short;
        }
        if (source == cls) {
            return true;
        }
        return false;
    }

    protected Map newMap() {
        return new HashMap();
    }

    private Log logger() {
        Class cls;
        if (this.logger == null) {
            if (class$org$apache$commons$beanutils$LazyDynaBean == null) {
                cls = class$("org.apache.commons.beanutils.LazyDynaBean");
                class$org$apache$commons$beanutils$LazyDynaBean = cls;
            } else {
                cls = class$org$apache$commons$beanutils$LazyDynaBean;
            }
            this.logger = LogFactory.getLog(cls);
        }
        return this.logger;
    }
}
