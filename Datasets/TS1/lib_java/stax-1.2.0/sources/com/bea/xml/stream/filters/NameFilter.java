package com.bea.xml.stream.filters;

import javax.xml.namespace.QName;
import javax.xml.stream.EventFilter;
import javax.xml.stream.StreamFilter;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/filters/NameFilter.class */
public class NameFilter implements EventFilter, StreamFilter {
    private QName name;

    public NameFilter(QName name) {
        this.name = name;
    }

    public boolean accept(XMLEvent e) {
        QName eName;
        if (!e.isStartElement() && !e.isEndElement()) {
            return false;
        }
        if (e.isStartElement()) {
            eName = ((StartElement) e).getName();
        } else {
            eName = ((EndElement) e).getName();
        }
        if (this.name.equals(eName)) {
            return true;
        }
        return false;
    }

    public boolean accept(XMLStreamReader r) {
        if (!r.isStartElement() && !r.isEndElement()) {
            return false;
        }
        QName eName = new QName(r.getNamespaceURI(), r.getLocalName());
        if (this.name.equals(eName)) {
            return true;
        }
        return false;
    }
}
