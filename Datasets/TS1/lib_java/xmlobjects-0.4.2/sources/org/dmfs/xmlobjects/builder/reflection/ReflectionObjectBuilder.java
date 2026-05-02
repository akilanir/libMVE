package org.dmfs.xmlobjects.builder.reflection;

import java.io.IOException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Modifier;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.builder.AbstractObjectBuilder;
import org.dmfs.xmlobjects.pull.ParserContext;
import org.dmfs.xmlobjects.pull.Recyclable;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.serializer.SerializerContext;
import org.dmfs.xmlobjects.serializer.SerializerException;
import org.dmfs.xmlobjects.serializer.XmlObjectSerializer;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder.class */
public class ReflectionObjectBuilder<T> extends AbstractObjectBuilder<T> {
    private final Class<T> mGenericClass;
    protected final Map<QualifiedName, Field> mAttributeMap = new HashMap(8);
    protected final Map<QualifiedName, Field> mElementMap = new HashMap(8);
    protected final List<FieldHolder> mElementList = new ArrayList(8);
    protected final List<Field> mTextList = new ArrayList(8);

    /* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/builder/reflection/ReflectionObjectBuilder$FieldHolder.class */
    private static final class FieldHolder {
        public final QualifiedName name;
        public final Field field;

        public FieldHolder(QualifiedName qualifiedName, Field field) {
            this.name = qualifiedName;
            this.field = field;
        }
    }

    public ReflectionObjectBuilder(Class<T> cls) {
        this.mGenericClass = cls;
        buildFieldMaps(cls);
        Class<?> superclass = cls.getSuperclass();
        while (true) {
            Class<?> cls2 = superclass;
            if (cls2 == Object.class) {
                return;
            }
            buildFieldMaps(cls2);
            superclass = cls2.getSuperclass();
        }
    }

