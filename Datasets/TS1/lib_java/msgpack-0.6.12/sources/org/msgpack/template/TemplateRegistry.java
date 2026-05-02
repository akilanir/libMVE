package org.msgpack.template;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.TypeVariable;
import java.lang.reflect.WildcardType;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.nio.ByteBuffer;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.msgpack.MessagePackable;
import org.msgpack.MessageTypeException;
import org.msgpack.template.builder.TemplateBuilder;
import org.msgpack.template.builder.TemplateBuilderChain;
import org.msgpack.type.Value;

/* loaded from: msgpack-0.6.12.jar:org/msgpack/template/TemplateRegistry.class */
public class TemplateRegistry {
    private TemplateRegistry parent;
    private TemplateBuilderChain chain;
    Map<Type, Template<Type>> cache;
    private Map<Type, GenericTemplate> genericCache;

    private TemplateRegistry() {
        this.parent = null;
        this.parent = null;
        this.chain = createTemplateBuilderChain();
        this.genericCache = new HashMap();
        this.cache = new HashMap();
        registerTemplates();
        this.cache = Collections.unmodifiableMap(this.cache);
    }

    public TemplateRegistry(TemplateRegistry registry) {
        this.parent = null;
        if (registry != null) {
            this.parent = registry;
        } else {
            this.parent = new TemplateRegistry();
        }
        this.chain = createTemplateBuilderChain();
        this.cache = new HashMap();
        this.genericCache = new HashMap();
        registerTemplatesWhichRefersRegistry();
    }

    protected TemplateBuilderChain createTemplateBuilderChain() {
        return new TemplateBuilderChain(this);
    }

    public void setClassLoader(ClassLoader cl) {
        this.chain = new TemplateBuilderChain(this, cl);
    }

    private void registerTemplates() {
        register(Boolean.TYPE, BooleanTemplate.getInstance());
        register(Boolean.class, BooleanTemplate.getInstance());
        register(Byte.TYPE, ByteTemplate.getInstance());
        register(Byte.class, ByteTemplate.getInstance());
        register(Short.TYPE, ShortTemplate.getInstance());
        register(Short.class, ShortTemplate.getInstance());
        register(Integer.TYPE, IntegerTemplate.getInstance());
        register(Integer.class, IntegerTemplate.getInstance());
        register(Long.TYPE, LongTemplate.getInstance());
        register(Long.class, LongTemplate.getInstance());
        register(Float.TYPE, FloatTemplate.getInstance());
        register(Float.class, FloatTemplate.getInstance());
        register(Double.TYPE, DoubleTemplate.getInstance());
        register(Double.class, DoubleTemplate.getInstance());
        register(BigInteger.class, BigIntegerTemplate.getInstance());
        register(Character.TYPE, CharacterTemplate.getInstance());
        register(Character.class, CharacterTemplate.getInstance());
        register(boolean[].class, BooleanArrayTemplate.getInstance());
        register(short[].class, ShortArrayTemplate.getInstance());
        register(int[].class, IntegerArrayTemplate.getInstance());
        register(long[].class, LongArrayTemplate.getInstance());
        register(float[].class, FloatArrayTemplate.getInstance());
        register(double[].class, DoubleArrayTemplate.getInstance());
        register(String.class, StringTemplate.getInstance());
        register(byte[].class, ByteArrayTemplate.getInstance());
        register(ByteBuffer.class, ByteBufferTemplate.getInstance());
        register(Value.class, ValueTemplate.getInstance());
        register(BigDecimal.class, BigDecimalTemplate.getInstance());
        register(Date.class, DateTemplate.getInstance());
        registerTemplatesWhichRefersRegistry();
    }

    protected void registerTemplatesWhichRefersRegistry() {
        AnyTemplate anyTemplate = new AnyTemplate(this);
        register(List.class, new ListTemplate(anyTemplate));
        register(Set.class, new SetTemplate(anyTemplate));
        register(Collection.class, new CollectionTemplate(anyTemplate));
        register(Map.class, new MapTemplate(anyTemplate, anyTemplate));
        registerGeneric(List.class, new GenericCollectionTemplate(this, ListTemplate.class));
        registerGeneric(Set.class, new GenericCollectionTemplate(this, SetTemplate.class));
        registerGeneric(Collection.class, new GenericCollectionTemplate(this, CollectionTemplate.class));
        registerGeneric(Map.class, new GenericMapTemplate(this, MapTemplate.class));
    }

