package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/ObjectCreationFactory.class */
public interface ObjectCreationFactory {
    Object createObject(Attributes attributes) throws Exception;

    Digester getDigester();

    void setDigester(Digester digester);
}
