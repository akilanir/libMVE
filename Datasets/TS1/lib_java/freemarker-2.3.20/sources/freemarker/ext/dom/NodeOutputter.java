package freemarker.ext.dom;

import freemarker.core.Environment;
import freemarker.core.FMParserConstants;
import freemarker.template.Template;
import freemarker.template.utility.StringUtil;
import java.util.HashMap;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.DocumentType;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

/* loaded from: freemarker-2.3.20.jar:freemarker/ext/dom/NodeOutputter.class */
class NodeOutputter {
    private Element contextNode;
    private Environment env;
    private String defaultNS;
    private boolean hasDefaultNS;
    private boolean explicitDefaultNSPrefix;
    private HashMap namespacesToPrefixLookup = new HashMap();
    private String namespaceDecl;

    NodeOutputter(Node node) {
        if (node instanceof Element) {
            setContext((Element) node);
        } else if (node instanceof Attr) {
            setContext(((Attr) node).getOwnerElement());
        } else if (node instanceof Document) {
            setContext(((Document) node).getDocumentElement());
        }
    }

    private void setContext(Element contextNode) {
        this.contextNode = contextNode;
        this.env = Environment.getCurrentEnvironment();
        this.defaultNS = this.env.getDefaultNS();
        this.hasDefaultNS = this.defaultNS != null && this.defaultNS.length() > 0;
        this.namespacesToPrefixLookup.put(null, "");
        this.namespacesToPrefixLookup.put("", "");
        buildPrefixLookup(contextNode);
        if (!this.explicitDefaultNSPrefix && this.hasDefaultNS) {
            this.namespacesToPrefixLookup.put(this.defaultNS, "");
        }
        constructNamespaceDecl();
    }

    private void buildPrefixLookup(Node n) {
        String nsURI = n.getNamespaceURI();
        if (nsURI != null && nsURI.length() > 0) {
            String prefix = this.env.getPrefixForNamespace(nsURI);
            this.namespacesToPrefixLookup.put(nsURI, prefix);
        } else if (this.hasDefaultNS && n.getNodeType() == 1) {
            this.namespacesToPrefixLookup.put(this.defaultNS, Template.DEFAULT_NAMESPACE_PREFIX);
            this.explicitDefaultNSPrefix = true;
        } else if (n.getNodeType() == 2 && this.hasDefaultNS && this.defaultNS.equals(nsURI)) {
            this.namespacesToPrefixLookup.put(this.defaultNS, Template.DEFAULT_NAMESPACE_PREFIX);
            this.explicitDefaultNSPrefix = true;
        }
        NodeList childNodes = n.getChildNodes();
        for (int i = 0; i < childNodes.getLength(); i++) {
            buildPrefixLookup(childNodes.item(i));
        }
    }

    private void constructNamespaceDecl() {
        StringBuffer buf = new StringBuffer();
        if (this.explicitDefaultNSPrefix) {
            buf.append(" xmlns=\"");
            buf.append(this.defaultNS);
            buf.append("\"");
        }
        for (String nsURI : this.namespacesToPrefixLookup.keySet()) {
            if (nsURI != null && nsURI.length() != 0) {
                String prefix = (String) this.namespacesToPrefixLookup.get(nsURI);
                if (prefix == null) {
                    for (int i = 0; i < 26; i++) {
                        char[] cc = {(char) (97 + i)};
                        prefix = new String(cc);
                        if (this.env.getNamespaceForPrefix(prefix) == null) {
                            break;
                        }
                        prefix = null;
                    }
                    if (prefix == null) {
                        throw new RuntimeException("This will almost never happen!");
                    }
                    this.namespacesToPrefixLookup.put(nsURI, prefix);
                }
                buf.append(" xmlns");
                if (prefix.length() > 0) {
                    buf.append(":");
                    buf.append(prefix);
                }
                buf.append("=\"");
                buf.append(nsURI);
                buf.append("\"");
            }
        }
        this.namespaceDecl = buf.toString();
    }

    private void outputQualifiedName(Node n, StringBuffer buf) {
        String nsURI = n.getNamespaceURI();
        if (nsURI == null || nsURI.length() == 0) {
            buf.append(n.getNodeName());
            return;
        }
        String prefix = (String) this.namespacesToPrefixLookup.get(nsURI);
        if (prefix == null) {
            buf.append(n.getNodeName());
            return;
        }
        if (prefix.length() > 0) {
            buf.append(prefix);
            buf.append(':');
        }
        buf.append(n.getLocalName());
    }

    void outputContent(Node n, StringBuffer buf) {
        switch (n.getNodeType()) {
            case 1:
                buf.append('<');
                outputQualifiedName(n, buf);
                if (n == this.contextNode) {
                    buf.append(this.namespaceDecl);
                }
                outputContent(n.getAttributes(), buf);
                NodeList children = n.getChildNodes();
                if (children.getLength() == 0) {
                    buf.append(" />");
                    break;
                } else {
                    buf.append('>');
                    outputContent(n.getChildNodes(), buf);
                    buf.append("</");
                    outputQualifiedName(n, buf);
                    buf.append('>');
                    break;
                }
            case 2:
                if (((Attr) n).getSpecified()) {
                    buf.append(' ');
                    outputQualifiedName(n, buf);
                    buf.append("=\"").append(StringUtil.XMLEncQAttr(n.getNodeValue())).append('\"');
                    break;
                }
                break;
            case 3:
            case 4:
                buf.append(StringUtil.XMLEncNQG(n.getNodeValue()));
                break;
            case 5:
                buf.append('&').append(n.getNodeName()).append(';');
                break;
            case 6:
                outputContent(n.getChildNodes(), buf);
                break;
            case 7:
                buf.append("<?").append(n.getNodeName()).append(' ').append(n.getNodeValue()).append("?>");
                break;
            case 8:
                buf.append("<!--").append(n.getNodeValue()).append("-->");
                break;
            case FMParserConstants.ELSE_IF /* 9 */:
                outputContent(n.getChildNodes(), buf);
                break;
            case FMParserConstants.LIST /* 10 */:
                buf.append("<!DOCTYPE ").append(n.getNodeName());
                DocumentType dt = (DocumentType) n;
                if (dt.getPublicId() != null) {
                    buf.append(" PUBLIC \"").append(dt.getPublicId()).append('\"');
                }
                if (dt.getSystemId() != null) {
                    buf.append(" \"").append(dt.getSystemId()).append('\"');
                }
                if (dt.getInternalSubset() != null) {
                    buf.append(" [").append(dt.getInternalSubset()).append(']');
                }
                buf.append('>');
                break;
        }
    }

    void outputContent(NodeList nodes, StringBuffer buf) {
        for (int i = 0; i < nodes.getLength(); i++) {
            outputContent(nodes.item(i), buf);
        }
    }

    void outputContent(NamedNodeMap nodes, StringBuffer buf) {
        for (int i = 0; i < nodes.getLength(); i++) {
            Node n = nodes.item(i);
            if (n.getNodeType() != 2 || (!n.getNodeName().startsWith("xmlns:") && !n.getNodeName().equals("xmlns"))) {
                outputContent(n, buf);
            }
        }
    }

    String getOpeningTag(Element element) {
        StringBuffer buf = new StringBuffer();
        buf.append('<');
        outputQualifiedName(element, buf);
        buf.append(this.namespaceDecl);
        outputContent(element.getAttributes(), buf);
        buf.append('>');
        return buf.toString();
    }

    String getClosingTag(Element element) {
        StringBuffer buf = new StringBuffer();
        buf.append("</");
        outputQualifiedName(element, buf);
        buf.append('>');
        return buf.toString();
    }
}
