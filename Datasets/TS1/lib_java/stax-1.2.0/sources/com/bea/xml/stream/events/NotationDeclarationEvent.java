package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.NotationDeclaration;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/NotationDeclarationEvent.class */
public class NotationDeclarationEvent extends BaseEvent implements NotationDeclaration {
    protected final String name;
    protected final String publicId;
    protected final String systemId;

    public NotationDeclarationEvent(String name, String publicId, String systemId) {
        super(14);
        this.name = name;
        this.publicId = publicId;
        this.systemId = systemId;
    }

    public String getName() {
        return this.name;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String getPublicId() {
        return this.publicId;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String getSystemId() {
        return this.systemId;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<!NOTATION ");
        writer.write(getName());
        if (this.publicId != null) {
            writer.write(" PUBLIC \"");
            writer.write(this.publicId);
            writer.write(34);
        } else if (this.systemId != null) {
            writer.write(" SYSTEM");
        }
        if (this.systemId != null) {
            writer.write(" \"");
            writer.write(this.systemId);
            writer.write(34);
        }
        writer.write(62);
    }
}
