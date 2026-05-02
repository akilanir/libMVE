package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLStreamException;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/NamedEvent.class */
public abstract class NamedEvent extends BaseEvent {
    private QName name;

    @Override // com.bea.xml.stream.events.BaseEvent
    protected abstract void doWriteAsEncodedUnicode(Writer writer) throws IOException, XMLStreamException;

    public NamedEvent() {
    }

    public NamedEvent(QName name) {
        this.name = name;
    }

    public NamedEvent(String localName) {
        this.name = new QName(localName);
    }

    public NamedEvent(String prefix, String namespaceURI, String localName) {
        this.name = new QName(namespaceURI, localName, prefix);
    }

    public QName getName() {
        return this.name;
    }

    public void setName(QName n) {
        this.name = n;
    }

    public String nameAsString() {
        if ("".equals(this.name.getNamespaceURI())) {
            return this.name.getLocalPart();
        }
        if (this.name.getPrefix() != null && !this.name.getPrefix().equals("")) {
            return new StringBuffer().append("['").append(this.name.getNamespaceURI()).append("']:").append(this.name.getPrefix()).append(":").append(this.name.getLocalPart()).toString();
        }
        return new StringBuffer().append("['").append(this.name.getNamespaceURI()).append("']:").append(this.name.getLocalPart()).toString();
    }
}
