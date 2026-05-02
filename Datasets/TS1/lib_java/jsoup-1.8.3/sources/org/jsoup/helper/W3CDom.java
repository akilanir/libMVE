package org.jsoup.helper;

import java.io.StringWriter;
import java.util.Iterator;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.jsoup.nodes.Attribute;
import org.jsoup.nodes.Comment;
import org.jsoup.nodes.DataNode;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;
import org.w3c.dom.Document;
import org.w3c.dom.Text;

/* loaded from: jsoup-1.8.3.jar:org/jsoup/helper/W3CDom.class */
public class W3CDom {
    protected DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();

    public Document fromJsoup(org.jsoup.nodes.Document in) {
        Validate.notNull(in);
        try {
            DocumentBuilder builder = this.factory.newDocumentBuilder();
            Document out = builder.newDocument();
            convert(in, out);
            return out;
        } catch (ParserConfigurationException e) {
            throw new IllegalStateException(e);
        }
    }

    public void convert(org.jsoup.nodes.Document in, Document out) {
        if (!StringUtil.isBlank(in.location())) {
            out.setDocumentURI(in.location());
        }
        Element rootEl = in.child(0);
        NodeTraversor traversor = new NodeTraversor(new W3CBuilder(out));
        traversor.traverse(rootEl);
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/helper/W3CDom$W3CBuilder.class */
    protected class W3CBuilder implements NodeVisitor {
        private final Document doc;
        private org.w3c.dom.Element dest;

        public W3CBuilder(Document doc) {
            this.doc = doc;
        }

        @Override // org.jsoup.select.NodeVisitor
        public void head(Node source, int depth) {
            if (source instanceof Element) {
                Element sourceEl = (Element) source;
                org.w3c.dom.Element el = this.doc.createElement(sourceEl.tagName());
                copyAttributes(sourceEl, el);
                if (this.dest == null) {
                    this.doc.appendChild(el);
                } else {
                    this.dest.appendChild(el);
                }
                this.dest = el;
                return;
            }
            if (source instanceof TextNode) {
                TextNode sourceText = (TextNode) source;
                Text text = this.doc.createTextNode(sourceText.getWholeText());
                this.dest.appendChild(text);
            } else if (source instanceof Comment) {
                Comment sourceComment = (Comment) source;
                org.w3c.dom.Comment comment = this.doc.createComment(sourceComment.getData());
                this.dest.appendChild(comment);
            } else if (source instanceof DataNode) {
                DataNode sourceData = (DataNode) source;
                Text node = this.doc.createTextNode(sourceData.getWholeData());
                this.dest.appendChild(node);
            }
        }

        @Override // org.jsoup.select.NodeVisitor
        public void tail(Node source, int depth) {
            if ((source instanceof Element) && (this.dest.getParentNode() instanceof org.w3c.dom.Element)) {
                this.dest = (org.w3c.dom.Element) this.dest.getParentNode();
            }
        }

        private void copyAttributes(Node source, org.w3c.dom.Element el) {
            Iterator<Attribute> it = source.attributes().iterator();
            while (it.hasNext()) {
                Attribute attribute = it.next();
                el.setAttribute(attribute.getKey(), attribute.getValue());
            }
        }
    }

    public String asString(Document doc) {
        try {
            DOMSource domSource = new DOMSource(doc);
            StringWriter writer = new StringWriter();
            StreamResult result = new StreamResult(writer);
            TransformerFactory tf = TransformerFactory.newInstance();
            Transformer transformer = tf.newTransformer();
            transformer.transform(domSource, result);
            return writer.toString();
        } catch (TransformerException e) {
            throw new IllegalStateException(e);
        }
    }
}
