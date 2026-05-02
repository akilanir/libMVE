package com.bea.xml.stream;

import javax.xml.stream.XMLStreamException;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/XMLEventPlayer.class */
public class XMLEventPlayer extends XMLEventReaderBase {
    private XMLStreamPlayer player;

    public XMLEventPlayer(XMLStreamPlayer reader) throws XMLStreamException {
        super(reader);
        this.player = reader;
    }

    @Override // com.bea.xml.stream.XMLEventReaderBase
    protected boolean parseSome() throws XMLStreamException {
        this.allocator.allocate(this.reader, this);
        if (this.reader.hasNext()) {
            this.reader.next();
        }
        if (isOpen() && this.reader.getEventType() == 8) {
            if (this.player.endDocumentIsPresent()) {
                this.allocator.allocate(this.reader, this);
            }
            internal_close();
        }
        return !needsMore();
    }
}
