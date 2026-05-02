package com.bea.xml.stream;

import com.bea.xml.stream.util.ElementTypeNames;
import java.io.FileReader;
import javax.xml.stream.XMLStreamException;
import javax.xml.stream.XMLStreamReader;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/SubReader.class */
public class SubReader extends ReaderDelegate {
    private int depth;
    private boolean open;

    public SubReader(XMLStreamReader reader) throws XMLStreamException {
        super(reader);
        this.depth = 0;
        this.open = true;
        if (!reader.isStartElement()) {
            throw new XMLStreamException("Unable to instantiate a subReader because the underlying reader was not on a start element.");
        }
        this.open = true;
        this.depth++;
    }

    @Override // com.bea.xml.stream.ReaderDelegate
    public int next() throws XMLStreamException {
        if (this.depth <= 0) {
            this.open = false;
        }
        int type = super.next();
        if (isStartElement()) {
            this.depth++;
        }
        if (isEndElement()) {
            this.depth--;
        }
        return type;
    }

    public int nextElement() throws XMLStreamException {
        next();
        while (hasNext() && !isStartElement() && !isEndElement()) {
            next();
        }
        return super.getEventType();
    }

    @Override // com.bea.xml.stream.ReaderDelegate
    public boolean hasNext() throws XMLStreamException {
        if (this.open) {
            return super.hasNext();
        }
        return false;
    }

    public boolean moveToStartElement() throws XMLStreamException {
        if (isStartElement()) {
            return true;
        }
        while (hasNext()) {
            if (isStartElement()) {
                return true;
            }
            next();
        }
        return false;
    }

    public boolean moveToStartElement(String localName) throws XMLStreamException {
        if (localName == null) {
            return false;
        }
        while (moveToStartElement()) {
            if (localName.equals(getLocalName())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToStartElement(String localName, String namespaceUri) throws XMLStreamException {
        if (localName == null || namespaceUri == null) {
            return false;
        }
        while (moveToStartElement(localName)) {
            if (namespaceUri.equals(getNamespaceURI())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement() throws XMLStreamException {
        if (isEndElement()) {
            return true;
        }
        while (hasNext()) {
            if (isEndElement()) {
                return true;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement(String localName) throws XMLStreamException {
        if (localName == null) {
            return false;
        }
        while (moveToEndElement()) {
            if (localName.equals(getLocalName())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public boolean moveToEndElement(String localName, String namespaceUri) throws XMLStreamException {
        if (localName == null || namespaceUri == null) {
            return false;
        }
        while (moveToEndElement(localName)) {
            if (namespaceUri.equals(getNamespaceURI())) {
                return true;
            }
            if (!hasNext()) {
                return false;
            }
            next();
        }
        return false;
    }

    public static void print(XMLStreamReader r, int depth) throws XMLStreamException {
        System.out.print(new StringBuffer().append("[").append(depth).append("]Sub: ").append(ElementTypeNames.getEventTypeString(r.getEventType())).toString());
        if (!r.hasName()) {
            if (!r.hasText()) {
                System.out.println();
                return;
            } else {
                System.out.println(new StringBuffer().append("->[").append(r.getText()).append("]").toString());
                return;
            }
        }
        System.out.println(new StringBuffer().append("->").append(r.getLocalName()).toString());
    }

    public static void sub(XMLStreamReader r, int depth) throws Exception {
        while (r.hasNext()) {
            print(r, depth);
            r.next();
        }
    }

    public static void main(String[] args) throws Exception {
        MXParser r = new MXParser();
        r.setInput(new FileReader(args[0]));
        r.moveToStartElement();
        r.next();
        while (r.moveToStartElement()) {
            System.out.println(new StringBuffer().append("SE->").append(r.getName()).toString());
            XMLStreamReader subr = r.subReader();
            sub(subr, 1);
        }
    }
}
