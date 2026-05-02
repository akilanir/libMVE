package org.kore.kolab.notes.v3;

import java.util.Calendar;
import java.util.Date;
import java.util.Set;
import java.util.TimeZone;
import javax.xml.parsers.DocumentBuilder;
import org.kore.kolab.notes.AuditInformation;
import org.kore.kolab.notes.Color;
import org.kore.kolab.notes.Identification;
import org.kore.kolab.notes.imap.RemoteTags;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: kolabnotes-java-3.3.4.jar:org/kore/kolab/notes/v3/KolabConfigurationXMLBuilder.class */
public final class KolabConfigurationXMLBuilder {
    private final Document doc;
    private final Element rootElement;

    public KolabConfigurationXMLBuilder(Document doc, Element rootElement) {
        this.doc = doc;
        this.rootElement = rootElement;
    }

    public static final KolabConfigurationXMLBuilder createInstance(DocumentBuilder builder) {
        Document doc = builder.newDocument();
        Element root = doc.createElement("configuration");
        root.setAttribute("xmlns", "http://kolab.org");
        root.setAttribute("version", "3.0");
        doc.appendChild(root);
        return new KolabConfigurationXMLBuilder(doc, root);
    }

    public KolabConfigurationXMLBuilder withIdentification(Identification id) {
        Element element = this.doc.createElement("uid");
        element.appendChild(this.doc.createTextNode(id.getUid()));
        this.rootElement.appendChild(element);
        Element element2 = this.doc.createElement("prodid");
        element2.appendChild(this.doc.createTextNode(id.getProductId()));
        this.rootElement.appendChild(element2);
        return this;
    }

    public KolabConfigurationXMLBuilder withAuditInformation(AuditInformation id) {
        String creation = createTimestampString(id.getCreationDate());
        Element element = this.doc.createElement("creation-date");
        element.appendChild(this.doc.createTextNode(creation));
        this.rootElement.appendChild(element);
        String modification = createTimestampString(id.getLastModificationDate());
        Element element2 = this.doc.createElement("last-modification-date");
        element2.appendChild(this.doc.createTextNode(modification));
        this.rootElement.appendChild(element2);
        return this;
    }

    String createTimestampString(Date date) {
        Calendar calendar = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
        calendar.setTime(date);
        return String.format("%1$04d", Integer.valueOf(calendar.get(1))) + '-' + String.format("%1$02d", Integer.valueOf(calendar.get(2) + 1)) + '-' + String.format("%1$02d", Integer.valueOf(calendar.get(5))) + 'T' + String.format("%1$02d", Integer.valueOf(calendar.get(11))) + ':' + String.format("%1$02d", Integer.valueOf(calendar.get(12))) + ':' + String.format("%1$02d", Integer.valueOf(calendar.get(13))) + 'Z';
    }

    public KolabConfigurationXMLBuilder withType() {
        Element element = this.doc.createElement("type");
        element.appendChild(this.doc.createTextNode(RemoteTags.TYPE));
        this.rootElement.appendChild(element);
        return this;
    }

    public KolabConfigurationXMLBuilder withName(String name) {
        Element element = this.doc.createElement("name");
        if (name != null) {
            element.appendChild(this.doc.createTextNode(name));
        }
        this.rootElement.appendChild(element);
        return this;
    }

    public KolabConfigurationXMLBuilder withColor(Color color) {
        if (color != null) {
            Element element = this.doc.createElement("color");
            element.appendChild(this.doc.createTextNode(color.getHexcode()));
            this.rootElement.appendChild(element);
        }
        return this;
    }

    public KolabConfigurationXMLBuilder withRelationType() {
        Element element = this.doc.createElement("relationType");
        element.appendChild(this.doc.createTextNode(RemoteTags.RELATION_TYPE));
        this.rootElement.appendChild(element);
        return this;
    }

    public KolabConfigurationXMLBuilder withPriority(int priority) {
        Element element = this.doc.createElement("priority");
        element.appendChild(this.doc.createTextNode(Integer.toString(priority)));
        this.rootElement.appendChild(element);
        return this;
    }

    public KolabConfigurationXMLBuilder withMembers(Set<String> members) {
        if (!members.isEmpty()) {
            for (String member : members) {
                Element element = this.doc.createElement("member");
                element.appendChild(this.doc.createTextNode("urn:uuid:" + member));
                this.rootElement.appendChild(element);
            }
        }
        return this;
    }

    public Document build() {
        return this.doc;
    }
}
