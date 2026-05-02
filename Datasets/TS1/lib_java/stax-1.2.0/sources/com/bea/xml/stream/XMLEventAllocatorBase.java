package com.bea.xml.stream;

import com.bea.xml.stream.events.DTDEvent;
import com.bea.xml.stream.events.EntityDeclarationEvent;
import com.bea.xml.stream.util.ElementTypeNames;
import com.bea.xml.stream.util.EmptyIterator;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.xml.stream.XMLEventFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.events.Characters;
import javax.xml.stream.events.Comment;
import javax.xml.stream.events.DTD;
import javax.xml.stream.events.EndDocument;
import javax.xml.stream.events.EndElement;
import javax.xml.stream.events.EntityReference;
import javax.xml.stream.events.ProcessingInstruction;
import javax.xml.stream.events.StartDocument;
import javax.xml.stream.events.StartElement;
import javax.xml.stream.events.XMLEvent;
import javax.xml.stream.util.XMLEventAllocator;
import javax.xml.stream.util.XMLEventConsumer;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLEventAllocatorBase.class */
public class XMLEventAllocatorBase implements XMLEventAllocator {
    XMLEventFactory factory = XMLEventFactory.newInstance();

    public XMLEventAllocator newInstance() {
        return new XMLEventAllocatorBase();
    }

    public static Iterator getAttributes(XMLStreamReader reader) {
        if (reader.getAttributeCount() == 0) {
            return EmptyIterator.emptyIterator;
        }
        int attributeCount = reader.getAttributeCount();
        ArrayList atts = new ArrayList();
        for (int i = 0; i < attributeCount; i++) {
            atts.add(new AttributeBase(reader.getAttributePrefix(i), reader.getAttributeNamespace(i), reader.getAttributeLocalName(i), reader.getAttributeValue(i), reader.getAttributeType(i)));
        }
        return atts.iterator();
    }

    public static Iterator getNamespaces(XMLStreamReader reader) {
        if (reader.getNamespaceCount() == 0) {
            return EmptyIterator.emptyIterator;
        }
        ArrayList ns = new ArrayList();
        for (int i = 0; i < reader.getNamespaceCount(); i++) {
            String prefix = reader.getNamespacePrefix(i);
            if (prefix == null || prefix.equals("")) {
                ns.add(new NamespaceBase(reader.getNamespaceURI(i)));
            } else {
                ns.add(new NamespaceBase(prefix, reader.getNamespaceURI(i)));
            }
        }
        return ns.iterator();
    }

    public StartElement allocateStartElement(XMLStreamReader reader) throws XMLStreamException {
        String prefix = reader.getPrefix();
        String uri = reader.getNamespaceURI();
        if (prefix == null) {
            prefix = "";
        }
        if (uri == null) {
            uri = "";
        }
        return this.factory.createStartElement(prefix, uri, reader.getLocalName(), getAttributes(reader), getNamespaces(reader));
    }

    public EndElement allocateEndElement(XMLStreamReader reader) throws XMLStreamException {
        String prefix = reader.getPrefix();
        String uri = reader.getNamespaceURI();
        if (prefix == null) {
            prefix = "";
        }
        if (uri == null) {
            uri = "";
        }
        return this.factory.createEndElement(prefix, uri, reader.getLocalName(), getNamespaces(reader));
    }

    public Characters allocateCharacters(XMLStreamReader reader) throws XMLStreamException {
        int start = reader.getTextStart();
        int length = reader.getTextLength();
        String result = new String(reader.getTextCharacters(), start, length);
        if (reader.isWhiteSpace()) {
            return this.factory.createSpace(result);
        }
        return this.factory.createCharacters(result);
    }

    public Characters allocateCData(XMLStreamReader reader) throws XMLStreamException {
        return this.factory.createCData(reader.getText());
    }

    public Characters allocateSpace(XMLStreamReader reader) throws XMLStreamException {
        return this.factory.createSpace(reader.getText());
    }

    public EntityReference allocateEntityReference(XMLStreamReader reader) throws XMLStreamException {
        String name = reader.getLocalName();
        if (reader instanceof MXParser) {
        }
        EntityDeclarationEvent ed = new EntityDeclarationEvent(name, reader.getText());
        return this.factory.createEntityReference(name, ed);
    }

    public ProcessingInstruction allocatePI(XMLStreamReader reader) throws XMLStreamException {
        return this.factory.createProcessingInstruction(reader.getPITarget(), reader.getPIData());
    }

    public Comment allocateComment(XMLStreamReader reader) throws XMLStreamException {
        return this.factory.createComment(reader.getText());
    }

    public StartDocument allocateStartDocument(XMLStreamReader reader) throws XMLStreamException {
        return allocateXMLDeclaration(reader);
    }

    public EndDocument allocateEndDocument(XMLStreamReader reader) throws XMLStreamException {
        return this.factory.createEndDocument();
    }

    public DTD allocateDTD(XMLStreamReader reader) throws XMLStreamException {
        if (reader instanceof MXParser) {
            MXParser mxp = (MXParser) reader;
            DTDEvent evt = new DTDEvent(reader.getText());
            evt.setNotations((List) mxp.getProperty("javax.xml.stream.notations"));
            evt.setEntities((List) mxp.getProperty("javax.xml.stream.entities"));
            return evt;
        }
        return this.factory.createDTD(reader.getText());
    }

    public StartDocument allocateXMLDeclaration(XMLStreamReader reader) throws XMLStreamException {
        String encoding = reader.getCharacterEncodingScheme();
        String version = reader.getVersion();
        boolean standalone = reader.isStandalone();
        if (encoding != null && version != null && !standalone) {
            return this.factory.createStartDocument(encoding, version, standalone);
        }
        if (version != null && encoding != null) {
            return this.factory.createStartDocument(encoding, version);
        }
        if (encoding != null) {
            return this.factory.createStartDocument(encoding);
        }
        return this.factory.createStartDocument();
    }

    public XMLEvent allocate(XMLStreamReader reader) throws XMLStreamException {
        switch (reader.getEventType()) {
            case 1:
                return allocateStartElement(reader);
            case 2:
                return allocateEndElement(reader);
            case 3:
                return allocatePI(reader);
            case 4:
                return allocateCharacters(reader);
            case 5:
                return allocateComment(reader);
            case 6:
                return allocateCharacters(reader);
            case 7:
                return allocateStartDocument(reader);
            case 8:
                return allocateEndDocument(reader);
            case 9:
                return allocateEntityReference(reader);
            case 10:
            default:
                throw new XMLStreamException(new StringBuffer().append("Unable to allocate event[").append(reader.getEventType()).append(" , ").append(ElementTypeNames.getEventTypeString(reader.getEventType())).append("]").toString());
            case 11:
                return allocateDTD(reader);
            case 12:
                return allocateCData(reader);
        }
    }

    public void allocate(XMLStreamReader reader, XMLEventConsumer consumer) throws XMLStreamException {
        consumer.add(allocate(reader));
    }

    public String toString() {
        return "NonStaticAllocator";
    }
}
