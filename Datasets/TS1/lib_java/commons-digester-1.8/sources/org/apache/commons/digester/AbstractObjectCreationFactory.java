package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/AbstractObjectCreationFactory.class */
public abstract class AbstractObjectCreationFactory implements ObjectCreationFactory {
    protected Digester digester = null;

    @Override // org.apache.commons.digester.ObjectCreationFactory
    public abstract Object createObject(Attributes attributes) throws Exception;

    @Override // org.apache.commons.digester.ObjectCreationFactory
    public Digester getDigester() {
        return this.digester;
    }

    @Override // org.apache.commons.digester.ObjectCreationFactory
    public void setDigester(Digester digester) {
        this.digester = digester;
    }
}
