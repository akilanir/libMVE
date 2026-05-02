package ezvcard.io.xml;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamWriter;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import ezvcard.util.IOUtils;
import ezvcard.util.ListMultimap;
import ezvcard.util.XmlUtils;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.Writer;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.xml.namespace.QName;
import javax.xml.transform.Result;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMResult;
import javax.xml.transform.sax.SAXTransformerFactory;
import javax.xml.transform.sax.TransformerHandler;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Text;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.AttributesImpl;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardWriter.class */
public class XCardWriter extends StreamWriter {
    private final VCardVersion targetVersion;
    private final Document DOC;
    private final Map<String, VCardDataType> parameterDataTypes;
    private final Writer writer;
    private final TransformerHandler handler;
    private final String indent;
    private final boolean vcardsElementExists;
    private int level;
    private boolean textNodeJustPrinted;
    private boolean started;

    public XCardWriter(OutputStream out) {
        this(IOUtils.utf8Writer(out));
    }

    public XCardWriter(OutputStream out, String indent) {
        this(IOUtils.utf8Writer(out), indent);
    }

    public XCardWriter(File file) throws IOException {
        this(IOUtils.utf8Writer(file));
    }

    public XCardWriter(File file, String indent) throws IOException {
        this(IOUtils.utf8Writer(file), indent);
    }

    public XCardWriter(Writer writer) {
        this(writer, (String) null);
    }

    public XCardWriter(Writer writer, String indent) {
        this(writer, indent, null);
    }

    public XCardWriter(Node parent) {
        this(null, null, parent);
    }

    private XCardWriter(Writer writer, String indent, Node parent) {
        Node root;
        this.targetVersion = VCardVersion.V4_0;
        this.DOC = XmlUtils.createDocument();
        this.parameterDataTypes = new HashMap();
        registerParameterDataType(VCardParameters.ALTID, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.CALSCALE, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.GEO, VCardDataType.URI);
        registerParameterDataType(VCardParameters.LABEL, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.LANGUAGE, VCardDataType.LANGUAGE_TAG);
        registerParameterDataType(VCardParameters.MEDIATYPE, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.PID, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.PREF, VCardDataType.INTEGER);
        registerParameterDataType(VCardParameters.SORT_AS, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.TYPE, VCardDataType.TEXT);
        registerParameterDataType(VCardParameters.TZ, VCardDataType.URI);
        this.level = 0;
        this.textNodeJustPrinted = false;
        this.started = false;
        this.writer = writer;
        this.indent = indent;
        if ((parent instanceof Document) && (root = parent.getFirstChild()) != null) {
            parent = root;
        }
        this.vcardsElementExists = isVCardsElement(parent);
        try {
            SAXTransformerFactory factory = (SAXTransformerFactory) TransformerFactory.newInstance();
            this.handler = factory.newTransformerHandler();
            Result result = writer == null ? new DOMResult(parent) : new StreamResult(writer);
            this.handler.setResult(result);
        } catch (TransformerConfigurationException e) {
            throw new RuntimeException(e);
        }
    }

    private boolean isVCardsElement(Node node) {
        if (node == null || !(node instanceof Element)) {
            return false;
        }
        QName vcards = XCardQNames.VCARDS;
        return vcards.getNamespaceURI().equals(node.getNamespaceURI()) && vcards.getLocalPart().equals(node.getLocalName());
    }

    @Override // ezvcard.io.StreamWriter
    protected void _write(VCard vcard, List<VCardProperty> properties) throws IOException {
        try {
            if (!this.started) {
                this.handler.startDocument();
                if (!this.vcardsElementExists) {
                    start(XCardQNames.VCARDS);
                    this.level++;
                }
                this.started = true;
            }
            ListMultimap<String, VCardProperty> propertiesByGroup = new ListMultimap<>();
            for (VCardProperty property : properties) {
                propertiesByGroup.put(property.getGroup(), property);
            }
            start(XCardQNames.VCARD);
            this.level++;
            Iterator i$ = propertiesByGroup.iterator();
            while (i$.hasNext()) {
                Map.Entry<String, List<VCardProperty>> entry = i$.next();
                String groupName = entry.getKey();
                if (groupName != null) {
                    AttributesImpl attr = new AttributesImpl();
                    attr.addAttribute(XCardQNames.NAMESPACE, "", "name", "", groupName);
                    start(XCardQNames.GROUP, attr);
                    this.level++;
                }
                Iterator i$2 = entry.getValue().iterator();
                while (i$2.hasNext()) {
                    write(i$2.next(), vcard);
                }
                if (groupName != null) {
                    this.level--;
                    end(XCardQNames.GROUP);
                }
            }
            this.level--;
            end(XCardQNames.VCARD);
        } catch (SAXException e) {
            throw new IOException(e);
        }
    }

    @Override // ezvcard.io.StreamWriter
    protected VCardVersion getTargetVersion() {
        return this.targetVersion;
    }

