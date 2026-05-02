package com.bea.xml.stream;

import com.bea.xml.stream.util.CircularQueue;
import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileReader;
import java.util.NoSuchElementException;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.XMLEvent;
import javax.xml.stream.util.XMLEventAllocator;
import javax.xml.stream.util.XMLEventConsumer;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLEventReaderBase.class */
public class XMLEventReaderBase implements XMLEventReader, XMLEventConsumer {
    private CircularQueue elementQ;
    private boolean open;
    protected XMLStreamReader reader;
    protected XMLEventAllocator allocator;
    private boolean reachedEOF;
    private ConfigurationContextBase configurationContext;

    public XMLEventReaderBase(XMLStreamReader reader) throws XMLStreamException {
        this(reader, new XMLEventAllocatorBase());
    }

    public XMLEventReaderBase(XMLStreamReader reader, XMLEventAllocator alloc) throws XMLStreamException {
        this.elementQ = new CircularQueue();
        this.open = true;
        this.reachedEOF = false;
        if (reader == null) {
            throw new IllegalArgumentException("XMLStreamReader may not be null");
        }
        if (alloc == null) {
            throw new IllegalArgumentException("XMLEventAllocator may not be null");
        }
        this.reader = reader;
        this.open = true;
        this.allocator = alloc;
        if (reader.getEventType() == 7) {
            XMLEvent e = this.allocator.allocate(reader);
            reader.next();
            add(e);
        }
    }

    public void setAllocator(XMLEventAllocator allocator) {
        if (allocator == null) {
            throw new IllegalArgumentException("XMLEvent Allocator may not be null");
        }
        this.allocator = allocator;
    }

    public String getElementText() throws XMLStreamException {
        StringBuffer buf = new StringBuffer();
        XMLEvent e = nextEvent();
        if (!e.isStartElement()) {
            throw new XMLStreamException(new StringBuffer().append("Precondition for readText is nextEvent().getTypeEventType() == START_ELEMENT (got ").append(e.getEventType()).append(")").toString());
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

    public Object next() {
        try {
            return nextEvent();
        } catch (XMLStreamException e) {
            return null;
        }
    }

    public XMLEvent nextEvent() throws XMLStreamException {
        if (needsMore() && !parseSome()) {
            throw new NoSuchElementException("Attempt to call nextEvent() on a stream with no more elements");
        }
        return get();
    }

    public boolean hasNext() {
        if (!this.open) {
            return false;
        }
        if (!this.elementQ.isEmpty()) {
            return true;
        }
        try {
            if (this.reader.hasNext()) {
                return true;
            }
            this.open = false;
            return false;
        } catch (XMLStreamException e) {
            return false;
        }
    }

    public XMLEvent peek() throws XMLStreamException {
        if (!this.elementQ.isEmpty()) {
            return (XMLEvent) this.elementQ.peek();
        }
        if (parseSome()) {
            return (XMLEvent) this.elementQ.peek();
        }
        return null;
    }

    public void add(XMLEvent event) throws XMLStreamException {
        this.elementQ.add(event);
    }

    protected boolean needsMore() {
        return this.elementQ.isEmpty();
    }

    protected XMLEvent get() throws XMLStreamException {
        return (XMLEvent) this.elementQ.remove();
    }

    protected boolean isOpen() {
        return !this.reachedEOF;
    }

    protected void internal_close() {
        this.reachedEOF = true;
    }

    public void close() throws XMLStreamException {
        internal_close();
    }

    protected boolean parseSome() throws XMLStreamException {
        if (this.reachedEOF) {
            return false;
        }
        this.allocator.allocate(this.reader, this);
        if (this.reader.hasNext()) {
            this.reader.next();
        }
        if (this.reader.getEventType() == 8) {
            this.allocator.allocate(this.reader, this);
            this.reachedEOF = true;
        }
        return !needsMore();
    }

    public void setConfigurationContext(ConfigurationContextBase base) {
        this.configurationContext = base;
    }

    public Object getProperty(String name) {
        return this.configurationContext.getProperty(name);
    }

    public void remove() {
        throw new UnsupportedOperationException();
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        System.setProperty("javax.xml.stream.XMLEventFactory", "com.bea.xml.stream.EventFactory");
        XMLInputFactory factory = XMLInputFactory.newInstance();
        XMLEventReader xmlr = factory.createXMLEventReader(new FileReader(args[0]));
        while (xmlr.hasNext()) {
            XMLEvent e = xmlr.nextEvent();
            System.out.println(new StringBuffer().append("[").append(ElementTypeNames.getEventTypeString(e.getEventType())).append("][").append(e).append("]").toString());
        }
    }
}
