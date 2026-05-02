package org.dmfs.xmlobjects;

import java.lang.ref.WeakReference;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.dmfs.xmlobjects.builder.IObjectBuilder;

/* loaded from: xmlobjects-0.4.2.jar:org/dmfs/xmlobjects/ElementDescriptor.class */
public final class ElementDescriptor<T> {
    public static final XmlContext DEFAULT_CONTEXT = new XmlContext() { // from class: org.dmfs.xmlobjects.ElementDescriptor.1
    };
    public final QualifiedName qualifiedName;
    public final IObjectBuilder<T> builder;
    private final WeakReference<XmlContext> mContext;
    private Map<QualifiedName, ElementDescriptor<?>> mElementContext;

    public static ElementDescriptor<?> get(QualifiedName qualifiedName) {
        ElementDescriptor<?> elementDescriptor;
        synchronized (DEFAULT_CONTEXT) {
            elementDescriptor = DEFAULT_CONTEXT.DESCRIPTOR_MAP.get(qualifiedName);
        }
        return elementDescriptor;
    }

    public static ElementDescriptor<?> get(QualifiedName qualifiedName, XmlContext xmlContext) {
        ElementDescriptor<?> elementDescriptor;
        if (xmlContext == null) {
            xmlContext = DEFAULT_CONTEXT;
        }
        synchronized (xmlContext) {
            ElementDescriptor<?> elementDescriptor2 = xmlContext.DESCRIPTOR_MAP.get(qualifiedName);
            if (elementDescriptor2 != null) {
                return elementDescriptor2;
            }
            synchronized (DEFAULT_CONTEXT) {
                elementDescriptor = DEFAULT_CONTEXT.DESCRIPTOR_MAP.get(qualifiedName);
            }
            return elementDescriptor;
        }
    }

    public static ElementDescriptor<?> get(QualifiedName qualifiedName, ElementDescriptor<?> elementDescriptor) {
        if (elementDescriptor == null || ((ElementDescriptor) elementDescriptor).mElementContext == null) {
            return get(qualifiedName);
        }
        ElementDescriptor<?> elementDescriptor2 = ((ElementDescriptor) elementDescriptor).mElementContext.get(qualifiedName);
        return elementDescriptor2 == null ? get(qualifiedName) : elementDescriptor2;
    }

    public static ElementDescriptor<?> get(QualifiedName qualifiedName, ElementDescriptor<?> elementDescriptor, XmlContext xmlContext) {
        if (elementDescriptor == null || ((ElementDescriptor) elementDescriptor).mElementContext == null) {
            return get(qualifiedName, xmlContext);
        }
        ElementDescriptor<?> elementDescriptor2 = ((ElementDescriptor) elementDescriptor).mElementContext.get(qualifiedName);
        return elementDescriptor2 == null ? get(qualifiedName, xmlContext) : elementDescriptor2;
    }

    public static <T> ElementDescriptor<T> register(String str, IObjectBuilder<T> iObjectBuilder) {
        return register(QualifiedName.get(str), iObjectBuilder, DEFAULT_CONTEXT);
    }

    public static <T> ElementDescriptor<T> register(QualifiedName qualifiedName, IObjectBuilder<T> iObjectBuilder) {
        return register(qualifiedName, iObjectBuilder, DEFAULT_CONTEXT);
    }

    public static <T> ElementDescriptor<T> register(String str, IObjectBuilder<T> iObjectBuilder, XmlContext xmlContext) {
        return register(QualifiedName.get(str), iObjectBuilder, xmlContext);
    }

    public static <T> ElementDescriptor<T> register(QualifiedName qualifiedName, IObjectBuilder<T> iObjectBuilder, XmlContext xmlContext) {
        ElementDescriptor<T> elementDescriptor;
        if (xmlContext == null) {
            xmlContext = DEFAULT_CONTEXT;
        }
        synchronized (xmlContext) {
            Map<QualifiedName, ElementDescriptor<?>> map = xmlContext.DESCRIPTOR_MAP;
            if (map.containsKey(qualifiedName)) {
                throw new IllegalStateException("descriptor for " + qualifiedName + " already exists, use 'overload' to override the definition");
            }
            elementDescriptor = new ElementDescriptor<>(qualifiedName, iObjectBuilder, xmlContext);
            map.put(qualifiedName, elementDescriptor);
        }
        return elementDescriptor;
    }

    public static <T> ElementDescriptor<T> registerWithParents(String str, IObjectBuilder<T> iObjectBuilder, ElementDescriptor<?>... elementDescriptorArr) {
        return registerWithParents(QualifiedName.get(str), iObjectBuilder, elementDescriptorArr);
    }

    public static <T> ElementDescriptor<T> registerWithParents(QualifiedName qualifiedName, IObjectBuilder<T> iObjectBuilder, ElementDescriptor<?>... elementDescriptorArr) {
        if (elementDescriptorArr == null || elementDescriptorArr.length == 0) {
            throw new IllegalArgumentException("no parent elements provided");
        }
        ElementDescriptor<T> elementDescriptor = new ElementDescriptor<>(qualifiedName, iObjectBuilder, elementDescriptorArr[0].getContext());
        for (ElementDescriptor<?> elementDescriptor2 : elementDescriptorArr) {
            if (elementDescriptor.getContext() != elementDescriptor2.getContext()) {
                throw new IllegalArgumentException("Parent descriptors don't belong to the same XmlContext");
            }
            Map<QualifiedName, ElementDescriptor<?>> map = ((ElementDescriptor) elementDescriptor2).mElementContext;
            if (map == null) {
                Map<QualifiedName, ElementDescriptor<?>> synchronizedMap = Collections.synchronizedMap(new HashMap(8));
                ((ElementDescriptor) elementDescriptor2).mElementContext = synchronizedMap;
                map = synchronizedMap;
            } else if (map.containsKey(qualifiedName)) {
                throw new IllegalStateException("descriptor for " + qualifiedName + " already exists in parent " + elementDescriptor2.qualifiedName);
            }
            map.put(qualifiedName, elementDescriptor);
        }
        return elementDescriptor;
    }

    public static <T> ElementDescriptor<T> overload(ElementDescriptor<? super T> elementDescriptor, IObjectBuilder<T> iObjectBuilder) {
        ElementDescriptor<T> elementDescriptor2;
        XmlContext xmlContext = ((ElementDescriptor) elementDescriptor).mContext.get();
        if (xmlContext == null) {
            throw new IllegalStateException("can not overload element in gc'ed context");
        }
        synchronized (xmlContext) {
            Map<QualifiedName, ElementDescriptor<?>> map = xmlContext.DESCRIPTOR_MAP;
            QualifiedName qualifiedName = elementDescriptor.qualifiedName;
            elementDescriptor2 = new ElementDescriptor<>(qualifiedName, iObjectBuilder, xmlContext);
            ((ElementDescriptor) elementDescriptor2).mElementContext = ((ElementDescriptor) elementDescriptor).mElementContext;
            map.put(qualifiedName, elementDescriptor2);
        }
        return elementDescriptor2;
    }

    private ElementDescriptor(QualifiedName qualifiedName, IObjectBuilder<T> iObjectBuilder, XmlContext xmlContext) {
        if (qualifiedName == null) {
            throw new IllegalArgumentException("qname must not be null");
        }
        this.qualifiedName = qualifiedName;
        this.builder = iObjectBuilder;
        this.mContext = new WeakReference<>(xmlContext);
    }

    public XmlContext getContext() {
        return this.mContext.get();
    }

    public int hashCode() {
        return this.qualifiedName.hashCode();
    }

    public boolean equals(Object obj) {
        return obj == this;
    }
}
