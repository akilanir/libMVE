package freemarker.ext.dom;

import freemarker.core.FMParserConstants;
import freemarker.ext.util.WrapperTemplateModel;
import freemarker.log.Logger;
import freemarker.template.AdapterTemplateModel;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateNodeModel;
import freemarker.template.TemplateSequenceModel;
import java.io.File;
import java.io.IOException;
import java.lang.ref.WeakReference;
import java.net.MalformedURLException;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Attr;
import org.w3c.dom.CDATASection;
import org.w3c.dom.CharacterData;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.ProcessingInstruction;
import org.w3c.dom.Text;
import org.xml.sax.ErrorHandler;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/NodeModel.class */
public abstract class NodeModel implements TemplateNodeModel, TemplateHashModel, TemplateSequenceModel, AdapterTemplateModel, WrapperTemplateModel {
    private static DocumentBuilderFactory docBuilderFactory;
    private static XPathSupport jaxenXPathSupport;
    private static ErrorHandler errorHandler;
    static Class xpathSupportClass;
    final Node node;
    private TemplateSequenceModel children;
    private NodeModel parent;
    static Class class$freemarker$ext$dom$XPathSupport;
    static final Logger logger = Logger.getLogger("freemarker.dom");
    private static final Object STATIC_LOCK = new Object();
    private static final Map xpathSupportMap = Collections.synchronizedMap(new WeakHashMap());

    static {
        try {
            useDefaultXPathSupport();
        } catch (Exception e) {
        }
        if (xpathSupportClass == null && logger.isWarnEnabled()) {
            logger.warn("No XPath support is available.");
        }
    }

    public static void setDocumentBuilderFactory(DocumentBuilderFactory docBuilderFactory2) {
        synchronized (STATIC_LOCK) {
            docBuilderFactory = docBuilderFactory2;
        }
    }

    public static DocumentBuilderFactory getDocumentBuilderFactory() {
        DocumentBuilderFactory documentBuilderFactory;
        synchronized (STATIC_LOCK) {
            if (docBuilderFactory == null) {
                DocumentBuilderFactory newFactory = DocumentBuilderFactory.newInstance();
                newFactory.setNamespaceAware(true);
                newFactory.setIgnoringElementContentWhitespace(true);
                docBuilderFactory = newFactory;
            }
            documentBuilderFactory = docBuilderFactory;
        }
        return documentBuilderFactory;
    }

    public static void setErrorHandler(ErrorHandler errorHandler2) {
        synchronized (STATIC_LOCK) {
            errorHandler = errorHandler2;
        }
    }

    public static ErrorHandler getErrorHandler() {
        ErrorHandler errorHandler2;
        synchronized (STATIC_LOCK) {
            errorHandler2 = errorHandler;
        }
        return errorHandler2;
    }

    public static NodeModel parse(InputSource is, boolean removeComments, boolean removePIs) throws SAXException, IOException, ParserConfigurationException {
        DocumentBuilder builder = getDocumentBuilderFactory().newDocumentBuilder();
        ErrorHandler errorHandler2 = getErrorHandler();
        if (errorHandler2 != null) {
            builder.setErrorHandler(errorHandler2);
        }
        try {
            Document doc = builder.parse(is);
            if (removeComments && removePIs) {
                simplify(doc);
            } else {
                if (removeComments) {
                    removeComments(doc);
                }
                if (removePIs) {
                    removePIs(doc);
                }
                mergeAdjacentText(doc);
            }
            return wrap(doc);
        } catch (MalformedURLException e) {
            if (is.getSystemId() == null && is.getCharacterStream() == null && is.getByteStream() == null) {
                throw new MalformedURLException(new StringBuffer().append("The SAX InputSource has systemId == null && characterStream == null && byteStream == null. This is often because it was created with a null InputStream or Reader, which is often because the XML file it should point to was not found. (The original exception was: ").append(e).append(")").toString());
            }
            throw e;
        }
    }

    public static NodeModel parse(InputSource is) throws SAXException, IOException, ParserConfigurationException {
        return parse(is, true, true);
    }

