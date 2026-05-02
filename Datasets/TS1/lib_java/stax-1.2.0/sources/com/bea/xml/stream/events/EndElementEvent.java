package com.bea.xml.stream.events;

import com.bea.xml.stream.util.EmptyIterator;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.namespace.QName;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.Namespace;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/EndElementEvent.class */
public class EndElementEvent extends NamedEvent implements EndElement {
    private List outOfScopeNamespaces;

    public EndElementEvent() {
        init();
    }

    public EndElementEvent(QName name) {
        super(name);
        init();
    }

    protected void init() {
        setEventType(2);
    }

    public Iterator getNamespaces() {
        if (this.outOfScopeNamespaces == null) {
            return EmptyIterator.emptyIterator;
        }
        return this.outOfScopeNamespaces.iterator();
    }

    public void addNamespace(Namespace n) {
        if (this.outOfScopeNamespaces == null) {
            this.outOfScopeNamespaces = new ArrayList();
        }
        this.outOfScopeNamespaces.add(n);
    }

    public void reset() {
        if (this.outOfScopeNamespaces != null) {
            this.outOfScopeNamespaces.clear();
        }
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String toString() {
        String value = new StringBuffer().append("</").append(nameAsString()).toString();
        Iterator ni = getNamespaces();
        while (ni.hasNext()) {
            value = new StringBuffer().append(value).append(" ").append(ni.next().toString()).toString();
        }
        return new StringBuffer().append(value).append(">").toString();
    }

    @Override // com.bea.xml.stream.events.NamedEvent, com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("</");
        QName name = getName();
        String prefix = name.getPrefix();
        if (prefix != null && prefix.length() > 0) {
            writer.write(prefix);
            writer.write(58);
        }
        writer.write(name.getLocalPart());
        writer.write(62);
    }
}