    public void registerParameterDataType(String parameterName, VCardDataType dataType) {
        String parameterName2 = parameterName.toLowerCase();
        if (dataType == null) {
            this.parameterDataTypes.remove(parameterName2);
        } else {
            this.parameterDataTypes.put(parameterName2, dataType);
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        try {
            if (!this.started) {
                this.handler.startDocument();
                if (!this.vcardsElementExists) {
                    start(XCardQNames.VCARDS);
                    this.level++;
                }
            }
            if (!this.vcardsElementExists) {
                this.level--;
                end(XCardQNames.VCARDS);
            }
            this.handler.endDocument();
            if (this.writer != null) {
                this.writer.close();
            }
        } catch (SAXException e) {
            throw new IOException(e);
        }
    }

    private void write(VCardProperty property, VCard vcard) throws SAXException {
        Element propertyElement;
        VCardPropertyScribe scribe = this.index.getPropertyScribe(property);
        VCardParameters parameters = scribe.prepareParameters(property, this.targetVersion, vcard);
        if (property instanceof Xml) {
            Xml xml = (Xml) property;
            Document value = xml.getValue();
            if (value == null) {
                return;
            } else {
                propertyElement = XmlUtils.getRootElement(value);
            }
        } else {
            QName qname = scribe.getQName();
            propertyElement = this.DOC.createElementNS(qname.getNamespaceURI(), qname.getLocalPart());
            try {
                scribe.writeXml(property, propertyElement);
            } catch (EmbeddedVCardException e) {
                return;
            } catch (SkipMeException e2) {
                return;
            }
        }
        start(propertyElement);
        this.level++;
        write(parameters);
        write(propertyElement);
        this.level--;
        end(propertyElement);
    }

    private void write(Element propertyElement) throws SAXException {
        NodeList children = propertyElement.getChildNodes();
        for (int i = 0; i < children.getLength(); i++) {
            Node child = children.item(i);
            if (child instanceof Element) {
                Element element = (Element) child;
                if (element.hasChildNodes()) {
                    start(element);
                    this.level++;
                    write(element);
                    this.level--;
                    end(element);
                } else {
                    childless(element);
                }
            } else if (child instanceof Text) {
                Text text = (Text) child;
                text(text.getTextContent());
            }
        }
    }

    private void write(VCardParameters parameters) throws SAXException {
        if (parameters.isEmpty()) {
            return;
        }
        start(XCardQNames.PARAMETERS);
        this.level++;
        Iterator i$ = parameters.iterator();
        while (i$.hasNext()) {
            Map.Entry<String, List<String>> parameter = i$.next();
            String parameterName = parameter.getKey().toLowerCase();
            start(parameterName);
            this.level++;
            for (String parameterValue : parameter.getValue()) {
                VCardDataType dataType = this.parameterDataTypes.get(parameterName);
                String dataTypeElementName = dataType == null ? "unknown" : dataType.getName().toLowerCase();
                start(dataTypeElementName);
                text(parameterValue);
                end(dataTypeElementName);
            }
            this.level--;
            end(parameterName);
        }
        this.level--;
        end(XCardQNames.PARAMETERS);
    }

    private void indent() throws SAXException {
        if (this.indent == null) {
            return;
        }
        StringBuilder sb = new StringBuilder("\n");
        for (int i = 0; i < this.level; i++) {
            sb.append(this.indent);
        }
        String str = sb.toString();
        this.handler.ignorableWhitespace(str.toCharArray(), 0, str.length());
    }

    private void childless(Element element) throws SAXException {
        Attributes attributes = getElementAttributes(element);
        indent();
        this.handler.startElement(element.getNamespaceURI(), "", element.getLocalName(), attributes);
        this.handler.endElement(element.getNamespaceURI(), "", element.getLocalName());
    }

    private void start(Element element) throws SAXException {
        Attributes attributes = getElementAttributes(element);
        start(element.getNamespaceURI(), element.getLocalName(), attributes);
    }

    private void start(String element) throws SAXException {
        start(element, (Attributes) null);
    }

    private void start(QName qname) throws SAXException {
        start(qname, (Attributes) null);
    }

    private void start(QName qname, Attributes attributes) throws SAXException {
        start(qname.getNamespaceURI(), qname.getLocalPart(), attributes);
    }

    private void start(String element, Attributes attributes) throws SAXException {
        start(this.targetVersion.getXmlNamespace(), element, attributes);
    }

    private void start(String namespace, String element, Attributes attributes) throws SAXException {
        indent();
        this.handler.startElement(namespace, "", element, attributes);
    }

    private void end(Element element) throws SAXException {
        end(element.getNamespaceURI(), element.getLocalName());
    }

    private void end(String element) throws SAXException {
        end(this.targetVersion.getXmlNamespace(), element);
    }

    private void end(QName qname) throws SAXException {
        end(qname.getNamespaceURI(), qname.getLocalPart());
    }

    private void end(String namespace, String element) throws SAXException {
        if (!this.textNodeJustPrinted) {
            indent();
        }
        this.handler.endElement(namespace, "", element);
        this.textNodeJustPrinted = false;
    }

    private void text(String text) throws SAXException {
        this.handler.characters(text.toCharArray(), 0, text.length());
        this.textNodeJustPrinted = true;
    }

    private Attributes getElementAttributes(Element element) {
        AttributesImpl attributes = new AttributesImpl();
        NamedNodeMap attributeNodes = element.getAttributes();
        for (int i = 0; i < attributeNodes.getLength(); i++) {
            Node node = attributeNodes.item(i);
            attributes.addAttribute(node.getNamespaceURI(), "", node.getLocalName(), "", node.getNodeValue());
        }
        return attributes;
    }
}
