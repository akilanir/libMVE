package org.simpleframework.xml.core;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/Creator.class */
interface Creator {
    Object getInstance() throws Exception;

    Object getInstance(Criteria criteria) throws Exception;

    double getScore(Criteria criteria) throws Exception;

    Signature getSignature() throws Exception;

    Class getType() throws Exception;
}