    public void register(Class<?> targetClass) {
        buildAndRegister(null, targetClass, false, null);
    }

    public void register(Class<?> targetClass, FieldList flist) {
        if (flist == null) {
            throw new NullPointerException("FieldList object is null");
        }
        buildAndRegister(null, targetClass, false, flist);
    }

    public synchronized void register(Type targetType, Template tmpl) {
        if (tmpl == null) {
            throw new NullPointerException("Template object is null");
        }
        if (targetType instanceof ParameterizedType) {
            this.cache.put(((ParameterizedType) targetType).getRawType(), tmpl);
        } else {
            this.cache.put(targetType, tmpl);
        }
    }

    public synchronized void registerGeneric(Type targetType, GenericTemplate tmpl) {
        if (targetType instanceof ParameterizedType) {
            this.genericCache.put(((ParameterizedType) targetType).getRawType(), tmpl);
        } else {
            this.genericCache.put(targetType, tmpl);
        }
    }

    public synchronized boolean unregister(Type targetType) {
        Template<Type> tmpl = this.cache.remove(targetType);
        return tmpl != null;
    }

    public synchronized void unregister() {
        this.cache.clear();
    }

    public synchronized Template lookup(Type targetType) {
        if (targetType instanceof ParameterizedType) {
            ParameterizedType paramedType = (ParameterizedType) targetType;
            Template tmpl = lookupGenericType(paramedType);
            if (tmpl != null) {
                return tmpl;
            }
            targetType = paramedType.getRawType();
        }
        Template tmpl2 = lookupGenericArrayType(targetType);
        if (tmpl2 != null) {
            return tmpl2;
        }
        Template tmpl3 = lookupCache(targetType);
        if (tmpl3 != null) {
            return tmpl3;
        }
        if ((targetType instanceof WildcardType) || (targetType instanceof TypeVariable)) {
            Template tmpl4 = new AnyTemplate(this);
            register(targetType, tmpl4);
            return tmpl4;
        }
        Class<?> targetClass = (Class) targetType;
        if (MessagePackable.class.isAssignableFrom(targetClass)) {
            Template tmpl5 = new MessagePackableTemplate(targetClass);
            register(targetClass, tmpl5);
            return tmpl5;
        }
        if (targetClass.isInterface()) {
            Template tmpl6 = new AnyTemplate(this);
            register(targetType, tmpl6);
            return tmpl6;
        }
        Template tmpl7 = lookupAfterBuilding(targetClass);
        if (tmpl7 != null) {
            return tmpl7;
        }
        Template tmpl8 = lookupInterfaceTypes(targetClass);
        if (tmpl8 != null) {
            return tmpl8;
        }
        Template tmpl9 = lookupSuperclasses(targetClass);
        if (tmpl9 != null) {
            return tmpl9;
        }
        Template tmpl10 = lookupSuperclassInterfaceTypes(targetClass);
        if (tmpl10 != null) {
            return tmpl10;
        }
        throw new MessageTypeException("Cannot find template for " + targetClass + " class.  Try to add @Message annotation to the class or call MessagePack.register(Type).");
    }

    private Template<Type> lookupGenericType(ParameterizedType paramedType) {
        Template<Type> tmpl = lookupGenericTypeImpl(paramedType);
        if (tmpl != null) {
            return tmpl;
        }
        try {
            Template<Type> tmpl2 = this.parent.lookupGenericTypeImpl(paramedType);
            if (tmpl2 != null) {
                return tmpl2;
            }
        } catch (NullPointerException e) {
        }
        Template<Type> tmpl3 = lookupGenericInterfaceTypes(paramedType);
        if (tmpl3 != null) {
            return tmpl3;
        }
        Template<Type> tmpl4 = lookupGenericSuperclasses(paramedType);
        if (tmpl4 != null) {
            return tmpl4;
        }
        return null;
    }

    private Template lookupGenericTypeImpl(ParameterizedType targetType) {
        Type rawType = targetType.getRawType();
        return lookupGenericTypeImpl0(targetType, rawType);
    }

    private Template lookupGenericTypeImpl0(ParameterizedType targetType, Type rawType) {
        GenericTemplate gtmpl = this.genericCache.get(rawType);
        if (gtmpl == null) {
            return null;
        }
        Type[] types = targetType.getActualTypeArguments();
        Template[] tmpls = new Template[types.length];
        for (int i = 0; i < types.length; i++) {
            tmpls[i] = lookup(types[i]);
        }
        return gtmpl.build(tmpls);
    }