    private void buildFieldMaps(Class<?> cls) {
        Map<QualifiedName, Field> map = this.mAttributeMap;
        Map<QualifiedName, Field> map2 = this.mElementMap;
        List<FieldHolder> list = this.mElementList;
        List<Field> list2 = this.mTextList;
        for (Field field : cls.getDeclaredFields()) {
            Attribute attribute = (Attribute) field.getAnnotation(Attribute.class);
            if (attribute != null) {
                field.setAccessible(true);
                String name = attribute.name();
                String namespace = attribute.namespace();
                if (name.length() == 0) {
                    name = field.getName();
                }
                map.put(QualifiedName.get(namespace, name), field);
            } else {
                Element element = (Element) field.getAnnotation(Element.class);
                if (element != null) {
                    field.setAccessible(true);
                    String name2 = element.name();
                    String namespace2 = element.namespace();
                    if (name2.length() == 0) {
                        name2 = field.getName();
                    }
                    map2.put(QualifiedName.get(namespace2, name2), field);
                    list.add(new FieldHolder(QualifiedName.get(namespace2, name2), field));
                }
                if (((Text) field.getAnnotation(Text.class)) != null) {
                    field.setAccessible(true);
                    list2.add(field);
                    list.add(new FieldHolder(null, field));
                }
            }
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public T get(ElementDescriptor<T> elementDescriptor, T t, ParserContext parserContext) throws XmlObjectPullParserException {
        if (t instanceof Recyclable) {
            ((Recyclable) t).recycle();
            return t;
        }
        try {
            return getInstance(parserContext);
        } catch (IllegalAccessException e) {
            throw new XmlObjectPullParserException("can not instantiate instance of " + this.mGenericClass, e);
        } catch (InstantiationException e2) {
            throw new XmlObjectPullParserException("can not instantiate instance of " + this.mGenericClass, e2);
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public T update(ElementDescriptor<T> elementDescriptor, T t, QualifiedName qualifiedName, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        Field field = this.mAttributeMap.get(qualifiedName);
        if (field != null) {
            assignValue(field, t, str);
        }
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public T update(ElementDescriptor<T> elementDescriptor, T t, String str, ParserContext parserContext) throws XmlObjectPullParserException {
        Iterator<Field> it = this.mTextList.iterator();
        while (it.hasNext()) {
            assignValue(it.next(), t, str);
        }
        return t;
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public <V> T update(ElementDescriptor<T> elementDescriptor, T t, ElementDescriptor<V> elementDescriptor2, V v, ParserContext parserContext) throws XmlObjectPullParserException {
        Field field = this.mElementMap.get(elementDescriptor2.qualifiedName);
        if (field != null) {
            Class<?> type = field.getType();
            try {
                if (Collection.class.isAssignableFrom(type) && !type.isInterface() && !Modifier.isAbstract(type.getModifiers())) {
                    Collection collection = (Collection) field.get(t);
                    if (collection == null) {
                        collection = (Collection) type.newInstance();
                        field.set(t, collection);
                    }
                    collection.add(v);
                } else if (type.isAssignableFrom(v.getClass())) {
                    field.set(t, v);
                }
            } catch (IllegalAccessException e) {
                throw new XmlObjectPullParserException("can not assign '" + v + "' to a field of type " + type, e);
            } catch (IllegalArgumentException e2) {
                throw new XmlObjectPullParserException("can not assign '" + v + "' to a field of type " + type, e2);
            } catch (InstantiationException e3) {
                throw new XmlObjectPullParserException("can not insanciate collection for " + type, e3);
            }
        }
        return t;
    }

    public T getInstance(ParserContext parserContext) throws InstantiationException, IllegalAccessException {
        return this.mGenericClass.newInstance();
    }

    private void assignValue(Field field, Object obj, String str) throws XmlObjectPullParserException {
        Class<?> type = field.getType();
        try {
            if (type == String.class) {
                field.set(obj, str);
            } else if (type == Integer.TYPE || type == Integer.class) {
                field.setInt(obj, Integer.parseInt(str));
            } else if (type == Byte.TYPE || type == Byte.class) {
                field.setByte(obj, Byte.parseByte(str));
            } else if (type == Character.TYPE || type == Character.class) {
                field.setChar(obj, (str.length() > 0 ? Character.valueOf(str.charAt(0)) : null).charValue());
            } else if (type == Short.TYPE || type == Short.class) {
                field.setShort(obj, Short.parseShort(str));
            } else if (type == Long.TYPE || type == Long.class) {
                field.setLong(obj, Long.parseLong(str));
            } else if (type == Float.TYPE || type == Float.class) {
                field.setFloat(obj, Float.parseFloat(str));
            } else if (type == Double.TYPE || type == Double.class) {
                field.setDouble(obj, Double.parseDouble(str));
            } else if (type == Boolean.TYPE || type == Boolean.class) {
                field.setBoolean(obj, Boolean.parseBoolean(str));
            } else if (type == URI.class) {
                field.set(obj, new URI(str));
            } else if (field.getType() == Class.class) {
                if (str != null) {
                    try {
                        field.set(obj, Class.forName(str));
                    } catch (ClassNotFoundException e) {
                    }
                }
            } else if (Enum.class.isAssignableFrom(type)) {
                try {
                    field.set(obj, type.getMethod("valueOf", String.class).invoke(type, str));
                } catch (NoSuchMethodException e2) {
                } catch (InvocationTargetException e3) {
                }
            }
        } catch (IllegalAccessException e4) {
            throw new XmlObjectPullParserException("can not assign '" + str + "' to a field of type " + type, e4);
        } catch (NumberFormatException e5) {
            throw new XmlObjectPullParserException("can not assign '" + str + "' to a field of type " + type, e5);
        } catch (IllegalArgumentException e6) {
            throw new XmlObjectPullParserException("can not assign '" + str + "' to a field of type " + type, e6);
        } catch (URISyntaxException e7) {
            throw new XmlObjectPullParserException("can not parse URI in '" + str + "'", e7);
        }
    }

    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeAttributes(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlAttributeWriter iXmlAttributeWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        for (Map.Entry<QualifiedName, Field> entry : this.mAttributeMap.entrySet()) {
            try {
                Object obj = entry.getValue().get(t);
                if (obj != null) {
                    iXmlAttributeWriter.writeAttribute(entry.getKey(), obj.toString(), serializerContext);
                }
            } catch (IllegalAccessException e) {
                throw new SerializerException("can not read attribute " + entry.getKey(), e);
            } catch (IllegalArgumentException e2) {
                throw new SerializerException("can not read attribute " + entry.getKey(), e2);
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // org.dmfs.xmlobjects.builder.AbstractObjectBuilder, org.dmfs.xmlobjects.builder.IObjectBuilder
    public void writeChildren(ElementDescriptor<T> elementDescriptor, T t, XmlObjectSerializer.IXmlChildWriter iXmlChildWriter, SerializerContext serializerContext) throws SerializerException, IOException {
        XmlContext xmlContext = serializerContext.getXmlContext();
        for (FieldHolder fieldHolder : this.mElementList) {
            try {
                Object obj = fieldHolder.field.get(t);
                if (fieldHolder.name != null) {
                    ElementDescriptor<?> elementDescriptor2 = ElementDescriptor.get(fieldHolder.name, elementDescriptor, xmlContext);
                    Class<?> type = fieldHolder.field.getType();
                    if (!Collection.class.isAssignableFrom(type) || type.isInterface() || Modifier.isAbstract(type.getModifiers())) {
                        iXmlChildWriter.writeChild(elementDescriptor2, obj, serializerContext);
                    } else {
                        Iterator it = ((Collection) obj).iterator();
                        while (it.hasNext()) {
                            iXmlChildWriter.writeChild(elementDescriptor2, it.next(), serializerContext);
                        }
                    }
                } else if (obj != null) {
                    iXmlChildWriter.writeText(obj.toString(), serializerContext);
                }
            } catch (IllegalAccessException e) {
                throw new SerializerException("can not read field " + fieldHolder.field.getName(), e);
            } catch (IllegalArgumentException e2) {
                throw new SerializerException("can not read field " + fieldHolder.field.getName(), e2);
            }
        }
    }
}
