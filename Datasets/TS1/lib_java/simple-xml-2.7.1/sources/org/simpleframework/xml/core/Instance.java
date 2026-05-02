package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Instance.class */
interface Instance {
    Object getInstance() throws Exception;

    Object setInstance(Object obj) throws Exception;

    boolean isReference();

    Class getType();
}
