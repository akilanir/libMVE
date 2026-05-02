package ezvcard.io.xml;

import ezvcard.VCard;
import ezvcard.VCardDataType;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamReader;
import ezvcard.io.StreamWriter;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import ezvcard.util.IOUtils;
import ezvcard.util.ListMultimap;
import ezvcard.util.XmlUtils;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.xml.namespace.QName;
import javax.xml.transform.TransformerException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.SAXException;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardDocument.class */
public class XCardDocument {
    private final VCardVersion version4;
    private final Document document;
    private Element root;

    public XCardDocument() {
        this(createXCardsRoot());
    }

    private static Document createXCardsRoot() {
        Document document = XmlUtils.createDocument();
        Element root = document.createElementNS(XCardQNames.VCARDS.getNamespaceURI(), XCardQNames.VCARDS.getLocalPart());
        document.appendChild(root);
        return document;
    }

    public XCardDocument(String xml) throws SAXException {
        this(XmlUtils.toDocument(xml));
    }

    public XCardDocument(InputStream in) throws SAXException, IOException {
        this(XmlUtils.toDocument(in));
    }

    public XCardDocument(File file) throws SAXException, IOException {
        this(readFile(file));
    }

    private static Document readFile(File file) throws SAXException, IOException {
        InputStream in = new FileInputStream(file);
        try {
            Document document = XmlUtils.toDocument(in);
            IOUtils.closeQuietly(in);
            return document;
        } catch (Throwable th) {
            IOUtils.closeQuietly(in);
            throw th;
        }
    }

    public XCardDocument(Reader reader) throws SAXException, IOException {
        this(XmlUtils.toDocument(reader));
    }

    public XCardDocument(Document document) {
        this.version4 = VCardVersion.V4_0;
        this.document = document;
        XCardNamespaceContext nsContext = new XCardNamespaceContext(this.version4, "v");
        XPath xpath = XPathFactory.newInstance().newXPath();
        xpath.setNamespaceContext(nsContext);
        try {
            this.root = (Element) xpath.evaluate("//" + nsContext.getPrefix() + ":" + XCardQNames.VCARDS.getLocalPart(), document, XPathConstants.NODE);
        } catch (XPathExpressionException e) {
            throw new RuntimeException(e);
        }
    }

    public StreamReader reader() {
        return new XCardDocumentStreamReader();
    }

    public XCardDocumentStreamWriter writer() {
        return new XCardDocumentStreamWriter();
    }

    public Document getDocument() {
        return this.document;
    }

