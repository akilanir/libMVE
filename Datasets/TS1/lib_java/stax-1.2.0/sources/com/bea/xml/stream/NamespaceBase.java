package com.bea.xml.stream;

import javax.xml.stream.events.Namespace;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/NamespaceBase.class */
public class NamespaceBase extends AttributeBase implements Namespace {
    boolean declaresDefaultNamespace;

    public NamespaceBase(String prefix, String namespaceURI) {
        super("xmlns", prefix, namespaceURI);
        this.declaresDefaultNamespace = false;
        this.declaresDefaultNamespace = false;
    }

    public NamespaceBase(String namespaceURI) {
        super("xmlns", "", namespaceURI);
        this.declaresDefaultNamespace = false;
        this.declaresDefaultNamespace = true;
    }

    @Override // com.bea.xml.stream.AttributeBase
    public int getEventType() {
        return 13;
    }

    @Override // com.bea.xml.stream.AttributeBase
    public boolean isAttribute() {
        return false;
    }

    @Override // com.bea.xml.stream.AttributeBase
    public boolean isNamespace() {
        return true;
    }

    public String getPrefix() {
        return this.declaresDefaultNamespace ? "" : super.getLocalName();
    }

    @Override // com.bea.xml.stream.AttributeBase
    public String getNamespaceURI() {
        return super.getValue();
    }

    public boolean isDefaultNamespaceDeclaration() {
        return this.declaresDefaultNamespace;
    }

    @Override // com.bea.xml.stream.AttributeBase
    public String toString() {
        if (this.declaresDefaultNamespace) {
            return new StringBuffer().append("xmlns='").append(getNamespaceURI()).append("'").toString();
        }
        return new StringBuffer().append("xmlns:").append(getPrefix()).append("='").append(getNamespaceURI()).append("'").toString();
    }
}
