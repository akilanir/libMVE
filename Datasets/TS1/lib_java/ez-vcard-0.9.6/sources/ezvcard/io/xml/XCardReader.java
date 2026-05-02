package ezvcard.io.xml;

import ezvcard.VCard;
import ezvcard.VCardVersion;
import ezvcard.io.CannotParseException;
import ezvcard.io.EmbeddedVCardException;
import ezvcard.io.SkipMeException;
import ezvcard.io.StreamReader;
import ezvcard.io.scribe.VCardPropertyScribe;
import ezvcard.parameter.VCardParameters;
import ezvcard.property.VCardProperty;
import ezvcard.property.Xml;
import ezvcard.util.XmlUtils;
import java.io.Closeable;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.Reader;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.BlockingQueue;
import javax.xml.namespace.QName;
import javax.xml.transform.ErrorListener;
import javax.xml.transform.Source;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerConfigurationException;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.sax.SAXResult;
import javax.xml.transform.stream.StreamSource;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardReader.class */
public class XCardReader extends StreamReader {
    private final VCardVersion version;
    private final String NS;
    private final Source source;
    private final Closeable stream;
    private volatile VCard readVCard;
    private volatile TransformerException thrown;
    private final ReadThread thread;
    private final Object lock;
    private final BlockingQueue<Object> readerBlock;
    private final BlockingQueue<Object> threadBlock;

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardReader$ElementType.class */
    private enum ElementType {
        vcards,
        vcard,
        group,
        property,
        parameters,
        parameter,
        parameterValue
    }

    public XCardReader(String xml) {
        this(new StringReader(xml));
    }

    public XCardReader(InputStream in) {
        this.version = VCardVersion.V4_0;
        this.NS = this.version.getXmlNamespace();
        this.thread = new ReadThread();
        this.lock = new Object();
        this.readerBlock = new ArrayBlockingQueue(1);
        this.threadBlock = new ArrayBlockingQueue(1);
        this.source = new StreamSource(in);
        this.stream = in;
    }

    public XCardReader(File file) throws FileNotFoundException {
        this(new FileInputStream(file));
    }

    public XCardReader(Reader reader) {
        this.version = VCardVersion.V4_0;
        this.NS = this.version.getXmlNamespace();
        this.thread = new ReadThread();
        this.lock = new Object();
        this.readerBlock = new ArrayBlockingQueue(1);
        this.threadBlock = new ArrayBlockingQueue(1);
        this.source = new StreamSource(reader);
        this.stream = reader;
    }

    public XCardReader(Node node) {
        this.version = VCardVersion.V4_0;
        this.NS = this.version.getXmlNamespace();
        this.thread = new ReadThread();
        this.lock = new Object();
        this.readerBlock = new ArrayBlockingQueue(1);
        this.threadBlock = new ArrayBlockingQueue(1);
        this.source = new DOMSource(node);
        this.stream = null;
    }

