package com.bea.xml.stream.events;

import java.io.IOException;
import java.io.Writer;
import javax.xml.stream.events.EntityDeclaration;
import javax.xml.stream.events.EntityReference;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/EntityReferenceEvent.class */
public class EntityReferenceEvent extends BaseEvent implements EntityReference {
    private String name;
    private String replacementText;
    private EntityDeclaration ed;

    public EntityReferenceEvent() {
        init();
    }

    public EntityReferenceEvent(String name, EntityDeclaration ed) {
        init();
        this.name = name;
        this.ed = ed;
    }

    public String getReplacementText() {
        return this.ed.getReplacementText();
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setReplacementText(String text) {
        this.replacementText = text;
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

    public EntityDeclaration getDeclaration() {
        return this.ed;
    }

    protected void init() {
        setEventType(9);
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write(38);
        writer.write(getName());
        writer.write(59);
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    public String toString() {
        String replacement = getReplacementText();
        if (replacement == null) {
            replacement = "";
        }
        return new StringBuffer().append("&").append(getName()).append(":='").append(replacement).append("'").toString();
    }
}
