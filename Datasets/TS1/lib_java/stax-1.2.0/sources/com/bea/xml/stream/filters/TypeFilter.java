package com.bea.xml.stream.filters;

import javax.xml.stream.EventFilter;
import javax.xml.stream.StreamFilter;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.XMLEvent;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/filters/TypeFilter.class */
public class TypeFilter implements EventFilter, StreamFilter {
    protected boolean[] types = new boolean[20];

    public void addType(int type) {
        this.types[type] = true;
    }

    public boolean accept(XMLEvent e) {
        return this.types[e.getEventType()];
    }

    public boolean accept(XMLStreamReader r) {
        return this.types[r.getEventType()];
    }
}
