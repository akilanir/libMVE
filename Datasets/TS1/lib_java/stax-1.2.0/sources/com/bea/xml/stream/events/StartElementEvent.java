package com.bea.xml.stream.events;

import com.bea.xml.stream.util.EmptyIterator;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.namespace.NamespaceContext;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Namespace;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/StartElementEvent.class */
public class StartElementEvent extends NamedEvent implements StartElement {
    private List attributes;
    private List namespaces;
    private NamespaceContext context;

    public StartElementEvent() {
    }

    public StartElementEvent(QName name) {
        super(name);
        init();
    }

    public void reset() {
        if (this.attributes != null) {
            this.attributes.clear();
        }
        if (this.namespaces != null) {
            this.namespaces.clear();
        }
        if (this.context != null) {
            this.context = null;
        }
    }

    public StartElementEvent(StartElement element) {
        super(element.getName());
        init();
        setName(element.getName());
        Iterator ai = element.getAttributes();
        while (ai.hasNext()) {
            addAttribute((Attribute) ai.next());
        }
        element.getNamespaces();
        Iterator ni = element.getNamespaces();
        while (ni.hasNext()) {
            addNamespace((Namespace) ni.next());
        }
    }

    protected void init() {
        setEventType(1);
    }

    public Iterator getAttributes() {
        return this.attributes == null ? EmptyIterator.emptyIterator : this.attributes.iterator();
    }

    public Iterator getNamespaces() {
        return this.namespaces == null ? EmptyIterator.emptyIterator : this.namespaces.iterator();
    }

    public Attribute getAttributeByName(QName name) {
        if (name == null) {
            return null;
        }
        Iterator i = getAttributes();
        while (i.hasNext()) {
            Attribute a = (Attribute) i.next();
            if (a.getName().equals(name)) {
                return a;
            }
        }
        return null;
    }

    public void setAttributes(List attributes) {
        this.attributes = attributes;
    }

    public void addAttribute(Attribute attribute) {
        if (this.attributes == null) {
            this.attributes = new ArrayList();
        }
        this.attributes.add(attribute);
    }

    public void addNamespace(Namespace attribute) {
        if (this.namespaces == null) {
            this.namespaces = new ArrayList();
        }
        this.namespaces.add(attribute);
    }

    public String getNamespaceURI(String prefix) {
        if (this.context == null) {
            return null;
        }
        return this.context.getNamespaceURI(prefix);
    }

    public void setNamespaceContext(NamespaceContext c) {
        this.context = c;
    }

    public NamespaceContext getNamespaceContext() {
        return this.context;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String toString() {
        String value = new StringBuffer().append("<").append(nameAsString()).toString();
        Iterator ai = getAttributes();
        while (ai.hasNext()) {
            value = new StringBuffer().append(value).append(" ").append(ai.next().toString()).toString();
        }
        Iterator ni = getNamespaces();
        while (ni.hasNext()) {
            value = new StringBuffer().append(value).append(" ").append(ni.next().toString()).toString();
        }
        return new StringBuffer().append(value).append(">").toString();
    }

    @Override // com.bea.xml.stream.events.NamedEvent, com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException, XMLStreamException {
        writer.write(60);
        QName name = getName();
        String prefix = name.getPrefix();
        if (prefix != null && prefix.length() > 0) {
            writer.write(prefix);
            writer.write(58);
        }
        writer.write(name.getLocalPart());
        Iterator ni = getNamespaces();
        while (ni.hasNext()) {
            writer.write(32);
            XMLEvent evt = (XMLEvent) ni.next();
            evt.writeAsEncodedUnicode(writer);
        }
        Iterator ai = getAttributes();
        while (ai.hasNext()) {
            writer.write(32);
            XMLEvent evt2 = (XMLEvent) ai.next();
            evt2.writeAsEncodedUnicode(writer);
        }
        writer.write(62);
    }
}
