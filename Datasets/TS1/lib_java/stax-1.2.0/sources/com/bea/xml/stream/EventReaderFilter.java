package com.bea.xml.stream;

import com.bea.xml.stream.filters.TypeFilter;
import java.io.FileReader;
import javax.xml.stream.EventFilter;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.XMLEvent;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/EventReaderFilter.class */
public class EventReaderFilter implements XMLEventReader {
    private XMLEventReader parent;
    private EventFilter filter;

    public EventReaderFilter(XMLEventReader reader) throws XMLStreamException {
        this.parent = reader;
    }

    public EventReaderFilter(XMLEventReader reader, EventFilter filter) throws XMLStreamException {
        this.parent = reader;
        this.filter = filter;
    }

    public void setFilter(EventFilter filter) {
        this.filter = filter;
    }

    public Object next() {
        try {
            return nextEvent();
        } catch (XMLStreamException e) {
            return null;
        }
    }

    public XMLEvent nextEvent() throws XMLStreamException {
        if (hasNext()) {
            return this.parent.nextEvent();
        }
        return null;
    }

    public String getElementText() throws XMLStreamException {
        StringBuffer buf = new StringBuffer();
        XMLEvent e = nextEvent();
        if (!e.isStartElement()) {
            throw new XMLStreamException("Precondition for readText is nextEvent().getTypeEventType() == START_ELEMENT");
        }
        while (hasNext()) {
            Characters peek = peek();
            if (peek.isStartElement()) {
                throw new XMLStreamException("Unexpected Element start");
            }
            if (peek.isCharacters()) {
                buf.append(peek.getData());
            }
            if (peek.isEndElement()) {
                return buf.toString();
            }
            nextEvent();
        }
        throw new XMLStreamException("Unexpected end of Document");
    }

    public XMLEvent nextTag() throws XMLStreamException {
        while (hasNext()) {
            Characters nextEvent = nextEvent();
            if (nextEvent.isCharacters() && !nextEvent.isWhiteSpace()) {
                throw new XMLStreamException("Unexpected text");
            }
            if (nextEvent.isStartElement() || nextEvent.isEndElement()) {
                return nextEvent;
            }
        }
        throw new XMLStreamException("Unexpected end of Document");
    }

    public boolean hasNext() {
        while (this.parent.hasNext()) {
            try {
                if (this.filter.accept(this.parent.peek())) {
                    return true;
                }
                this.parent.nextEvent();
            } catch (XMLStreamException e) {
                return false;
            }
        }
        return false;
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    public XMLEvent peek() throws XMLStreamException {
        if (hasNext()) {
            return this.parent.peek();
        }
        return null;
    }

    public void close() throws XMLStreamException {
        this.parent.close();
    }

    public Object getProperty(String name) {
        return this.parent.getProperty(name);
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        System.setProperty("javax.xml.stream.XMLEventFactory", "com.bea.xml.stream.EventFactory");
        XMLInputFactory factory = XMLInputFactory.newInstance();
        TypeFilter f = new TypeFilter();
        f.addType(1);
        f.addType(2);
        XMLEventReader reader = factory.createFilteredReader(factory.createXMLEventReader(new FileReader(args[0])), f);
        while (reader.hasNext()) {
            System.out.println(reader.nextEvent());
        }
    }
}
