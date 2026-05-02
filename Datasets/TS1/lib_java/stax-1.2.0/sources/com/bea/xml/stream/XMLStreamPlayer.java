package com.bea.xml.stream;

import com.bea.xml.stream.util.NamespaceContextImpl;
import java.io.FileReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import javax.xml.namespace.NamespaceContext;
import javax.xml.namespace.QName;
import javax.xml.stream.Location;
import javax.xml.stream.XMLOutputFactory;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;
import javax.xml.stream.XMLStreamWriter;
import javax.xml.stream.events.Attribute;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLStreamPlayer.class */
public class XMLStreamPlayer implements XMLStreamReader {
    EventState state;
    EventScanner scanner;
    NamespaceContextImpl context = new NamespaceContextImpl();

    public XMLStreamPlayer() {
    }

    public XMLStreamPlayer(InputStream stream) {
        try {
            this.scanner = new EventScanner(new InputStreamReader(stream));
            next();
            if (getEventType() == 7) {
                String encoding = getCharacterEncodingScheme();
                this.scanner = new EventScanner(new InputStreamReader(stream, encoding));
            }
        } catch (Exception e) {
            throw new IllegalArgumentException(new StringBuffer().append("Unable to instantiate the XMLStreamPlayer").append(e.getMessage()).toString());
        }
    }

