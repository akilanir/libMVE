package org.apache.commons.beanutils;

import java.io.Serializable;
import java.lang.reflect.Array;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/* loaded from: commons-beanutils-1.8.3.jar:org/apache/commons/beanutils/BasicDynaBean.class */
public class BasicDynaBean implements DynaBean, Serializable {
    protected DynaClass dynaClass;
    protected HashMap values = new HashMap();
    private transient Map mapDecorator;
    static Class class$java$lang$Boolean;
    static Class class$java$lang$Byte;
    static Class class$java$lang$Character;
    static Class class$java$lang$Double;
    static Class class$java$lang$Float;
    static Class class$java$lang$Integer;
    static Class class$java$lang$Long;
    static Class class$java$lang$Short;

    public BasicDynaBean(DynaClass dynaClass) {
        this.dynaClass = null;
        this.dynaClass = dynaClass;
    }

    public Map getMap() {
        if (this.mapDecorator == null) {
            this.mapDecorator = new DynaBeanMapDecorator(this);
        }
        return this.mapDecorator;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public boolean contains(String name, String key) {
        Object value = this.values.get(name);
        if (value == null) {
            throw new NullPointerException(new StringBuffer().append("No mapped value for '").append(name).append("(").append(key).append(")'").toString());
        }
        if (value instanceof Map) {
            return ((Map) value).containsKey(key);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name) {
        Object value = this.values.get(name);
        if (value != null) {
            return value;
        }
        Class type = getDynaProperty(name).getType();
        if (!type.isPrimitive()) {
            return value;
        }
        if (type == Boolean.TYPE) {
            return Boolean.FALSE;
        }
        if (type == Byte.TYPE) {
            return new Byte((byte) 0);
        }
        if (type == Character.TYPE) {
            return new Character((char) 0);
        }
        if (type == Double.TYPE) {
            return new Double(0.0d);
        }
        if (type == Float.TYPE) {
            return new Float(0.0f);
        }
        if (type == Integer.TYPE) {
            return new Integer(0);
        }
        if (type == Long.TYPE) {
            return new Long(0L);
        }
        if (type == Short.TYPE) {
            return new Short((short) 0);
        }
        return null;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, int index) {
        Object value = this.values.get(name);
        if (value == null) {
            throw new NullPointerException(new StringBuffer().append("No indexed value for '").append(name).append("[").append(index).append("]'").toString());
        }
        if (value.getClass().isArray()) {
            return Array.get(value, index);
        }
        if (value instanceof List) {
            return ((List) value).get(index);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]'").toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public Object get(String name, String key) {
        Object value = this.values.get(name);
        if (value == null) {
            throw new NullPointerException(new StringBuffer().append("No mapped value for '").append(name).append("(").append(key).append(")'").toString());
        }
        if (value instanceof Map) {
            return ((Map) value).get(key);
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public DynaClass getDynaClass() {
        return this.dynaClass;
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void remove(String name, String key) {
        Object value = this.values.get(name);
        if (value == null) {
            throw new NullPointerException(new StringBuffer().append("No mapped value for '").append(name).append("(").append(key).append(")'").toString());
        }
        if (value instanceof Map) {
            ((Map) value).remove(key);
            return;
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").toString());
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, Object value) {
        DynaProperty descriptor = getDynaProperty(name);
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
        Object prop = this.values.get(name);
        if (prop == null) {
            throw new NullPointerException(new StringBuffer().append("No indexed value for '").append(name).append("[").append(index).append("]'").toString());
        }
        if (prop.getClass().isArray()) {
            Array.set(prop, index, value);
        } else {
            if (prop instanceof List) {
                try {
                    ((List) prop).set(index, value);
                    return;
                } catch (ClassCastException e) {
                    throw new ConversionException(e.getMessage());
                }
            }
            throw new IllegalArgumentException(new StringBuffer().append("Non-indexed property for '").append(name).append("[").append(index).append("]'").toString());
        }
    }

    @Override // org.apache.commons.beanutils.DynaBean
    public void set(String name, String key, Object value) {
        Object prop = this.values.get(name);
        if (prop == null) {
            throw new NullPointerException(new StringBuffer().append("No mapped value for '").append(name).append("(").append(key).append(")'").toString());
        }
        if (prop instanceof Map) {
            ((Map) prop).put(key, value);
            return;
        }
        throw new IllegalArgumentException(new StringBuffer().append("Non-mapped property for '").append(name).append("(").append(key).append(")'").toString());
    }

    protected DynaProperty getDynaProperty(String name) {
        DynaProperty descriptor = getDynaClass().getDynaProperty(name);
        if (descriptor == null) {
            throw new IllegalArgumentException(new StringBuffer().append("Invalid property name '").append(name).append("'").toString());
        }
        return descriptor;
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

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }
}
