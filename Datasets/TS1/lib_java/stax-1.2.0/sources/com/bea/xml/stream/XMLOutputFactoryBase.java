package com.bea.xml.stream;

import java.io.BufferedWriter;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import javax.xml.transform.Result;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLOutputFactoryBase.class */
public class XMLOutputFactoryBase extends XMLOutputFactory {
    ConfigurationContextBase config = new ConfigurationContextBase();

    public XMLStreamWriter createXMLStreamWriter(Writer stream) throws XMLStreamException {
        XMLWriterBase b = new XMLWriterBase(stream);
        b.setConfigurationContext(this.config);
        return b;
    }

    public XMLStreamWriter createXMLStreamWriter(OutputStream stream) throws XMLStreamException {
        return createXMLStreamWriter(new BufferedWriter(new OutputStreamWriter(stream), 500));
    }

    public XMLStreamWriter createXMLStreamWriter(OutputStream stream, String encoding) throws XMLStreamException {
        try {
            return createXMLStreamWriter(new BufferedWriter(new OutputStreamWriter(stream, encoding), 500));
        } catch (UnsupportedEncodingException uee) {
            throw new XMLStreamException(new StringBuffer().append("Unsupported encoding ").append(encoding).toString(), uee);
        }
    }

    public XMLEventWriter createXMLEventWriter(OutputStream stream) throws XMLStreamException {
        return new XMLEventWriterBase(createXMLStreamWriter(stream));
    }

    public XMLEventWriter createXMLEventWriter(Writer stream) throws XMLStreamException {
        return new XMLEventWriterBase(createXMLStreamWriter(stream));
    }

    public XMLEventWriter createXMLEventWriter(OutputStream stream, String encoding) throws XMLStreamException {
        return new XMLEventWriterBase(createXMLStreamWriter(stream, encoding));
    }

    public void setProperty(String name, Object value) {
        this.config.setProperty(name, value);
    }

    public Object getProperty(String name) {
        return this.config.getProperty(name);
    }

    public boolean isPrefixDefaulting() {
        return this.config.isPrefixDefaulting();
    }

    public void setPrefixDefaulting(boolean value) {
        this.config.setPrefixDefaulting(value);
    }

    public boolean isPropertySupported(String name) {
        return this.config.isPropertySupported(name);
    }

    public XMLStreamWriter createXMLStreamWriter(Result result) throws XMLStreamException {
        throw new UnsupportedOperationException();
    }

    public XMLEventWriter createXMLEventWriter(Result result) throws XMLStreamException {
        throw new UnsupportedOperationException();
    }
}
