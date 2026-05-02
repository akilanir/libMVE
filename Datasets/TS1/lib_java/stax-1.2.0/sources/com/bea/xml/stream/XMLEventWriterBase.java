package com.bea.xml.stream;

import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileReader;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Iterator;
import javax.xml.namespace.NamespaceContext;
import javax.xml.stream.XMLEventReader;
import javax.xml.stream.XMLEventWriter;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamWriter;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.Comment;
import javax.xml.stream.events.DTD;
import javax.xml.stream.events.EndDocument;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.EntityReference;
import javax.xml.stream.events.Namespace;
import javax.xml.stream.events.ProcessingInstruction;
import javax.xml.stream.events.StartDocument;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import javax.xml.stream.util.XMLEventConsumer;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLEventWriterBase.class */
public class XMLEventWriterBase implements XMLEventWriter, XMLEventConsumer {
    XMLStreamWriter writer;

    public XMLEventWriterBase(XMLStreamWriter writer) {
        this.writer = writer;
    }

    public void flush() throws XMLStreamException {
        this.writer.flush();
    }

    public void close() throws XMLStreamException {
        this.writer.close();
    }

    private void addStartElement(StartElement se) throws XMLStreamException {
        String prefix = se.getName().getPrefix();
        String namespace = se.getName().getNamespaceURI();
        String localName = se.getName().getLocalPart();
        this.writer.writeStartElement(prefix, localName, namespace);
        Iterator ni = se.getNamespaces();
        while (ni.hasNext()) {
            writeNamespace((Namespace) ni.next());
        }
        Iterator ai = se.getAttributes();
        while (ai.hasNext()) {
            writeAttribute((Attribute) ai.next());
        }
    }

    private void addEndElement(EndElement ee) throws XMLStreamException {
        ee.getName().getPrefix();
        ee.getName().getNamespaceURI();
        ee.getName().getLocalPart();
        this.writer.writeEndElement();
    }

    public void addCharacters(Characters cd) throws XMLStreamException {
        if (cd.isCData()) {
            this.writer.writeCData(cd.getData());
        } else {
            this.writer.writeCharacters(cd.getData());
        }
    }

    public void addEntityReference(EntityReference er) throws XMLStreamException {
        this.writer.writeEntityRef(er.getName());
    }

    public void addProcessingInstruction(ProcessingInstruction pi) throws XMLStreamException {
        this.writer.writeProcessingInstruction(pi.getTarget(), pi.getData());
    }

    public void addComment(Comment c) throws XMLStreamException {
        this.writer.writeComment(c.getText());
    }

    public void addStartDocument(StartDocument sd) throws XMLStreamException {
        String encoding = sd.getCharacterEncodingScheme();
        String version = sd.getVersion();
        sd.isStandalone();
        this.writer.writeStartDocument(encoding, version);
    }

    public void addEndDocument(EndDocument ed) throws XMLStreamException {
    }

    private void writeAttribute(Attribute a) throws XMLStreamException {
        this.writer.writeAttribute(a.getName().getNamespaceURI(), a.getName().getLocalPart(), a.getValue());
    }

    public void addAttribute(Attribute a) throws XMLStreamException {
        writeAttribute(a);
    }

    public void writeNamespace(Namespace n) throws XMLStreamException {
        if (n.isDefaultNamespaceDeclaration()) {
            this.writer.writeDefaultNamespace(n.getNamespaceURI());
        } else {
            this.writer.writeNamespace(n.getPrefix(), n.getNamespaceURI());
        }
    }

    public void addNamespace(Namespace ns) throws XMLStreamException {
        writeNamespace(ns);
    }

    public void addDTD(DTD dtd) throws XMLStreamException {
        this.writer.writeDTD(dtd.getDocumentTypeDeclaration());
    }

    public void add(XMLEvent e) throws XMLStreamException {
        switch (e.getEventType()) {
            case 1:
                addStartElement((StartElement) e);
                return;
            case 2:
                addEndElement((EndElement) e);
                return;
            case 3:
                addProcessingInstruction((ProcessingInstruction) e);
                return;
            case 4:
                addCharacters((Characters) e);
                return;
            case 5:
                addComment((Comment) e);
                return;
            case 6:
            case 12:
            default:
                throw new XMLStreamException(new StringBuffer().append("Unable to add event[").append(ElementTypeNames.getEventTypeString(e.getEventType())).append("]").toString());
            case 7:
                addStartDocument((StartDocument) e);
                return;
            case 8:
                addEndDocument((EndDocument) e);
                return;
            case 9:
                addEntityReference((EntityReference) e);
                return;
            case 10:
                addAttribute((Attribute) e);
                return;
            case 11:
                addDTD((DTD) e);
                return;
            case 13:
                addNamespace((Namespace) e);
                return;
        }
    }

    public void add(XMLEventReader stream) throws XMLStreamException {
        while (stream.hasNext()) {
            add(stream.nextEvent());
        }
    }

    public String getPrefix(String uri) throws XMLStreamException {
        return this.writer.getPrefix(uri);
    }

    public void setPrefix(String prefix, String uri) throws XMLStreamException {
        this.writer.setPrefix(prefix, uri);
    }

    public void setDefaultNamespace(String uri) throws XMLStreamException {
        this.writer.setDefaultNamespace(uri);
    }

    public void setNamespaceContext(NamespaceContext context) throws XMLStreamException {
        this.writer.setNamespaceContext(context);
    }

    public NamespaceContext getNamespaceContext() {
        return this.writer.getNamespaceContext();
    }

    public static void main(String[] args) throws Exception {
        System.setProperty("javax.xml.stream.XMLInputFactory", "com.bea.xml.stream.MXParserFactory");
        System.setProperty("javax.xml.stream.XMLEventFactory", "com.bea.xml.stream.EventFactory");
        Writer w = new OutputStreamWriter(System.out);
        XMLEventWriterBase writer = new XMLEventWriterBase(new XMLWriterBase(w));
        MXParser parser = new MXParser();
        parser.setConfigurationContext(new ConfigurationContextBase());
        parser.setInput(new FileReader(args[0]));
        XMLEventReaderBase reader = new XMLEventReaderBase(parser);
        while (reader.hasNext()) {
            XMLEvent e = reader.nextEvent();
            System.out.println(new StringBuffer().append("about to add:[").append(e).append("];").toString());
            writer.add(e);
        }
        writer.flush();
    }
}