    public XMLStreamPlayer(Reader reader) {
        try {
            this.scanner = new EventScanner(reader);
            next();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public Object getProperty(String name) throws IllegalArgumentException {
        return null;
    }

    public int next() throws XMLStreamException {
        try {
            if (!this.scanner.hasNext()) {
                this.state = null;
                return -1;
            }
            this.state = this.scanner.readElement();
            if (isStartElement()) {
                this.context.openScope();
                for (int i = 0; i < getNamespaceCount(); i++) {
                    this.context.bindNamespace(getNamespacePrefix(i), getNamespaceURI(i));
                }
            } else if (isEndElement() && this.context.getDepth() > 0) {
                this.context.closeScope();
            }
            return this.state.getType();
        } catch (Exception e) {
            System.out.println(e);
            e.printStackTrace();
            throw new XMLStreamException(e.getMessage(), e);
        }
    }

    public void require(int type, String namespaceURI, String localName) throws XMLStreamException {
    }

    public String getElementText() throws XMLStreamException {
        StringBuffer buf = new StringBuffer();
        if (getEventType() != 1) {
            throw new XMLStreamException("Precondition for readText is getEventType() == START_ELEMENT");
        }
        while (next() != 8) {
            if (isStartElement()) {
                throw new XMLStreamException("Unexpected Element start");
            }
            if (isCharacters()) {
                buf.append(getText());
            }
            if (isEndElement()) {
                return buf.toString();
            }
        }
        throw new XMLStreamException("Unexpected end of Document");
    }

    public int nextTag() throws XMLStreamException {
        while (next() != 8) {
            if (isCharacters() && !isWhiteSpace()) {
                throw new XMLStreamException("Unexpected text");
            }
            if (isStartElement() || isEndElement()) {
                return getEventType();
            }
        }
        throw new XMLStreamException("Unexpected end of Document");
    }

    public boolean hasNext() throws XMLStreamException {
        try {
            if (this.state != null) {
                if (this.state.getType() != 8) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            throw new XMLStreamException(e);
        }
    }

    public void close() throws XMLStreamException {
    }

    public String getNamespaceURI(String prefix) {
        return this.context.getNamespaceURI(prefix);
    }

    private Attribute getAttributeInternal(int index) {
        return (Attribute) this.state.getAttributes().get(index);
    }

    private Attribute getNamespaceInternal(int index) {
        return (Attribute) this.state.getNamespaces().get(index);
    }

    public boolean isStartElement() {
        return (getEventType() & 1) != 0;
    }

    public boolean isEndElement() {
        return (getEventType() & 2) != 0;
    }

    public boolean isCharacters() {
        return (getEventType() & 4) != 0;
    }

    public boolean isWhiteSpace() {
        return false;
    }

    public String getAttributeValue(String namespaceUri, String localName) {
        for (int i = 0; i < getAttributeCount(); i++) {
            Attribute a = getAttributeInternal(i);
            if (localName.equals(a.getName().getLocalPart())) {
                if (namespaceUri == null) {
                    return a.getValue();
                }
                if (namespaceUri.equals(a.getName().getNamespaceURI())) {
                    return a.getValue();
                }
            }
        }
        return null;
    }

    public int getAttributeCount() {
        if (isStartElement()) {
            return this.state.getAttributes().size();
        }
        return 0;
    }

    public QName getAttributeName(int index) {
        return new QName(getAttributeNamespace(index), getAttributeLocalName(index), getAttributePrefix(index));
    }

    public String getAttributeNamespace(int index) {
        Attribute a = getAttributeInternal(index);
        if (a == null) {
            return null;
        }
        return a.getName().getNamespaceURI();
    }

    public String getAttributeLocalName(int index) {
        Attribute a = getAttributeInternal(index);
        if (a == null) {
            return null;
        }
        return a.getName().getLocalPart();
    }

    public String getAttributePrefix(int index) {
        Attribute a = getAttributeInternal(index);
        if (a == null) {
            return null;
        }
        return a.getName().getPrefix();
    }

    public String getAttributeType(int index) {
        return "CDATA";
    }

    public String getAttributeValue(int index) {
        Attribute a = getAttributeInternal(index);
        if (a == null) {
            return null;
        }
        return a.getValue();
    }

    public boolean isAttributeSpecified(int index) {
        return false;
    }

    public int getNamespaceCount() {
        if (isStartElement()) {
            return this.state.getNamespaces().size();
        }
        return 0;
    }

    public String getNamespacePrefix(int index) {
        Attribute a = getNamespaceInternal(index);
        if (a == null) {
            return null;
        }
        return a.getName().getLocalPart();
    }

    public String getNamespaceURI(int index) {
        Attribute a = getNamespaceInternal(index);
        if (a == null) {
            return null;
        }
        return a.getValue();
    }

    public NamespaceContext getNamespaceContext() {
        return this.context;
    }

    public XMLStreamReader subReader() throws XMLStreamException {
        return null;
    }

    public int getEventType() {
        if (this.state == null) {
            return 8;
        }
        return this.state.getType();
    }

    public String getText() {
        return this.state.getData();
    }

    public Reader getTextStream() {
        throw new UnsupportedOperationException();
    }

    public char[] getTextCharacters() {
        return this.state.getData().toCharArray();
    }

    public int getTextCharacters(int src, char[] target, int targetStart, int length) throws XMLStreamException {
        throw new UnsupportedOperationException();
    }

    public int getTextStart() {
        return 0;
    }

    public int getTextLength() {
        return this.state.getData().length();
    }

    public String getEncoding() {
        return this.state.getData();
    }

    public boolean hasText() {
        return 0 != (getEventType() & 15);
    }

    public Location getLocation() {
        return null;
    }

    public QName getName() {
        return new QName(getNamespaceURI(), getLocalName(), getPrefix());
    }

    public String getLocalName() {
        return this.state.getLocalName();
    }

    public boolean hasName() {
        return 0 != (getEventType() & 11);
    }

    public String getNamespaceURI() {
        return this.state.getNamespaceURI();
    }

    public String getPrefix() {
        return this.state.getPrefix();
    }

    public String getVersion() {
        return "1.0";
    }

    public boolean isStandalone() {
        return true;
    }

    public boolean standaloneSet() {
        return false;
    }

    public String getCharacterEncodingScheme() {
        return null;
    }

    public String getPITarget() {
        return this.state.getData();
    }

    public String getPIData() {
        return this.state.getExtraData();
    }

    public boolean endDocumentIsPresent() {
        return this.scanner.endDocumentIsPresent();
    }

    public static void main(String[] args) throws Exception {
        XMLStreamReader reader = new XMLStreamPlayer(new FileReader(args[0]));
        XMLOutputFactory xmlof = XMLOutputFactory.newInstance();
        XMLStreamWriter xmlw = xmlof.createXMLStreamWriter(System.out);
        ReaderToWriter rtow = new ReaderToWriter(xmlw);
        while (reader.hasNext()) {
            rtow.write(reader);
            reader.next();
        }
        xmlw.flush();
    }
}
