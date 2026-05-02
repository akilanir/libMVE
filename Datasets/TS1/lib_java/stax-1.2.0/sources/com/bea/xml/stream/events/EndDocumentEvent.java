package com.bea.xml.stream.events;

import java.io.Writer;
import javax.xml.stream.events.EndDocument;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/EndDocumentEvent.class */
public class EndDocumentEvent extends BaseEvent implements EndDocument {
    public EndDocumentEvent() {
        init();
    }

    protected void init() {
        setEventType(8);
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) {
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String toString() {
        return "<? EndDocument ?>";
    }
}