    public static NodeModel parse(File f, boolean removeComments, boolean removePIs) throws SAXException, IOException, ParserConfigurationException {
        DocumentBuilder builder = getDocumentBuilderFactory().newDocumentBuilder();
        ErrorHandler errorHandler2 = getErrorHandler();
        if (errorHandler2 != null) {
            builder.setErrorHandler(errorHandler2);
        }
        Document doc = builder.parse(f);
        if (removeComments) {
            removeComments(doc);
        }
        if (removePIs) {
            removePIs(doc);
        }
        mergeAdjacentText(doc);
        return wrap(doc);
    }

    public static NodeModel parse(File f) throws SAXException, IOException, ParserConfigurationException {
        return parse(f, true, true);
    }

    protected NodeModel(Node node) {
        this.node = node;
    }

    public Node getNode() {
        return this.node;
    }

    public TemplateModel get(String key) throws TemplateModelException {
        if (key.startsWith("@@")) {
            if (key.equals("@@text")) {
                return new SimpleScalar(getText(this.node));
            }
            if (key.equals("@@namespace")) {
                String nsURI = this.node.getNamespaceURI();
                if (nsURI == null) {
                    return null;
                }
                return new SimpleScalar(nsURI);
            }
            if (key.equals("@@local_name")) {
                String localName = this.node.getLocalName();
                if (localName == null) {
                    localName = getNodeName();
                }
                return new SimpleScalar(localName);
            }
            if (key.equals("@@markup")) {
                StringBuffer buf = new StringBuffer();
                NodeOutputter nu = new NodeOutputter(this.node);
                nu.outputContent(this.node, buf);
                return new SimpleScalar(buf.toString());
            }
            if (key.equals("@@nested_markup")) {
                StringBuffer buf2 = new StringBuffer();
                NodeOutputter nu2 = new NodeOutputter(this.node);
                nu2.outputContent(this.node.getChildNodes(), buf2);
                return new SimpleScalar(buf2.toString());
            }
            if (key.equals("@@qname")) {
                String qname = getQualifiedName();
                if (qname == null) {
                    return null;
                }
                return new SimpleScalar(qname);
            }
        }
        XPathSupport xps = getXPathSupport();
        if (xps != null) {
            return xps.executeQuery(this.node, key);
        }
        throw new TemplateModelException(new StringBuffer().append("Can't try to resolve the XML query key, because no XPath support is available. It's either malformed or an XPath expression: ").append(key).toString());
    }

    @Override // freemarker.template.TemplateNodeModel
    public TemplateNodeModel getParentNode() {
        if (this.parent == null) {
            Node parentNode = this.node.getParentNode();
            if (parentNode == null && (this.node instanceof Attr)) {
                parentNode = ((Attr) this.node).getOwnerElement();
            }
            this.parent = wrap(parentNode);
        }
        return this.parent;
    }

    @Override // freemarker.template.TemplateNodeModel
    public TemplateSequenceModel getChildNodes() {
        if (this.children == null) {
            this.children = new NodeListModel(this.node.getChildNodes(), this);
        }
        return this.children;
    }

    @Override // freemarker.template.TemplateNodeModel
    public final String getNodeType() throws TemplateModelException {
        short nodeType = this.node.getNodeType();
        switch (nodeType) {
            case 1:
                return "element";
            case 2:
                return "attribute";
            case 3:
                return "text";
            case 4:
                return "text";
            case 5:
                return "entity_reference";
            case 6:
                return "entity";
            case 7:
                return "pi";
            case 8:
                return "comment";
            case FMParserConstants.ELSE_IF /* 9 */:
                return "document";
            case FMParserConstants.LIST /* 10 */:
                return "document_type";
            case FMParserConstants.FOREACH /* 11 */:
                return "document_fragment";
            case FMParserConstants.SWITCH /* 12 */:
                return "notation";
            default:
                throw new TemplateModelException(new StringBuffer().append("Unknown node type: ").append((int) nodeType).append(". This should be impossible!").toString());
        }
    }

    public TemplateModel exec(List args) throws TemplateModelException {
        if (args.size() != 1) {
            throw new TemplateModelException("Expecting exactly one arguments");
        }
        String query = (String) args.get(0);
        XPathSupport xps = getXPathSupport();
        if (xps == null) {
            throw new TemplateModelException("No XPath support available");
        }
        return xps.executeQuery(this.node, query);
    }

    @Override // freemarker.template.TemplateSequenceModel
    public final int size() {
        return 1;
    }