    public List<VCard> getVCards() {
        try {
            return reader().readAll();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public void add(VCard vcard) {
        writer().write(vcard);
    }

    public String write() {
        return write(-1);
    }

    public String write(int indent) {
        StringWriter sw = new StringWriter();
        try {
            write(sw, indent);
        } catch (TransformerException e) {
        }
        return sw.toString();
    }

    public void write(OutputStream out) throws TransformerException {
        write(out, -1);
    }

    public void write(OutputStream out, int indent) throws TransformerException {
        write(IOUtils.utf8Writer(out), indent);
    }

    public void write(File file) throws TransformerException, IOException {
        write(file, -1);
    }

    public void write(File file, int indent) throws TransformerException, IOException {
        Writer writer = IOUtils.utf8Writer(file);
        try {
            write(writer, indent);
            IOUtils.closeQuietly(writer);
        } catch (Throwable th) {
            IOUtils.closeQuietly(writer);
            throw th;
        }
    }

    public void write(Writer writer) throws TransformerException {
        write(writer, -1);
    }

    public void write(Writer writer, int indent) throws TransformerException {
        Map<String, String> properties = new HashMap<>();
        if (indent >= 0) {
            properties.put("indent", "yes");
            properties.put("{http://xml.apache.org/xslt}indent-amount", indent + "");
        }
        XmlUtils.toWriter(this.document, writer, properties);
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardDocument$XCardDocumentStreamReader.class */
    private class XCardDocumentStreamReader extends StreamReader {
        private final Iterator<Element> vcardElements;
        private VCard vcard;

        private XCardDocumentStreamReader() {
            List<Element> list = XCardDocument.this.root == null ? Collections.emptyList() : getChildElements(XCardDocument.this.root, XCardQNames.VCARD);
            this.vcardElements = list.iterator();
        }

        @Override // ezvcard.io.StreamReader
        public VCard readNext() {
            try {
                return super.readNext();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // ezvcard.io.StreamReader
        protected VCard _readNext() throws IOException {
            if (!this.vcardElements.hasNext()) {
                return null;
            }
            this.vcard = new VCard();
            this.vcard.setVersion(XCardDocument.this.version4);
            parseVCardElement(this.vcardElements.next());
            return this.vcard;
        }

        @Override // java.io.Closeable, java.lang.AutoCloseable
        public void close() {
        }

        private void parseVCardElement(Element vcardElement) {
            List<Element> children = XmlUtils.toElementList(vcardElement.getChildNodes());
            for (Element child : children) {
                if (XCardQNames.GROUP.getNamespaceURI().equals(child.getNamespaceURI()) && XCardQNames.GROUP.getLocalPart().equals(child.getLocalName())) {
                    String group = child.getAttribute("name");
                    if (group.length() == 0) {
                        group = null;
                    }
                    List<Element> grandChildren = XmlUtils.toElementList(child.getChildNodes());
                    for (Element grandChild : grandChildren) {
                        parseAndAddElement(grandChild, group);
                    }
                } else {
                    parseAndAddElement(child, null);
                }
            }
        }

        private void parseAndAddElement(Element element, String group) {
            VCardProperty property;
            VCardParameters parameters = parseParameters(element);
            String propertyName = element.getLocalName();
            String ns = element.getNamespaceURI();
            QName qname = new QName(ns, propertyName);
            VCardPropertyScribe<? extends VCardProperty> scribe = this.index.getPropertyScribe(qname);
            try {
                VCardPropertyScribe.Result<T> parseXml = scribe.parseXml(element, parameters);
                property = parseXml.getProperty();
                property.setGroup(group);
                for (String warning : parseXml.getWarnings()) {
                    this.warnings.add(null, propertyName, warning);
                }
            } catch (CannotParseException e) {
                String xml = XmlUtils.toString(element);
                this.warnings.add(null, propertyName, 33, xml, e.getMessage());
                VCardPropertyScribe<? extends VCardProperty> scribe2 = this.index.getPropertyScribe(Xml.class);
                property = scribe2.parseXml(element, parameters).getProperty();
                property.setGroup(group);
            } catch (EmbeddedVCardException e2) {
                this.warnings.add(null, propertyName, 34, new Object[0]);
                return;
            } catch (SkipMeException e3) {
                this.warnings.add(null, propertyName, 22, e3.getMessage());
                return;
            }
            this.vcard.addProperty(property);
        }

        private VCardParameters parseParameters(Element element) {
            VCardParameters parameters = new VCardParameters();
            List<Element> roots = XmlUtils.toElementList(element.getElementsByTagNameNS(XCardQNames.PARAMETERS.getNamespaceURI(), XCardQNames.PARAMETERS.getLocalPart()));
            for (Element root : roots) {
                List<Element> parameterElements = XmlUtils.toElementList(root.getChildNodes());
                for (Element parameterElement : parameterElements) {
                    String name = parameterElement.getLocalName().toUpperCase();
                    List<Element> valueElements = XmlUtils.toElementList(parameterElement.getChildNodes());
                    if (valueElements.isEmpty()) {
                        String value = parameterElement.getTextContent();
                        parameters.put(name, value);
                    } else {
                        for (Element valueElement : valueElements) {
                            String value2 = valueElement.getTextContent();
                            parameters.put(name, value2);
                        }
                    }
                }
            }
            return parameters;
        }

        private List<Element> getChildElements(Element parent, QName qname) {
            List<Element> elements = new ArrayList<>();
            for (Element child : XmlUtils.toElementList(parent.getChildNodes())) {
                if (qname.getLocalPart().equals(child.getLocalName()) && qname.getNamespaceURI().equals(child.getNamespaceURI())) {
                    elements.add(child);
                }
            }
            return elements;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardDocument$XCardDocumentStreamWriter.class */
    public class XCardDocumentStreamWriter extends StreamWriter {
        private final Map<String, VCardDataType> parameterDataTypes = new HashMap();

        public XCardDocumentStreamWriter() {
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
        }

        @Override // ezvcard.io.StreamWriter
        public void write(VCard vcard) {
            try {
                super.write(vcard);
            } catch (IOException e) {
            }
        }

        @Override // ezvcard.io.StreamWriter
        protected void _write(VCard vcard, List<VCardProperty> properties) throws IOException {
            Element parent;
            ListMultimap<String, VCardProperty> propertiesByGroup = new ListMultimap<>();
            for (VCardProperty property : properties) {
                propertiesByGroup.put(property.getGroup(), property);
            }
            Element vcardElement = createElement(XCardQNames.VCARD);
            Iterator i$ = propertiesByGroup.iterator();
            while (i$.hasNext()) {
                Map.Entry<String, List<VCardProperty>> entry = i$.next();
                String groupName = entry.getKey();
                if (groupName != null) {
                    Element groupElement = createElement(XCardQNames.GROUP);
                    groupElement.setAttribute("name", groupName);
                    vcardElement.appendChild(groupElement);
                    parent = groupElement;
                } else {
                    parent = vcardElement;
                }
                Iterator i$2 = entry.getValue().iterator();
                while (i$2.hasNext()) {
                    try {
                        Element propertyElement = marshalProperty(i$2.next(), vcard);
                        parent.appendChild(propertyElement);
                    } catch (EmbeddedVCardException e) {
                    } catch (SkipMeException e2) {
                    }
                }
            }
            if (XCardDocument.this.root == null) {
                XCardDocument.this.root = createElement(XCardQNames.VCARDS);
                Element documentRoot = XmlUtils.getRootElement(XCardDocument.this.document);
                if (documentRoot == null) {
                    XCardDocument.this.document.appendChild(XCardDocument.this.root);
                } else {
                    documentRoot.appendChild(XCardDocument.this.root);
                }
            }
            XCardDocument.this.root.appendChild(vcardElement);
        }

        @Override // ezvcard.io.StreamWriter
        protected VCardVersion getTargetVersion() {
            return VCardVersion.V4_0;
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
        public void close() {
        }

        private Element marshalProperty(VCardProperty type, VCard vcard) {
            VCardPropertyScribe scribe = this.index.getPropertyScribe(type);
            VCardParameters parameters = scribe.prepareParameters(type, XCardDocument.this.version4, vcard);
            QName qname = scribe.getQName();
            Element propertyElement = createElement(qname);
            if (!parameters.isEmpty()) {
                Element parametersElement = marshalParameters(parameters);
                propertyElement.appendChild(parametersElement);
            }
            scribe.writeXml(type, propertyElement);
            return propertyElement;
        }

        private Element marshalParameters(VCardParameters parameters) {
            Element parametersElement = createElement(XCardQNames.PARAMETERS);
            Iterator i$ = parameters.iterator();
            while (i$.hasNext()) {
                Map.Entry<String, List<String>> parameter = i$.next();
                String parameterName = parameter.getKey().toLowerCase();
                Element parameterElement = createElement(parameterName);
                for (String parameterValue : parameter.getValue()) {
                    VCardDataType dataType = this.parameterDataTypes.get(parameterName);
                    String dataTypeElementName = dataType == null ? "unknown" : dataType.getName().toLowerCase();
                    Element dataTypeElement = createElement(dataTypeElementName);
                    dataTypeElement.setTextContent(parameterValue);
                    parameterElement.appendChild(dataTypeElement);
                }
                parametersElement.appendChild(parameterElement);
            }
            return parametersElement;
        }

        private Element createElement(String name) {
            return createElement(name, XCardDocument.this.version4.getXmlNamespace());
        }

        private Element createElement(String name, String ns) {
            return XCardDocument.this.document.createElementNS(ns, name);
        }

        private Element createElement(QName qname) {
            return createElement(qname.getLocalPart(), qname.getNamespaceURI());
        }
    }
}
