package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.EntityDeclaration;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/EntityDeclarationEvent.class */
public class EntityDeclarationEvent extends BaseEvent implements EntityDeclaration {
    protected final String name;
    protected final String replacementText;

    public EntityDeclarationEvent(String name, String replText) {
        super(15);
        this.name = name;
        this.replacementText = replText;
    }

    public String getReplacementText() {
        return this.replacementText;
    }

    public String getName() {
        return this.name;
    }

    public String getBaseURI() {
        return null;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String getPublicId() {
        return null;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String getSystemId() {
        return null;
    }

    public String getNotationName() {
        return null;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<!ENTITY ");
        writer.write(getName());
        writer.write(34);
        writer.write(getReplacementText());
        writer.write("\">");
    }
}