    @Override // freemarker.template.TemplateSequenceModel
    public final TemplateModel get(int i) {
        if (i == 0) {
            return this;
        }
        return null;
    }

    @Override // freemarker.template.TemplateNodeModel
    public String getNodeNamespace() {
        int nodeType = this.node.getNodeType();
        if (nodeType != 2 && nodeType != 1) {
            return null;
        }
        String result = this.node.getNamespaceURI();
        if (result == null && nodeType == 1) {
            result = "";
        } else if ("".equals(result) && nodeType == 2) {
            result = null;
        }
        return result;
    }

    public final int hashCode() {
        return this.node.hashCode();
    }

    public boolean equals(Object other) {
        return other != null && other.getClass() == getClass() && ((NodeModel) other).node.equals(this.node);
    }

    public static NodeModel wrap(Node node) {
        if (node == null) {
            return null;
        }
        NodeModel result = null;
        switch (node.getNodeType()) {
            case 1:
                result = new ElementModel((Element) node);
                break;
            case 2:
                result = new AttributeNodeModel((Attr) node);
                break;
            case 3:
            case 4:
            case 8:
                result = new CharacterDataNodeModel((CharacterData) node);
                break;
            case 7:
                result = new PINodeModel((ProcessingInstruction) node);
                break;
            case FMParserConstants.ELSE_IF /* 9 */:
                result = new DocumentModel((Document) node);
                break;
            case FMParserConstants.LIST /* 10 */:
                result = new DocumentTypeModel((DocumentType) node);
                break;
        }
        return result;
    }

    public static void removeComments(Node node) {
        NodeList children = node.getChildNodes();
        int i = 0;
        int len = children.getLength();
        while (i < len) {
            Node child = children.item(i);
            if (child.hasChildNodes()) {
                removeComments(child);
                i++;
            } else if (child.getNodeType() == 8) {
                node.removeChild(child);
                len--;
            } else {
                i++;
            }
        }
    }

    public static void removePIs(Node node) {
        NodeList children = node.getChildNodes();
        int i = 0;
        int len = children.getLength();
        while (i < len) {
            Node child = children.item(i);
            if (child.hasChildNodes()) {
                removePIs(child);
                i++;
            } else if (child.getNodeType() == 7) {
                node.removeChild(child);
                len--;
            } else {
                i++;
            }
        }
    }

    public static void mergeAdjacentText(Node node) {
        Node firstChild = node.getFirstChild();
        while (true) {
            Node child = firstChild;
            if (child != null) {
                if ((child instanceof Text) || (child instanceof CDATASection)) {
                    Node next = child.getNextSibling();
                    if ((next instanceof Text) || (next instanceof CDATASection)) {
                        String fullText = new StringBuffer().append(child.getNodeValue()).append(next.getNodeValue()).toString();
                        ((CharacterData) child).setData(fullText);
                        node.removeChild(next);
                    }
                } else {
                    mergeAdjacentText(child);
                }
                firstChild = child.getNextSibling();
            } else {
                return;
            }
        }
    }

    public static void simplify(Node node) {
        NodeList children = node.getChildNodes();
        int i = 0;
        int len = children.getLength();
        Node prevTextChild = null;
        while (i < len) {
            Node child = children.item(i);
            if (child.hasChildNodes()) {
                simplify(child);
                prevTextChild = null;
                i++;
            } else {
                int type = child.getNodeType();
                if (type == 7) {
                    node.removeChild(child);
                    len--;
                } else if (type == 8) {
                    node.removeChild(child);
                    len--;
                } else if (type == 3 || type == 4) {
                    if (prevTextChild != null) {
                        CharacterData ptc = (CharacterData) prevTextChild;
                        ptc.setData(new StringBuffer().append(ptc.getNodeValue()).append(child.getNodeValue()).toString());
                        node.removeChild(child);
                        len--;
                    } else {
                        prevTextChild = child;
                        i++;
                    }
                } else {
                    prevTextChild = null;
                    i++;
                }
            }
        }
    }

    NodeModel getDocumentNodeModel() {
        if (this.node instanceof Document) {
            return this;
        }
        return wrap(this.node.getOwnerDocument());
    }

