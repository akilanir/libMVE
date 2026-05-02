package com.bea.xml.stream;

import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import javax.xml.stream.XMLInputFactory;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLStreamRecorder.class */
public class XMLStreamRecorder extends XMLWriterBase {
    public XMLStreamRecorder() {
    }

    public XMLStreamRecorder(Writer writer) {
        super(writer);
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected String writeName(String prefix, String namespaceURI, String localName) throws XMLStreamException {
        if (!"".equals(namespaceURI)) {
            write(new StringBuffer().append("['").append(namespaceURI).append("':").toString());
        } else {
            write("[");
        }
        String prefix2 = super.writeName(prefix, namespaceURI, localName);
        write(']');
        return prefix2;
    }

    protected void writeType(int type) throws XMLStreamException {
        closeStartElement();
        write('[');
        write(ElementTypeNames.getEventTypeString(type));
        write(']');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected void openStartTag() throws XMLStreamException {
        write('[');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected void closeStartTag() throws XMLStreamException {
        write("];\n");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected void openEndTag() throws XMLStreamException {
        write('[');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected void closeEndTag() throws XMLStreamException {
        write(']');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeAttribute(String namespaceURI, String localName, String value) throws XMLStreamException {
        write("[[ATTRIBUTE]");
        writeName("", namespaceURI, localName);
        write("=");
        writeCharactersInternal(value.toCharArray(), 0, value.length(), true);
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeNamespace(String prefix, String namespaceURI) throws XMLStreamException {
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before a namespace");
        }
        if (prefix == null || "".equals(prefix) || "xmlns".equals(prefix)) {
            writeDefaultNamespace(namespaceURI);
            return;
        }
        write("[[NAMESPACE][");
        write("xmlns:");
        write(prefix);
        write("]=[");
        write(namespaceURI);
        write("]");
        setPrefix(prefix, namespaceURI);
        write(']');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeDefaultNamespace(String namespaceURI) throws XMLStreamException {
        write("[[DEFAULT][");
        if (!isOpen()) {
            throw new XMLStreamException("A start element must be written before the default namespace");
        }
        write("xmlns]");
        write("=[");
        write(namespaceURI);
        write("]");
        setPrefix("", namespaceURI);
        write(']');
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeComment(String data) throws XMLStreamException {
        closeStartElement();
        write("[");
        if (data != null) {
            write(data);
        }
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeProcessingInstruction(String target, String text) throws XMLStreamException {
        closeStartElement();
        write("[");
        if (target != null) {
            write(new StringBuffer().append("[").append(target).append("]").toString());
        }
        if (text != null) {
            write(new StringBuffer().append(",[").append(text).append("]").toString());
        }
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeDTD(String dtd) throws XMLStreamException {
        write("[");
        super.write(dtd);
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeCData(String data) throws XMLStreamException {
        write("[");
        if (data != null) {
            write(data);
        }
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeEntityRef(String name) throws XMLStreamException {
        write("[");
        super.writeEntityRef(name);
        write("]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeStartDocument() throws XMLStreamException {
        write("[[1.0],[utf-8]]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeStartDocument(String version) throws XMLStreamException {
        write("[[");
        write(version);
        write("],[utf-8]]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    public void writeStartDocument(String encoding, String version) throws XMLStreamException {
        write("[[");
        write(version);
        write("],[");
        write(encoding);
        write("]]");
    }

    @Override // com.bea.xml.stream.XMLWriterBase
    protected void writeCharactersInternal(char[] characters, int start, int length, boolean isAttributeValue) throws XMLStreamException {
        if (length != 0) {
            write("[");
            write(characters, start, length);
            write("]");
            return;
        }
        write("[]");
    }

    @Override // com.bea.xml.stream.ReaderToWriter
    public void write(XMLStreamReader xmlr) throws XMLStreamException {
        writeType(xmlr.getEventType());
        super.write(xmlr);
        if (!isOpen()) {
            write(";\n");
        }
    }

    public static void main(String[] args) throws Exception {
        XMLInputFactory xmlif = XMLInputFactory.newInstance();
        XMLOutputFactory.newInstance();
        XMLStreamReader xmlr = xmlif.createXMLStreamReader(new FileReader(args[0]));
        XMLStreamRecorder r = new XMLStreamRecorder(new OutputStreamWriter(new FileOutputStream("out.stream")));
        while (xmlr.hasNext()) {
            r.write(xmlr);
            xmlr.next();
        }
        r.write(xmlr);
        r.flush();
    }
}
