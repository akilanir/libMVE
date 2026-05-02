package ezvcard.io.xml;

import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.util.XmlUtils;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardElement.class */
public class XCardElement {
    private final Document document;
    private final Element element;
    private final VCardVersion version;
    private final String namespace;

    public XCardElement(Element element) {
        this(element, VCardVersion.V4_0);
    }

    public XCardElement(Element element, VCardVersion version) {
        this.document = element.getOwnerDocument();
        this.element = element;
        this.version = version;
        this.namespace = version.getXmlNamespace();
    }

    public String first(VCardDataType... dataTypes) {
        String[] names = new String[dataTypes.length];
        for (int i = 0; i < dataTypes.length; i++) {
            VCardDataType dataType = dataTypes[i];
            names[i] = toLocalName(dataType);
        }
        return first(names);
    }

    public String first(String... names) {
        List<String> localNamesList = Arrays.asList(names);
        for (Element child : children()) {
            if (localNamesList.contains(child.getLocalName()) && this.namespace.equals(child.getNamespaceURI())) {
                return child.getTextContent();
            }
        }
        return null;
    }

    public List<String> all(VCardDataType dataType) {
        String dataTypeStr = toLocalName(dataType);
        return all(dataTypeStr);
    }

    public List<String> all(String localName) {
        List<String> childrenText = new ArrayList<>();
        for (Element child : children()) {
            if (localName.equals(child.getLocalName()) && this.namespace.equals(child.getNamespaceURI())) {
                String text = child.getTextContent();
                if (text.length() > 0) {
                    childrenText.add(child.getTextContent());
                }
            }
        }
        return childrenText;
    }

    public Element append(VCardDataType dataType, String value) {
        String dataTypeStr = toLocalName(dataType);
        return append(dataTypeStr, value);
    }

    public Element append(String name, String value) {
        Element child = this.document.createElementNS(this.namespace, name);
        child.setTextContent(value);
        this.element.appendChild(child);
        return child;
    }

    public List<Element> append(String name, Collection<String> values) {
        if (values.isEmpty()) {
            Element element = append(name, (String) null);
            return Arrays.asList(element);
        }
        List<Element> elements = new ArrayList<>(values.size());
        for (String value : values) {
            elements.add(append(name, value));
        }
        return elements;
    }

    public Document document() {
        return this.document;
    }

    public Element element() {
        return this.element;
    }

    public VCardVersion version() {
        return this.version;
    }

    private List<Element> children() {
        return XmlUtils.toElementList(this.element.getChildNodes());
    }

    private String toLocalName(VCardDataType dataType) {
        return dataType == null ? "unknown" : dataType.getName().toLowerCase();
    }
}
