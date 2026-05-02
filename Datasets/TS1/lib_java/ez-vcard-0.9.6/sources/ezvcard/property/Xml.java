package ezvcard.property;

import ezvcard.VCardVersion;
import ezvcard.util.XmlUtils;
import java.util.EnumSet;
import java.util.Set;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.SAXException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/property/Xml.class */
public class Xml extends SimpleProperty<Document> implements HasAltId {
    public Xml(String xml) throws SAXException {
        this(XmlUtils.toDocument(xml));
    }

    public Xml(Element element) {
        this(detachElement(element));
    }

    public Xml(Document document) {
        super(document);
    }

    @Override // ezvcard.property.VCardProperty
    public Set<VCardVersion> _supportedVersions() {
        return EnumSet.of(VCardVersion.V4_0);
    }

    @Override // ezvcard.property.HasAltId
    public String getAltId() {
        return this.parameters.getAltId();
    }

    @Override // ezvcard.property.HasAltId
    public void setAltId(String altId) {
        this.parameters.setAltId(altId);
    }

    private static Document detachElement(Element element) {
        Document document = XmlUtils.createDocument();
        Node imported = document.importNode(element, true);
        document.appendChild(imported);
        return document;
    }
}