    @Override // ezvcard.io.StreamReader
    protected VCard _readNext() throws IOException {
        this.readVCard = null;
        this.thrown = null;
        if (!this.thread.started) {
            this.thread.start();
        } else {
            if (this.thread.finished || this.thread.closed) {
                return null;
            }
            try {
                this.threadBlock.put(this.lock);
            } catch (InterruptedException e) {
                return null;
            }
        }
        try {
            this.readerBlock.take();
            if (this.thrown != null) {
                throw new IOException(this.thrown);
            }
            return this.readVCard;
        } catch (InterruptedException e2) {
            return null;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardReader$ReadThread.class */
    private class ReadThread extends Thread {
        private final SAXResult result;
        private final Transformer transformer;
        private volatile boolean finished = false;
        private volatile boolean started = false;
        private volatile boolean closed = false;

        public ReadThread() {
            setName(getClass().getSimpleName());
            try {
                this.transformer = TransformerFactory.newInstance().newTransformer();
                this.transformer.setErrorListener(new ErrorListener() { // from class: ezvcard.io.xml.XCardReader.ReadThread.1
                    @Override // javax.xml.transform.ErrorListener
                    public void error(TransformerException e) {
                    }

                    @Override // javax.xml.transform.ErrorListener
                    public void fatalError(TransformerException e) {
                    }

                    @Override // javax.xml.transform.ErrorListener
                    public void warning(TransformerException e) {
                    }
                });
                this.result = new SAXResult(new ContentHandlerImpl());
            } catch (TransformerConfigurationException e) {
                throw new RuntimeException(e);
            }
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            this.started = true;
            try {
                try {
                    this.transformer.transform(XCardReader.this.source, this.result);
                    this.finished = true;
                    try {
                        XCardReader.this.readerBlock.put(XCardReader.this.lock);
                    } catch (InterruptedException e) {
                    }
                } catch (TransformerException e2) {
                    if (!XCardReader.this.thread.closed) {
                        XCardReader.this.thrown = e2;
                    }
                    this.finished = true;
                    try {
                        XCardReader.this.readerBlock.put(XCardReader.this.lock);
                    } catch (InterruptedException e3) {
                    }
                }
            } catch (Throwable th) {
                this.finished = true;
                try {
                    XCardReader.this.readerBlock.put(XCardReader.this.lock);
                } catch (InterruptedException e4) {
                }
                throw th;
            }
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardReader$ContentHandlerImpl.class */
    private class ContentHandlerImpl extends DefaultHandler {
        private final Document DOC;
        private final XCardStructure structure;
        private final StringBuilder characterBuffer;
        private String group;
        private Element propertyElement;
        private Element parent;
        private QName paramName;
        private VCardParameters parameters;

        private ContentHandlerImpl() {
            this.DOC = XmlUtils.createDocument();
            this.structure = new XCardStructure();
            this.characterBuffer = new StringBuilder();
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] buffer, int start, int length) throws SAXException {
            if (this.propertyElement == null) {
                return;
            }
            this.characterBuffer.append(buffer, start, length);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String namespace, String localName, String qName, Attributes attributes) throws SAXException {
            QName qname = new QName(namespace, localName);
            String textContent = this.characterBuffer.toString();
            this.characterBuffer.setLength(0);
            if (this.structure.isEmpty()) {
                if (XCardQNames.VCARDS.equals(qname)) {
                    this.structure.push(ElementType.vcards);
                    return;
                }
                return;
            }
            ElementType parentType = this.structure.peek();
            ElementType typeToPush = null;
            if (parentType != null) {
                switch (parentType) {
                    case vcards:
                        if (XCardQNames.VCARD.equals(qname)) {
                            XCardReader.this.readVCard = new VCard();
                            XCardReader.this.readVCard.setVersion(XCardReader.this.version);
                            typeToPush = ElementType.vcard;
                            break;
                        }
                        break;
                    case vcard:
                        if (XCardQNames.GROUP.equals(qname)) {
                            this.group = attributes.getValue("name");
                            typeToPush = ElementType.group;
                            break;
                        } else {
                            this.propertyElement = createElement(namespace, localName, attributes);
                            this.parameters = new VCardParameters();
                            this.parent = this.propertyElement;
                            typeToPush = ElementType.property;
                            break;
                        }
                    case group:
                        this.propertyElement = createElement(namespace, localName, attributes);
                        this.parameters = new VCardParameters();
                        this.parent = this.propertyElement;
                        typeToPush = ElementType.property;
                        break;
                    case property:
                        if (XCardQNames.PARAMETERS.equals(qname)) {
                            typeToPush = ElementType.parameters;
                            break;
                        }
                        break;
                    case parameters:
                        if (XCardReader.this.NS.equals(namespace)) {
                            this.paramName = qname;
                            typeToPush = ElementType.parameter;
                            break;
                        }
                        break;
                    case parameter:
                        if (XCardReader.this.NS.equals(namespace)) {
                            typeToPush = ElementType.parameterValue;
                            break;
                        }
                        break;
                }
            }
            if (this.propertyElement != null && typeToPush != ElementType.property && typeToPush != ElementType.parameters && !this.structure.isUnderParameters()) {
                if (textContent.length() > 0) {
                    this.parent.appendChild(this.DOC.createTextNode(textContent));
                }
                Element element = createElement(namespace, localName, attributes);
                this.parent.appendChild(element);
                this.parent = element;
            }
            this.structure.push(typeToPush);
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String namespace, String localName, String qName) throws SAXException {
            String textContent = this.characterBuffer.toString();
            this.characterBuffer.setLength(0);
            if (this.structure.isEmpty()) {
                return;
            }
            ElementType type = this.structure.pop();
            if (type == null && (this.propertyElement == null || this.structure.isUnderParameters())) {
                return;
            }
            if (type != null) {
                switch (type) {
                    case vcard:
                        try {
                            XCardReader.this.readerBlock.put(XCardReader.this.lock);
                            XCardReader.this.threadBlock.take();
                            break;
                        } catch (InterruptedException e) {
                            throw new SAXException(e);
                        }
                    case group:
                        this.group = null;
                        break;
                    case property:
                        this.propertyElement.appendChild(this.DOC.createTextNode(textContent));
                        QName propertyQName = new QName(this.propertyElement.getNamespaceURI(), this.propertyElement.getLocalName());
                        VCardPropertyScribe<? extends VCardProperty> scribe = XCardReader.this.index.getPropertyScribe(propertyQName);
                        try {
                            VCardPropertyScribe.Result<T> parseXml = scribe.parseXml(this.propertyElement, this.parameters);
                            VCardProperty property = parseXml.getProperty();
                            property.setGroup(this.group);
                            XCardReader.this.readVCard.addProperty(property);
                            for (String warning : parseXml.getWarnings()) {
                                XCardReader.this.warnings.add(null, localName, warning);
                            }
                        } catch (CannotParseException e2) {
                            String xml = XmlUtils.toString(this.propertyElement);
                            XCardReader.this.warnings.add(null, localName, 33, xml, e2.getMessage());
                            VCardPropertyScribe<? extends VCardProperty> scribe2 = XCardReader.this.index.getPropertyScribe(Xml.class);
                            VCardProperty property2 = scribe2.parseXml(this.propertyElement, this.parameters).getProperty();
                            property2.setGroup(this.group);
                            XCardReader.this.readVCard.addProperty(property2);
                        } catch (EmbeddedVCardException e3) {
                            XCardReader.this.warnings.add(null, localName, 34, new Object[0]);
                        } catch (SkipMeException e4) {
                            XCardReader.this.warnings.add(null, localName, 22, e4.getMessage());
                        }
                        this.propertyElement = null;
                        break;
                    case parameterValue:
                        this.parameters.put(this.paramName.getLocalPart(), textContent);
                        break;
                }
            }
            if (this.propertyElement != null && type != ElementType.property && type != ElementType.parameters && !this.structure.isUnderParameters()) {
                if (textContent.length() > 0) {
                    this.parent.appendChild(this.DOC.createTextNode(textContent));
                }
                this.parent = (Element) this.parent.getParentNode();
            }
        }

        private Element createElement(String namespace, String localName, Attributes attributes) {
            Element element = this.DOC.createElementNS(namespace, localName);
            for (int i = 0; i < attributes.getLength(); i++) {
                String qname = attributes.getQName(i);
                if (!qname.startsWith("xmlns:")) {
                    String name = attributes.getLocalName(i);
                    String value = attributes.getValue(i);
                    element.setAttribute(name, value);
                }
            }
            return element;
        }
    }

    /* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/xml/XCardReader$XCardStructure.class */
    private class XCardStructure {
        private final List<ElementType> stack;

        private XCardStructure() {
            this.stack = new ArrayList();
        }

        public ElementType pop() {
            if (this.stack.isEmpty()) {
                return null;
            }
            return this.stack.remove(this.stack.size() - 1);
        }

        public ElementType peek() {
            if (this.stack.isEmpty()) {
                return null;
            }
            return this.stack.get(this.stack.size() - 1);
        }

        public void push(ElementType type) {
            this.stack.add(type);
        }

        public boolean isUnderParameters() {
            ElementType nonNull = null;
            int i = this.stack.size() - 1;
            while (true) {
                if (i < 0) {
                    break;
                }
                ElementType type = this.stack.get(i);
                if (type == null) {
                    i--;
                } else {
                    nonNull = type;
                    break;
                }
            }
            return nonNull == ElementType.parameters || nonNull == ElementType.parameter || nonNull == ElementType.parameterValue;
        }

        public boolean isEmpty() {
            return this.stack.isEmpty();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.thread.isAlive()) {
            this.thread.closed = true;
            this.thread.interrupt();
        }
        if (this.stream != null) {
            this.stream.close();
        }
    }
}
