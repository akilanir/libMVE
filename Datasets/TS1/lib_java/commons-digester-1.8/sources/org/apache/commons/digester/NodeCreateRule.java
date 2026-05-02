package org.apache.commons.digester;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Attr;
import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.xml.sax.Attributes;
import org.xml.sax.ContentHandler;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/NodeCreateRule.class */
public class NodeCreateRule extends Rule {
    private DocumentBuilder documentBuilder;
    private int nodeType;

    /* loaded from: commons-digester-1.8.jar:org/apache/commons/digester/NodeCreateRule$NodeBuilder.class */
    private class NodeBuilder extends DefaultHandler {
        protected ContentHandler oldContentHandler;
        protected int depth = 0;
        protected Document doc;
        protected Node root;
        protected Node top;
        private final NodeCreateRule this$0;

        public NodeBuilder(NodeCreateRule this$0, Document doc, Node root) throws ParserConfigurationException, SAXException {
            this.this$0 = this$0;
            this.oldContentHandler = null;
            this.doc = null;
            this.root = null;
            this.top = null;
            this.doc = doc;
            this.root = root;
            this.top = root;
            this.oldContentHandler = this$0.digester.getCustomContentHandler();
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void characters(char[] ch, int start, int length) throws SAXException {
            try {
                String str = new String(ch, start, length);
                if (str.trim().length() > 0) {
                    this.top.appendChild(this.doc.createTextNode(str));
                }
            } catch (DOMException e) {
                throw new SAXException(e.getMessage());
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void endElement(String namespaceURI, String localName, String qName) throws SAXException {
            try {
                if (this.depth == 0) {
                    this.this$0.getDigester().setCustomContentHandler(this.oldContentHandler);
                    this.this$0.getDigester().push(this.root);
                    this.this$0.getDigester().endElement(namespaceURI, localName, qName);
                }
                this.top = this.top.getParentNode();
                this.depth--;
            } catch (DOMException e) {
                throw new SAXException(e.getMessage());
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void processingInstruction(String target, String data) throws SAXException {
            try {
                this.top.appendChild(this.doc.createProcessingInstruction(target, data));
            } catch (DOMException e) {
                throw new SAXException(e.getMessage());
            }
        }

        @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
        public void startElement(String namespaceURI, String localName, String qName, Attributes atts) throws SAXException {
            try {
                Node previousTop = this.top;
                if (localName == null || localName.length() == 0) {
                    this.top = this.doc.createElement(qName);
                } else {
                    this.top = this.doc.createElementNS(namespaceURI, localName);
                }
                for (int i = 0; i < atts.getLength(); i++) {
                    if (atts.getLocalName(i) == null || atts.getLocalName(i).length() == 0) {
                        Attr attr = this.doc.createAttribute(atts.getQName(i));
                        attr.setNodeValue(atts.getValue(i));
                        ((Element) this.top).setAttributeNode(attr);
                    } else {
                        Attr attr2 = this.doc.createAttributeNS(atts.getURI(i), atts.getLocalName(i));
                        attr2.setNodeValue(atts.getValue(i));
                        ((Element) this.top).setAttributeNodeNS(attr2);
                    }
                }
                previousTop.appendChild(this.top);
                this.depth++;
            } catch (DOMException e) {
                throw new SAXException(e.getMessage());
            }
        }
    }

    public NodeCreateRule() throws ParserConfigurationException {
        this(1);
    }

    public NodeCreateRule(DocumentBuilder documentBuilder) {
        this(1, documentBuilder);
    }

    public NodeCreateRule(int nodeType) throws ParserConfigurationException {
        this(nodeType, DocumentBuilderFactory.newInstance().newDocumentBuilder());
    }

    public NodeCreateRule(int nodeType, DocumentBuilder documentBuilder) {
        this.documentBuilder = null;
        this.nodeType = 1;
        if (nodeType != 11 && nodeType != 1) {
            throw new IllegalArgumentException("Can only create nodes of type DocumentFragment and Element");
        }
        this.nodeType = nodeType;
        this.documentBuilder = documentBuilder;
    }

    @Override // org.apache.commons.digester.Rule
    public void begin(String namespaceURI, String name, Attributes attributes) throws Exception {
        NodeBuilder builder;
        Element element;
        Document doc = this.documentBuilder.newDocument();
        if (this.nodeType == 1) {
            if (getDigester().getNamespaceAware()) {
                element = doc.createElementNS(namespaceURI, name);
                for (int i = 0; i < attributes.getLength(); i++) {
                    element.setAttributeNS(attributes.getURI(i), attributes.getQName(i), attributes.getValue(i));
                }
            } else {
                element = doc.createElement(name);
                for (int i2 = 0; i2 < attributes.getLength(); i2++) {
                    element.setAttribute(attributes.getQName(i2), attributes.getValue(i2));
                }
            }
            builder = new NodeBuilder(this, doc, element);
        } else {
            builder = new NodeBuilder(this, doc, doc.createDocumentFragment());
        }
        getDigester().setCustomContentHandler(builder);
    }

    @Override // org.apache.commons.digester.Rule
    public void end() throws Exception {
        this.digester.pop();
    }
}
