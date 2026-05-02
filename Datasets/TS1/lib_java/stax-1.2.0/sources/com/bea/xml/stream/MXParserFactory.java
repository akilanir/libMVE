package com.bea.xml.stream;

import java.io.InputStream;
import java.io.Reader;
import javax.xml.stream.EventFilter;
import javax.xml.stream.StreamFilter;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLReporter;
import javax.xml.stream.XMLResolver;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.util.XMLEventAllocator;
import javax.xml.transform.Source;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXSource;
import org.xml.sax.InputSource;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/MXParserFactory.class */
public class MXParserFactory extends XMLInputFactory {
    ConfigurationContextBase config = new ConfigurationContextBase();

    public static XMLInputFactory newInstance() {
        return XMLInputFactory.newInstance();
    }

    public XMLStreamReader createXMLStreamReader(Source source) throws XMLStreamException {
        if (source instanceof SAXSource) {
            SAXSource ss = (SAXSource) source;
            InputSource isource = ss.getInputSource();
            if (isource != null) {
                String sysId = isource.getSystemId();
                Reader r = isource.getCharacterStream();
                if (r != null) {
                    return createXMLStreamReader(sysId, r);
                }
                InputStream in = isource.getByteStream();
                if (in != null) {
                    return createXMLStreamReader(sysId, in);
                }
            }
            throw new XMLStreamException("Can only create STaX reader for a SAXSource if Reader or InputStream exposed via getSource(); can not use -- not implemented.");
        }
        if (source instanceof DOMSource) {
        }
        throw new UnsupportedOperationException(new StringBuffer().append("XMLInputFactory.createXMLStreamReader(").append(source.getClass().getName()).append(") not yet implemented").toString());
    }

    public XMLStreamReader createXMLStreamReader(InputStream stream) throws XMLStreamException {
        MXParser pp = new MXParser();
        pp.setInput(stream);
        pp.setConfigurationContext(this.config);
        return pp;
    }

    public XMLStreamReader createXMLStreamReader(InputStream stream, String encoding) throws XMLStreamException {
        MXParser pp = new MXParser();
        pp.setInput(stream, encoding);
        pp.setConfigurationContext(this.config);
        return pp;
    }

    public XMLStreamReader createXMLStreamReader(String systemId, InputStream stream) throws XMLStreamException {
        return createXMLStreamReader(stream);
    }

    public XMLStreamReader createXMLStreamReader(String systemId, Reader reader) throws XMLStreamException {
        return createXMLStreamReader(reader);
    }

    public XMLEventReader createXMLEventReader(String systemId, Reader reader) throws XMLStreamException {
        return createXMLEventReader(reader);
    }

    public XMLEventReader createXMLEventReader(String systemId, InputStream stream) throws XMLStreamException {
        return createXMLEventReader(stream);
    }

    public XMLEventReader createXMLEventReader(Reader reader) throws XMLStreamException {
        return createXMLEventReader(createXMLStreamReader(reader));
    }

    public XMLEventReader createXMLEventReader(XMLStreamReader reader) throws XMLStreamException {
        XMLEventReaderBase base;
        if (this.config.getEventAllocator() == null) {
            base = new XMLEventReaderBase(reader);
        } else {
            base = new XMLEventReaderBase(reader, this.config.getEventAllocator().newInstance());
        }
        return base;
    }

    public XMLEventReader createXMLEventReader(Source source) throws XMLStreamException {
        return createXMLEventReader(createXMLStreamReader(source));
    }

    public XMLEventReader createXMLEventReader(InputStream stream) throws XMLStreamException {
        return createXMLEventReader(createXMLStreamReader(stream));
    }

    public XMLEventReader createXMLEventReader(InputStream stream, String encoding) throws XMLStreamException {
        return createXMLEventReader(createXMLStreamReader(stream, encoding));
    }

    public XMLResolver getXMLResolver() {
        return this.config.getXMLResolver();
    }

    public void setXMLResolver(XMLResolver resolver) {
        this.config.setXMLResolver(resolver);
    }

    public XMLStreamReader createFilteredReader(XMLStreamReader reader, StreamFilter filter) throws XMLStreamException {
        return new StreamReaderFilter(reader, filter);
    }

    public XMLEventReader createFilteredReader(XMLEventReader reader, EventFilter filter) throws XMLStreamException {
        return new EventReaderFilter(reader, filter);
    }

    public XMLReporter getXMLReporter() {
        return this.config.getXMLReporter();
    }

    public void setXMLReporter(XMLReporter reporter) {
        this.config.setXMLReporter(reporter);
    }

    public void setEventAllocator(XMLEventAllocator allocator) {
        this.config.setEventAllocator(allocator);
    }

    public XMLEventAllocator getEventAllocator() {
        return this.config.getEventAllocator();
    }

    public void setCoalescing(boolean coalescing) {
        this.config.setCoalescing(coalescing);
    }

    public boolean isCoalescing() {
        return this.config.isCoalescing();
    }

    public void setProperty(String name, Object value) throws IllegalArgumentException {
        this.config.setProperty(name, value);
    }

    public Object getProperty(String name) throws IllegalArgumentException {
        return this.config.getProperty(name);
    }

    public XMLStreamReader createXMLStreamReader(Reader in) throws XMLStreamException {
        MXParser pp = new MXParser();
        pp.setInput(in);
        pp.setConfigurationContext(this.config);
        return pp;
    }

    public boolean isPropertySupported(String name) {
        return this.config.isPropertySupported(name);
    }
}
