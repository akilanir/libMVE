package com.bea.xml.stream;

import com.bea.xml.stream.events.CharactersEvent;
import com.bea.xml.stream.events.CommentEvent;
import com.bea.xml.stream.events.DTDEvent;
import com.bea.xml.stream.events.EndDocumentEvent;
import com.bea.xml.stream.events.EndElementEvent;
import com.bea.xml.stream.events.EntityReferenceEvent;
import com.bea.xml.stream.events.ProcessingInstructionEvent;
import com.bea.xml.stream.events.StartDocumentEvent;
import com.bea.xml.stream.events.StartElementEvent;
import com.bea.xml.stream.util.ElementTypeNames;
import java.util.Iterator;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
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
import javax.xml.stream.util.XMLEventAllocator;
import javax.xml.stream.util.XMLEventConsumer;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/StaticAllocator.class */
public class StaticAllocator implements XMLEventAllocator {
    public static final String FEATURE_STAX_NOTATIONS = "javax.xml.stream.notations";
    public static final String FEATURE_STAX_ENTITIES = "javax.xml.stream.entities";
    StartElementEvent startElement = new StartElementEvent();
    EndElementEvent endElement = new EndElementEvent();
    CharactersEvent characters = new CharactersEvent();
    CharactersEvent cData = new CharactersEvent("", true);
    CharactersEvent space = new CharactersEvent();
    CommentEvent comment = new CommentEvent();
    EntityReferenceEvent entity = new EntityReferenceEvent();
    ProcessingInstructionEvent pi = new ProcessingInstructionEvent();
    StartDocumentEvent startDoc = new StartDocumentEvent();
    EndDocumentEvent endDoc = new EndDocumentEvent();
    DTDEvent dtd = new DTDEvent();

    public XMLEventAllocator newInstance() {
        return new StaticAllocator();
    }

    public StartElement allocateStartElement(XMLStreamReader reader) throws XMLStreamException {
        this.startElement.reset();
        String prefix = EventFactory.checkPrefix(reader.getPrefix());
        this.startElement.setName(new QName(reader.getNamespaceURI(), reader.getLocalName(), prefix));
        Iterator ai = XMLEventAllocatorBase.getAttributes(reader);
        while (ai.hasNext()) {
            this.startElement.addAttribute((Attribute) ai.next());
        }
        Iterator ni = XMLEventAllocatorBase.getNamespaces(reader);
        while (ni.hasNext()) {
            this.startElement.addAttribute((Namespace) ni.next());
        }
        return this.startElement;
    }

    public EndElement allocateEndElement(XMLStreamReader reader) throws XMLStreamException {
        this.endElement.reset();
        String prefix = EventFactory.checkPrefix(reader.getPrefix());
        this.endElement.setName(new QName(reader.getNamespaceURI(), reader.getLocalName(), prefix));
        Iterator ni = XMLEventAllocatorBase.getNamespaces(reader);
        while (ni.hasNext()) {
            this.endElement.addNamespace((Namespace) ni.next());
        }
        return this.endElement;
    }

    public Characters allocateCharacters(XMLStreamReader reader) throws XMLStreamException {
        this.characters.setData(reader.getText());
        return this.characters;
    }

    public Characters allocateCData(XMLStreamReader reader) throws XMLStreamException {
        this.cData.setData(reader.getText());
        return this.cData;
    }

    public Characters allocateSpace(XMLStreamReader reader) throws XMLStreamException {
        this.space.setSpace(true);
        this.space.setData(reader.getText());
        return this.space;
    }

    public EntityReference allocateEntityReference(XMLStreamReader reader) throws XMLStreamException {
        this.entity.setName(reader.getLocalName());
        this.entity.setReplacementText(reader.getText());
        return this.entity;
    }

    public ProcessingInstruction allocatePI(XMLStreamReader reader) throws XMLStreamException {
        this.pi.setTarget(reader.getPITarget());
        this.pi.setData(reader.getPIData());
        return this.pi;
    }

    public Comment allocateComment(XMLStreamReader reader) throws XMLStreamException {
        this.comment.setData(reader.getText());
        return this.comment;
    }

    public StartDocument allocateStartDocument(XMLStreamReader reader) throws XMLStreamException {
        allocateXMLDeclaration(reader);
        return this.startDoc;
    }

    public EndDocument allocateEndDocument(XMLStreamReader reader) throws XMLStreamException {
        return this.endDoc;
    }

    public DTD allocateDTD(XMLStreamReader reader) throws XMLStreamException {
        this.dtd.setDTD(reader.getText());
        return this.dtd;
    }

    public StartDocument allocateXMLDeclaration(XMLStreamReader reader) throws XMLStreamException {
        this.startDoc.clear();
        String encoding = reader.getCharacterEncodingScheme();
        String version = reader.getVersion();
        boolean standalone = reader.isStandalone();
        if (encoding != null && version != null && !standalone) {
            this.startDoc.setEncoding(encoding);
            this.startDoc.setVersion(version);
            this.startDoc.setStandalone(standalone);
            return this.startDoc;
        }
        if (version != null && encoding != null) {
            this.startDoc.setEncoding(encoding);
            this.startDoc.setVersion(version);
            return this.startDoc;
        }
        if (encoding != null) {
            this.startDoc.setEncoding(encoding);
        }
        return this.startDoc;
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
                throw new XMLStreamException(new StringBuffer().append("Unable to allocate event[").append(ElementTypeNames.getEventTypeString(reader.getEventType())).append("]").toString());
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
        return "Static Allocator";
    }
}
