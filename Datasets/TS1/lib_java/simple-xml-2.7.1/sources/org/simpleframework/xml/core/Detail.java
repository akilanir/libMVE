package org.simpleframework.xml.core;

import java.lang.annotation.Annotation;
import java.lang.reflect.Constructor;
import java.util.List;
import org.simpleframework.xml.DefaultType;
import org.simpleframework.xml.Namespace;
import org.simpleframework.xml.NamespaceList;
import org.simpleframework.xml.Order;
import org.simpleframework.xml.Root;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Detail.class */
interface Detail {
    boolean isStrict();

    boolean isRequired();

    boolean isInstantiable();

    boolean isPrimitive();

    Class getSuper();

    Class getType();

    String getName();

    Root getRoot();

    Order getOrder();

    DefaultType getAccess();

    DefaultType getOverride();

    Namespace getNamespace();

    NamespaceList getNamespaceList();

    List<MethodDetail> getMethods();

    List<FieldDetail> getFields();

    Annotation[] getAnnotations();

    Constructor[] getConstructors();
}
