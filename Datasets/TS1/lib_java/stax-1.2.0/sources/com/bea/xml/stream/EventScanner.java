package com.bea.xml.stream;

import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import javax.xml.namespace.QName;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.events.Attribute;
import javax.xml.stream.events.Namespace;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/EventScanner.class */
public class EventScanner {
    protected Reader reader;
    protected char currentChar;
    protected int currentLine = 0;
    private boolean readEndDocument = false;

    public EventScanner() {
    }

    public EventScanner(Reader reader) throws IOException {
        setReader(reader);
    }

    public void setReader(Reader reader) throws IOException {
        this.reader = reader;
        read();
        skipSpace();
    }

    protected String readString(char delim) throws IOException, XMLStreamException {
        StringBuffer buf = new StringBuffer();
        while (getChar() != delim) {
            if (getChar() == '[' && delim == ']') {
                read();
                buf.append('[');
                if (getChar() != ']') {
                    buf.append(readString(']'));
                }
                buf.append(']');
                read(']');
            } else {
                buf.append(getChar());
                read();
            }
        }
        return buf.toString();
    }

    protected char getChar() {
        return this.currentChar;
    }

    protected void skipSpace() throws IOException {
        while (true) {
            if ((this.currentChar == ' ') | (this.currentChar == '\n') | (this.currentChar == '\t') | (this.currentChar == '\r')) {
                read();
            } else {
                return;
            }
        }
    }

    protected char read() throws IOException {
        this.currentChar = (char) this.reader.read();
        if (this.currentChar == '\n') {
            this.currentLine++;
        }
        return this.currentChar;
    }

    protected char read(char c) throws XMLStreamException, IOException {
        if (this.currentChar == c) {
            return read();
        }
        throw new XMLStreamException(new StringBuffer().append("Unexpected character '").append(this.currentChar).append("' , expected '").append(c).append("' at line ").append(this.currentLine).toString());
    }

    protected void read(String s) throws XMLStreamException, IOException {
        for (int i = 0; i < s.length(); i++) {
            read(s.charAt(i));
        }
    }

    protected int readType() throws XMLStreamException, IOException {
        read('[');
        String typeName = readString(']');
        int type = ElementTypeNames.getEventType(typeName);
        read(']');
        return type;
    }

    public EventState readStartElement() throws XMLStreamException, IOException {
        EventState state = new EventState(1);
        read('[');
        state.setName(readName());
        if (getChar() == '[') {
            List atts = readAttributes();
            for (Object obj : atts) {
                if (obj instanceof Namespace) {
                    state.addNamespace(obj);
                } else {
                    state.addAttribute(obj);
                }
            }
        }
        read(']');
        return state;
    }

    public EventState readEndElement() throws XMLStreamException, IOException {
        EventState state = new EventState(2);
        read('[');
        state.setName(readName());
        read(']');
        return state;
    }

    public EventState readProcessingInstruction() throws XMLStreamException, IOException {
        EventState state = new EventState(3);
        read('[');
        String name = readString(']');
        read(']');
        String s = null;
        if (getChar() == ',') {
            read(",[");
            s = readString(']');
            read(']');
        }
        state.setData(name);
        state.setExtraData(s);
        return state;
    }

    public EventState readCharacterData() throws XMLStreamException, IOException {
        EventState state = new EventState(4);
        read('[');
        state.setData(readString(']'));
        read(']');
        return state;
    }

    public EventState readCDATA() throws XMLStreamException, IOException {
        EventState state = new EventState(12);
        read('[');
        readString(']');
        read(']');
        return state;
    }

    public EventState readStartDocument() throws XMLStreamException, IOException {
        EventState state = new EventState(7);
        if (getChar() != ';') {
            read('[');
            read('[');
            String version = readString(']');
            read(']');
            read(',');
            read('[');
            String encoding = readString(']');
            read(']');
            read(']');
            state.setData(version);
            state.setExtraData(encoding);
        }
        return state;
    }