    public static void useDefaultXPathSupport() {
        synchronized (STATIC_LOCK) {
            xpathSupportClass = null;
            jaxenXPathSupport = null;
            try {
                useXalanXPathSupport();
            } catch (Exception e) {
            }
            if (xpathSupportClass == null) {
                try {
                    useSunInternalXPathSupport();
                } catch (Exception e2) {
                }
            }
            if (xpathSupportClass == null) {
                try {
                    useJaxenXPathSupport();
                } catch (Exception e3) {
                }
            }
        }
    }

    public static void useJaxenXPathSupport() throws Exception {
        Class.forName("org.jaxen.dom.DOMXPath");
        Class c = Class.forName("freemarker.ext.dom.JaxenXPathSupport");
        jaxenXPathSupport = (XPathSupport) c.newInstance();
        synchronized (STATIC_LOCK) {
            xpathSupportClass = c;
        }
        if (logger.isDebugEnabled()) {
            logger.debug("Using Jaxen classes for XPath support");
        }
    }

    public static void useXalanXPathSupport() throws Exception {
        Class.forName("org.apache.xpath.XPath");
        Class c = Class.forName("freemarker.ext.dom.XalanXPathSupport");
        synchronized (STATIC_LOCK) {
            xpathSupportClass = c;
        }
        if (logger.isDebugEnabled()) {
            logger.debug("Using Xalan classes for XPath support");
        }
    }

    public static void useSunInternalXPathSupport() throws Exception {
        Class.forName("com.sun.org.apache.xpath.internal.XPath");
        Class c = Class.forName("freemarker.ext.dom.SunInternalXalanXPathSupport");
        synchronized (STATIC_LOCK) {
            xpathSupportClass = c;
        }
        if (logger.isDebugEnabled()) {
            logger.debug("Using Sun's internal Xalan classes for XPath support");
        }
    }

    public static void setXPathSupportClass(Class cl) {
        Class cls;
        if (cl != null) {
            if (class$freemarker$ext$dom$XPathSupport == null) {
                cls = class$("freemarker.ext.dom.XPathSupport");
                class$freemarker$ext$dom$XPathSupport = cls;
            } else {
                cls = class$freemarker$ext$dom$XPathSupport;
            }
            if (!cls.isAssignableFrom(cl)) {
                throw new RuntimeException(new StringBuffer().append("Class ").append(cl.getName()).append(" does not implement freemarker.ext.dom.XPathSupport").toString());
            }
        }
        synchronized (STATIC_LOCK) {
            xpathSupportClass = cl;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public static Class getXPathSupportClass() {
        Class cls;
        synchronized (STATIC_LOCK) {
            cls = xpathSupportClass;
        }
        return cls;
    }

    private static String getText(Node node) {
        String result = "";
        if ((node instanceof Text) || (node instanceof CDATASection)) {
            result = ((CharacterData) node).getData();
        } else if (node instanceof Element) {
            NodeList children = node.getChildNodes();
            for (int i = 0; i < children.getLength(); i++) {
                result = new StringBuffer().append(result).append(getText(children.item(i))).toString();
            }
        } else if (node instanceof Document) {
            result = getText(((Document) node).getDocumentElement());
        }
        return result;
    }

    XPathSupport getXPathSupport() {
        if (jaxenXPathSupport != null) {
            return jaxenXPathSupport;
        }
        XPathSupport xps = null;
        Document doc = this.node.getOwnerDocument();
        if (doc == null) {
            doc = (Document) this.node;
        }
        synchronized (doc) {
            WeakReference ref = (WeakReference) xpathSupportMap.get(doc);
            if (ref != null) {
                xps = (XPathSupport) ref.get();
            }
            if (xps == null) {
                try {
                    xps = (XPathSupport) xpathSupportClass.newInstance();
                    xpathSupportMap.put(doc, new WeakReference(xps));
                } catch (Exception e) {
                    logger.error("Error instantiating xpathSupport class", e);
                }
            }
        }
        return xps;
    }

    String getQualifiedName() throws TemplateModelException {
        return getNodeName();
    }

    @Override // freemarker.template.AdapterTemplateModel
    public Object getAdaptedObject(Class hint) {
        return this.node;
    }

    @Override // freemarker.ext.util.WrapperTemplateModel
    public Object getWrappedObject() {
        return this.node;
    }
}