    private <T> Template<T> lookupGenericInterfaceTypes(ParameterizedType targetType) {
        Type rawType = targetType.getRawType();
        Template<T> tmpl = null;
        try {
            Class<?>[] infTypes = ((Class) rawType).getInterfaces();
            for (Class<?> infType : infTypes) {
                tmpl = lookupGenericTypeImpl0(targetType, infType);
                if (tmpl != null) {
                    return tmpl;
                }
            }
        } catch (ClassCastException e) {
        }
        return tmpl;
    }

    private <T> Template<T> lookupGenericSuperclasses(ParameterizedType targetType) {
        Class<?> superClass;
        Type rawType = targetType.getRawType();
        Template<T> tmpl = null;
        try {
            superClass = ((Class) rawType).getSuperclass();
        } catch (ClassCastException e) {
        }
        if (superClass == null) {
            return null;
        }
        while (superClass != Object.class) {
            tmpl = lookupGenericTypeImpl0(targetType, superClass);
            if (tmpl == null) {
                superClass = superClass.getSuperclass();
            } else {
                register(targetType, tmpl);
                return tmpl;
            }
        }
        return tmpl;
    }

    private Template<Type> lookupGenericArrayType(Type targetType) {
        if (!(targetType instanceof GenericArrayType)) {
            return null;
        }
        GenericArrayType genericArrayType = (GenericArrayType) targetType;
        Template<Type> tmpl = lookupGenericArrayTypeImpl(genericArrayType);
        if (tmpl != null) {
            return tmpl;
        }
        try {
            Template<Type> tmpl2 = this.parent.lookupGenericArrayTypeImpl(genericArrayType);
            if (tmpl2 != null) {
                return tmpl2;
            }
            return null;
        } catch (NullPointerException e) {
            return null;
        }
    }

    private Template lookupGenericArrayTypeImpl(GenericArrayType genericArrayType) {
        Class jvmArrayClass;
        Class jvmArrayClass2;
        String genericArrayTypeName = "" + genericArrayType;
        int dim = genericArrayTypeName.split("\\[").length - 1;
        if (dim <= 0) {
            throw new MessageTypeException(String.format("fatal error: type=", genericArrayTypeName));
        }
        if (dim > 1) {
            throw new UnsupportedOperationException(String.format("Not implemented template generation of %s", genericArrayTypeName));
        }
        String genericCompTypeName = "" + genericArrayType.getGenericComponentType();
        boolean isPrimitiveType = isPrimitiveType(genericCompTypeName);
        StringBuffer sbuf = new StringBuffer();
        for (int i = 0; i < dim; i++) {
            sbuf.append('[');
        }
        if (!isPrimitiveType) {
            sbuf.append('L');
            sbuf.append(toJvmReferenceTypeName(genericCompTypeName));
            sbuf.append(';');
        } else {
            sbuf.append(toJvmPrimitiveTypeName(genericCompTypeName));
        }
        String jvmArrayClassName = sbuf.toString();
        try {
            ClassLoader cl = Thread.currentThread().getContextClassLoader();
            if (cl != null && (jvmArrayClass2 = cl.loadClass(jvmArrayClassName)) != null) {
                return lookupAfterBuilding(jvmArrayClass2);
            }
        } catch (ClassNotFoundException e) {
        }
        try {
            ClassLoader cl2 = getClass().getClassLoader();
            if (cl2 != null && (jvmArrayClass = cl2.loadClass(jvmArrayClassName)) != null) {
                return lookupAfterBuilding(jvmArrayClass);
            }
        } catch (ClassNotFoundException e2) {
        }
        try {
            Class jvmArrayClass3 = Class.forName(jvmArrayClassName);
            if (jvmArrayClass3 != null) {
                return lookupAfterBuilding(jvmArrayClass3);
            }
        } catch (ClassNotFoundException e3) {
        }
        throw new MessageTypeException(String.format("cannot find template of %s", jvmArrayClassName));
    }

    private Template<Type> lookupCache(Type targetType) {
        Template<Type> tmpl = this.cache.get(targetType);
        if (tmpl != null) {
            return tmpl;
        }
        try {
            tmpl = this.parent.lookupCache(targetType);
        } catch (NullPointerException e) {
        }
        return tmpl;
    }