    public EventState readDTD() throws XMLStreamException, IOException {
        EventState state = new EventState(11);
        read('[');
        String dtd = readString(']');
        read(']');
        state.setData(dtd);
        return state;
    }

    public EventState readEndDocument() throws XMLStreamException {
        EventState state = new EventState(8);
        return state;
    }

    public EventState readComment() throws XMLStreamException, IOException {
        EventState state = new EventState(5);
        read('[');
        state.setData(readString(']'));
        read(']');
        return state;
    }

    public String getPrefix(String name) {
        int index = name.indexOf(58);
        if (index == -1) {
            return null;
        }
        return name.substring(0, index);
    }

    public String getName(String name) {
        int index = name.indexOf(58);
        return index == -1 ? name : name.substring(index + 1);
    }

    public QName readName() throws XMLStreamException, IOException {
        read('[');
        QName n = readName(']');
        read(']');
        return n;
    }

    public QName readName(char delim) throws XMLStreamException, IOException {
        String uri = "";
        if (getChar() == '\'') {
            read('\'');
            uri = readString('\'');
            read('\'');
            read(':');
        }
        String name = readString(delim);
        String prefix = getPrefix(name);
        if (prefix == null) {
            prefix = "";
        }
        String localName = getName(name);
        return new QName(uri, localName, prefix);
    }

    public List readAttributes() throws XMLStreamException, IOException {
        List attributes = new ArrayList();
        while (getChar() == '[') {
            attributes.add(readAttribute());
        }
        return attributes;
    }

    public Attribute readAttribute() throws XMLStreamException, IOException {
        read('[');
        read('[');
        String type = readString(']');
        read(']');
        QName n = readName();
        read("=[");
        String value = readString(']');
        read(']');
        read(']');
        if (type.equals("ATTRIBUTE")) {
            return new AttributeBase(n, value);
        }
        if (type.equals("DEFAULT")) {
            return new NamespaceBase(value);
        }
        if (type.equals("NAMESPACE")) {
            return new NamespaceBase(n.getLocalPart(), value);
        }
        throw new XMLStreamException("Parser Error expected (ATTRIBUTE||DEFAULT|NAMESPACE");
    }

    public EventState readEntityReference() throws XMLStreamException, IOException {
        EventState state = new EventState(9);
        read('[');
        state.setData(readString(']'));
        read(']');
        return state;
    }

    public EventState readSpace() throws XMLStreamException, IOException {
        EventState state = new EventState(6);
        read('[');
        String content = readString(']');
        read(']');
        state.setData(content);
        return state;
    }

    public EventState readElement() throws XMLStreamException, IOException {
        EventState state;
        int type = readType();
        switch (type) {
            case 1:
                state = readStartElement();
                break;
            case 2:
                state = readEndElement();
                break;
            case 3:
                state = readProcessingInstruction();
                break;
            case 4:
                state = readCharacterData();
                break;
            case 5:
                state = readComment();
                break;
            case 6:
                state = readSpace();
                break;
            case 7:
                state = readStartDocument();
                break;
            case 8:
                this.readEndDocument = true;
                state = readEndDocument();
                break;
            case 9:
                state = readEntityReference();
                break;
            case 10:
            default:
                throw new XMLStreamException(new StringBuffer().append("Attempt to read unknown element [").append(type).append("]").toString());
            case 11:
                state = readDTD();
                break;
            case 12:
                state = readCDATA();
                break;
        }
        read(';');
        skipSpace();
        return state;
    }

    public boolean endDocumentIsPresent() {
        return this.readEndDocument;
    }

    public boolean hasNext() throws IOException {
        return this.reader.ready() && !this.readEndDocument;
    }

    public static void main(String[] args) throws Exception {
        EventScanner reader = new EventScanner(new FileReader(args[0]));
        while (reader.hasNext()) {
            System.out.println(reader.readElement());
        }
    }
}
