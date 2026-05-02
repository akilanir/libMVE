package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Criteria.class */
interface Criteria extends Iterable<Object> {
    Variable get(Object obj) throws Exception;

    Variable get(Label label) throws Exception;

    Variable resolve(String str) throws Exception;

    Variable remove(Object obj) throws Exception;

    void set(Label label, Object obj) throws Exception;

    void commit(Object obj) throws Exception;
}
