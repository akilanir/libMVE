package ezvcard.io.scribe;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.json.JCardValue;
import ezvcard.io.xml.XCardElement;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import ezvcard.util.XmlUtils;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/scribe/XmlScribe.class */
public class XmlScribe extends VCardPropertyScribe<Xml> {
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseJson(JCardValue x0, VCardDataType x1, VCardParameters x2, List x3) {
        return _parseJson(x0, x1, x2, (List<String>) x3);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseXml(XCardElement x0, VCardParameters x1, List x2) {
        return _parseXml(x0, x1, (List<String>) x2);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected /* bridge */ /* synthetic */ VCardProperty _parseText(String x0, VCardDataType x1, VCardVersion x2, VCardParameters x3, List x4) {
        return _parseText(x0, x1, x2, x3, (List<String>) x4);
    }

    public XmlScribe() {
        super(Xml.class, "XML");
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected VCardDataType _defaultDataType(VCardVersion version) {
        return VCardDataType.TEXT;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public String _writeText(Xml property, VCardVersion version) {
        Document value = property.getValue();
        if (value == null) {
            return "";
        }
        String xml = valueToString(value);
        return escape(xml);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Xml _parseText(String value, VCardDataType dataType, VCardVersion version, VCardParameters parameters, List<String> warnings) {
        String value2 = unescape(value);
        try {
            return new Xml(value2);
        } catch (SAXException e) {
            throw new CannotParseException("Cannot parse value as XML: " + value2);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public void _writeXml(Xml property, XCardElement element) {
        super._writeXml((XmlScribe) property, element);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Xml _parseXml(XCardElement element, VCardParameters parameters, List<String> warnings) {
        Xml xml = new Xml(element.element());
        Element root = XmlUtils.getRootElement(xml.getValue());
        for (Element child : XmlUtils.toElementList(root.getChildNodes())) {
            if ("parameters".equals(child.getLocalName()) && VCardVersion.V4_0.getXmlNamespace().equals(child.getNamespaceURI())) {
                root.removeChild(child);
            }
        }
        return xml;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // ezvcard.io.scribe.VCardPropertyScribe
    public JCardValue _writeJson(Xml property) {
        String xml = null;
        Document value = property.getValue();
        if (value != null) {
            xml = valueToString(value);
        }
        return JCardValue.single(xml);
    }

    @Override // ezvcard.io.scribe.VCardPropertyScribe
    protected Xml _parseJson(JCardValue value, VCardDataType dataType, VCardParameters parameters, List<String> warnings) {
        try {
            String xml = value.asSingle();
            return xml == null ? new Xml((Document) null) : new Xml(xml);
        } catch (SAXException e) {
            throw new CannotParseException("Cannot parse value as XML: " + value);
        }
    }

    private String valueToString(Document document) {
        Map<String, String> props = new HashMap<>();
        props.put("omit-xml-declaration", "yes");
        return XmlUtils.toString(document, props);
    }
}
