package com.fasterxml.jackson.databind.ext;

import com.fasterxml.jackson.databind.BeanDescription;
import com.fasterxml.jackson.databind.DeserializationConfig;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializationConfig;
import com.fasterxml.jackson.databind.deser.Deserializers;
import com.fasterxml.jackson.databind.ser.Serializers;
import java.io.Serializable;

/* loaded from: jackson-databind-2.5.1.jar:com/fasterxml/jackson/databind/ext/OptionalHandlerFactory.class */
public class OptionalHandlerFactory implements Serializable {
    private static final long serialVersionUID = 1;
    private static final String PACKAGE_PREFIX_JAVAX_XML = "javax.xml.";
    private static final String SERIALIZERS_FOR_JAVAX_XML = "com.fasterxml.jackson.databind.ext.CoreXMLSerializers";
    private static final String DESERIALIZERS_FOR_JAVAX_XML = "com.fasterxml.jackson.databind.ext.CoreXMLDeserializers";
    private static final String CLASS_NAME_DOM_NODE = "org.w3c.dom.Node";
    private static final String CLASS_NAME_DOM_DOCUMENT = "org.w3c.dom.Node";
    private static final String SERIALIZER_FOR_DOM_NODE = "com.fasterxml.jackson.databind.ext.DOMSerializer";
    private static final String DESERIALIZER_FOR_DOM_DOCUMENT = "com.fasterxml.jackson.databind.ext.DOMDeserializer$DocumentDeserializer";
    private static final String DESERIALIZER_FOR_DOM_NODE = "com.fasterxml.jackson.databind.ext.DOMDeserializer$NodeDeserializer";
    public static final OptionalHandlerFactory instance = new OptionalHandlerFactory();

    protected OptionalHandlerFactory() {
    }

    public JsonSerializer<?> findSerializer(SerializationConfig config, JavaType type, BeanDescription beanDesc) {
        Class<?> rawType = type.getRawClass();
        String className = rawType.getName();
        if (!className.startsWith(PACKAGE_PREFIX_JAVAX_XML) && !hasSupertypeStartingWith(rawType, PACKAGE_PREFIX_JAVAX_XML)) {
            if (doesImplement(rawType, "org.w3c.dom.Node")) {
                return (JsonSerializer) instantiate(SERIALIZER_FOR_DOM_NODE);
            }
            return null;
        }
        Object ob = instantiate(SERIALIZERS_FOR_JAVAX_XML);
        if (ob == null) {
            return null;
        }
        return ((Serializers) ob).findSerializer(config, type, beanDesc);
    }

    public JsonDeserializer<?> findDeserializer(JavaType type, DeserializationConfig config, BeanDescription beanDesc) throws JsonMappingException {
        Class<?> rawType = type.getRawClass();
        String className = rawType.getName();
        if (!className.startsWith(PACKAGE_PREFIX_JAVAX_XML) && !hasSupertypeStartingWith(rawType, PACKAGE_PREFIX_JAVAX_XML)) {
            if (doesImplement(rawType, "org.w3c.dom.Node")) {
                return (JsonDeserializer) instantiate(DESERIALIZER_FOR_DOM_DOCUMENT);
            }
            if (doesImplement(rawType, "org.w3c.dom.Node")) {
                return (JsonDeserializer) instantiate(DESERIALIZER_FOR_DOM_NODE);
            }
            return null;
        }
        Object ob = instantiate(DESERIALIZERS_FOR_JAVAX_XML);
        if (ob == null) {
            return null;
        }
        return ((Deserializers) ob).findBeanDeserializer(type, config, beanDesc);
    }

    private Object instantiate(String className) {
        try {
            return Class.forName(className).newInstance();
        } catch (Exception | LinkageError e) {
            return null;
        }
    }

    private boolean doesImplement(Class<?> actualType, String classNameToImplement) {
        Class<?> cls = actualType;
        while (true) {
            Class<?> type = cls;
            if (type != null) {
                if (!type.getName().equals(classNameToImplement) && !hasInterface(type, classNameToImplement)) {
                    cls = type.getSuperclass();
                } else {
                    return true;
                }
            } else {
                return false;
            }
        }
    }

    private boolean hasInterface(Class<?> type, String interfaceToImplement) {
        Class<?>[] interfaces = type.getInterfaces();
        for (Class<?> iface : interfaces) {
            if (iface.getName().equals(interfaceToImplement)) {
                return true;
            }
        }
        for (Class<?> iface2 : interfaces) {
            if (hasInterface(iface2, interfaceToImplement)) {
                return true;
            }
        }
        return false;
    }

    private boolean hasSupertypeStartingWith(Class<?> rawType, String prefix) {
        Class<?> superclass = rawType.getSuperclass();
        while (true) {
            Class<?> supertype = superclass;
            if (supertype != null) {
                if (!supertype.getName().startsWith(prefix)) {
                    superclass = supertype.getSuperclass();
                } else {
                    return true;
                }
            } else {
                Class<?> cls = rawType;
                while (true) {
                    Class<?> cls2 = cls;
                    if (cls2 != null) {
                        if (!hasInterfaceStartingWith(cls2, prefix)) {
                            cls = cls2.getSuperclass();
                        } else {
                            return true;
                        }
                    } else {
                        return false;
                    }
                }
            }
        }
    }

    private boolean hasInterfaceStartingWith(Class<?> type, String prefix) {
        Class<?>[] interfaces = type.getInterfaces();
        for (Class<?> iface : interfaces) {
            if (iface.getName().startsWith(prefix)) {
                return true;
            }
        }
        for (Class<?> iface2 : interfaces) {
            if (hasInterfaceStartingWith(iface2, prefix)) {
                return true;
            }
        }
        return false;
    }
}
