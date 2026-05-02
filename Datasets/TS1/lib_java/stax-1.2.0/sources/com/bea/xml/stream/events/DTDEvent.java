package com.bea.xml.stream.events;

import com.wutka.dtd.DTDEntity;
import com.wutka.dtd.DTDExternalID;
import com.wutka.dtd.DTDNotation;
import com.wutka.dtd.DTDPublic;
import java.io.IOException;
import java.io.Writer;
import java.util.List;
import javax.xml.stream.events.DTD;
import javax.xml.stream.events.EntityDeclaration;
import javax.xml.stream.events.NotationDeclaration;

/* loaded from: stax-1.2.0.jar:com/bea/xml/stream/events/DTDEvent.class */
public class DTDEvent extends BaseEvent implements DTD {
    private String dtd;
    private List notations;
    private List entities;

    public DTDEvent() {
        init();
    }

    public DTDEvent(String dtd) {
        init();
        setDTD(dtd);
    }

    protected void init() {
        setEventType(11);
    }

    public static EntityDeclaration createEntityDeclaration(DTDEntity dtdEntity) {
        return new EntityDeclarationEvent(dtdEntity.getName(), dtdEntity.getValue());
    }

    public static NotationDeclaration createNotationDeclaration(DTDNotation dtdNotation) {
        DTDExternalID extId = dtdNotation.getExternalID();
        String systemId = extId.getSystem();
        String publicId = extId instanceof DTDPublic ? ((DTDPublic) extId).getPub() : null;
        return new NotationDeclarationEvent(dtdNotation.getName(), publicId, systemId);
    }

    public void setDTD(String dtd) {
        this.dtd = dtd;
    }

    public void setNotations(List l) {
        this.notations = l;
    }

    public void setEntities(List l) {
        this.entities = l;
    }

    public Object getProcessedDTD() {
        return null;
    }

    public String getDocumentTypeDeclaration() {
        return this.dtd;
    }

    public List getEntities() {
        return this.entities;
    }

    public List getNotations() {
        return this.notations;
    }

    @Override // com.bea.xml.stream.events.BaseEvent
    protected void doWriteAsEncodedUnicode(Writer writer) throws IOException {
        writer.write("<!DOCTYPE ");
        if (this.dtd != null && this.dtd.length() > 0) {
            writer.write(91);
            writer.write(this.dtd);
            writer.write(93);
        }
        writer.write(62);
    }
}
