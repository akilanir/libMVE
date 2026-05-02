package org.apache.commons.digester;

import org.xml.sax.Attributes;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/Rule.class */
public abstract class Rule {
    protected Digester digester = null;
    protected String namespaceURI = null;

    public Rule(Digester digester) {
        setDigester(digester);
    }

    public Rule() {
    }

    public Digester getDigester() {
        return this.digester;
    }

    public void setDigester(Digester digester) {
        this.digester = digester;
    }

    public String getNamespaceURI() {
        return this.namespaceURI;
    }

    public void setNamespaceURI(String namespaceURI) {
        this.namespaceURI = namespaceURI;
    }

    public void begin(Attributes attributes) throws Exception {
    }

    public void begin(String namespace, String name, Attributes attributes) throws Exception {
        begin(attributes);
    }

    public void body(String text) throws Exception {
    }

    public void body(String namespace, String name, String text) throws Exception {
        body(text);
    }

    public void end() throws Exception {
    }

    public void end(String namespace, String name) throws Exception {
        end();
    }

    public void finish() throws Exception {
    }
}