    private <T> Template<T> lookupAfterBuilding(Class<T> targetClass) {
        TemplateBuilder builder = this.chain.select(targetClass, true);
        Template<T> tmpl = null;
        if (builder != null) {
            Template<T> tmpl2 = this.chain.getForceBuilder().loadTemplate(targetClass);
            if (tmpl2 != null) {
                register(targetClass, tmpl2);
                return tmpl2;
            }
            tmpl = buildAndRegister(builder, targetClass, true, null);
        }
        return tmpl;
    }

    private <T> Template<T> lookupInterfaceTypes(Class<T> targetClass) {
        Class<?>[] infTypes = targetClass.getInterfaces();
        Template template = null;
        for (Class<?> infType : infTypes) {
            template = this.cache.get(infType);
            if (template != null) {
                register(targetClass, template);
                return template;
            }
            try {
                template = this.parent.lookupCache(infType);
            } catch (NullPointerException e) {
            }
            if (template == null) {
                continue;
            } else {
                register(targetClass, template);
                return template;
            }
        }
        return template;
    }

    private <T> Template<T> lookupSuperclasses(Class<T> targetClass) {
        Class<?> superClass = targetClass.getSuperclass();
        Template template = null;
        if (superClass != null) {
            while (superClass != Object.class) {
                template = this.cache.get(superClass);
                if (template != null) {
                    register(targetClass, template);
                    return template;
                }
                try {
                    template = this.parent.lookupCache(superClass);
                } catch (NullPointerException e) {
                }
                if (template == null) {
                    continue;
                    superClass = superClass.getSuperclass();
                } else {
                    register(targetClass, template);
                    return template;
                }
            }
        }
        return template;
    }

    /* JADX WARN: Multi-variable type inference failed */
    private <T> Template<T> lookupSuperclassInterfaceTypes(Class<T> targetClass) {
        Class<T> superclass = targetClass.getSuperclass();
        Template tmpl = null;
        if (superclass != null) {
            while (superclass != Object.class) {
                tmpl = lookupInterfaceTypes(superclass);
                if (tmpl != null) {
                    register(targetClass, tmpl);
                    return tmpl;
                }
                try {
                    tmpl = this.parent.lookupCache(superclass);
                } catch (NullPointerException e) {
                }
                if (tmpl == null) {
                    continue;
                    superclass = superclass.getSuperclass();
                } else {
                    register(targetClass, tmpl);
                    return tmpl;
                }
            }
        }
        return tmpl;
    }

    private synchronized Template buildAndRegister(TemplateBuilder builder, Class targetClass, boolean hasAnnotation, FieldList flist) {
        Template newTmpl = null;
        try {
            try {
                if (this.cache.containsKey(targetClass)) {
                    this.cache.get(targetClass);
                }
                this.cache.put(targetClass, new TemplateReference(this, targetClass));
                if (builder == null) {
                    builder = this.chain.select(targetClass, hasAnnotation);
                }
                newTmpl = flist != null ? builder.buildTemplate(targetClass, flist) : builder.buildTemplate(targetClass);
                return newTmpl;
            } catch (Exception e) {
                if (0 != 0) {
                    this.cache.put(targetClass, null);
                } else {
                    this.cache.remove(targetClass);
                }
                if (e instanceof MessageTypeException) {
                    throw ((MessageTypeException) e);
                }
                throw new MessageTypeException(e);
            }
        } finally {
            if (newTmpl != null) {
                this.cache.put(targetClass, newTmpl);
            }
        }
    }

    private static boolean isPrimitiveType(String genericCompTypeName) {
        return genericCompTypeName.equals("byte") || genericCompTypeName.equals("short") || genericCompTypeName.equals("int") || genericCompTypeName.equals("long") || genericCompTypeName.equals("float") || genericCompTypeName.equals("double") || genericCompTypeName.equals("boolean") || genericCompTypeName.equals("char");
    }

    private static String toJvmReferenceTypeName(String typeName) {
        return typeName.substring(6);
    }

    private static String toJvmPrimitiveTypeName(String typeName) {
        if (typeName.equals("byte")) {
            return "B";
        }
        if (typeName.equals("short")) {
            return "S";
        }
        if (typeName.equals("int")) {
            return "I";
        }
        if (typeName.equals("long")) {
            return "J";
        }
        if (typeName.equals("float")) {
            return "F";
        }
        if (typeName.equals("double")) {
            return "D";
        }
        if (typeName.equals("boolean")) {
            return "Z";
        }
        if (typeName.equals("char")) {
            return "C";
        }
        throw new MessageTypeException(String.format("fatal error: type=%s", typeName));
    }
}
