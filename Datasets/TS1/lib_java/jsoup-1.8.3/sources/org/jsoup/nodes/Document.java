package org.jsoup.nodes;

import java.nio.charset.Charset;
import java.nio.charset.CharsetEncoder;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jsoup.helper.StringUtil;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Entities;
import org.jsoup.parser.Tag;
import org.jsoup.select.Elements;

/* loaded from: jsoup-1.8.3.jar:org/jsoup/nodes/Document.class */
public class Document extends Element {
    private OutputSettings outputSettings;
    private QuirksMode quirksMode;
    private String location;
    private boolean updateMetaCharset;

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/nodes/Document$QuirksMode.class */
    public enum QuirksMode {
        noQuirks,
        quirks,
        limitedQuirks
    }

    public Document(String baseUri) {
        super(Tag.valueOf("#root"), baseUri);
        this.outputSettings = new OutputSettings();
        this.quirksMode = QuirksMode.noQuirks;
        this.updateMetaCharset = false;
        this.location = baseUri;
    }

    public static Document createShell(String baseUri) {
        Validate.notNull(baseUri);
        Document doc = new Document(baseUri);
        Element html = doc.appendElement("html");
        html.appendElement("head");
        html.appendElement("body");
        return doc;
    }

    public String location() {
        return this.location;
    }

    public Element head() {
        return findFirstElementByTagName("head", this);
    }

    public Element body() {
        return findFirstElementByTagName("body", this);
    }

    public String title() {
        Element titleEl = getElementsByTag("title").first();
        return titleEl != null ? StringUtil.normaliseWhitespace(titleEl.text()).trim() : "";
    }

    public void title(String title) {
        Validate.notNull(title);
        Element titleEl = getElementsByTag("title").first();
        if (titleEl == null) {
            head().appendElement("title").text(title);
        } else {
            titleEl.text(title);
        }
    }

    public Element createElement(String tagName) {
        return new Element(Tag.valueOf(tagName), baseUri());
    }

    public Document normalise() {
        Element htmlEl = findFirstElementByTagName("html", this);
        if (htmlEl == null) {
            htmlEl = appendElement("html");
        }
        if (head() == null) {
            htmlEl.prependElement("head");
        }
        if (body() == null) {
            htmlEl.appendElement("body");
        }
        normaliseTextNodes(head());
        normaliseTextNodes(htmlEl);
        normaliseTextNodes(this);
        normaliseStructure("head", htmlEl);
        normaliseStructure("body", htmlEl);
        ensureMetaCharsetElement();
        return this;
    }

    private void normaliseTextNodes(Element element) {
        List<Node> toMove = new ArrayList<>();
        for (Node node : element.childNodes) {
            if (node instanceof TextNode) {
                TextNode tn = (TextNode) node;
                if (!tn.isBlank()) {
                    toMove.add(tn);
                }
            }
        }
        for (int i = toMove.size() - 1; i >= 0; i--) {
            Node node2 = toMove.get(i);
            element.removeChild(node2);
            body().prependChild(new TextNode(" ", ""));
            body().prependChild(node2);
        }
    }

    private void normaliseStructure(String tag, Element htmlEl) {
        Elements elements = getElementsByTag(tag);
        Element master = elements.first();
        if (elements.size() > 1) {
            List<Node> toMove = new ArrayList<>();
            for (int i = 1; i < elements.size(); i++) {
                Node dupe = elements.get(i);
                for (Node node : dupe.childNodes) {
                    toMove.add(node);
                }
                dupe.remove();
            }
            Iterator<Node> it = toMove.iterator();
            while (it.hasNext()) {
                master.appendChild(it.next());
            }
        }
        if (!master.parent().equals(htmlEl)) {
            htmlEl.appendChild(master);
        }
    }

    private Element findFirstElementByTagName(String tag, Node node) {
        if (node.nodeName().equals(tag)) {
            return (Element) node;
        }
        for (Node child : node.childNodes) {
            Element found = findFirstElementByTagName(tag, child);
            if (found != null) {
                return found;
            }
        }
        return null;
    }

    @Override // org.jsoup.nodes.Node
    public String outerHtml() {
        return super.html();
    }

    @Override // org.jsoup.nodes.Element
    public Element text(String text) {
        body().text(text);
        return this;
    }

    @Override // org.jsoup.nodes.Element, org.jsoup.nodes.Node
    public String nodeName() {
        return "#document";
    }

    public void charset(Charset charset) {
        updateMetaCharsetElement(true);
        this.outputSettings.charset(charset);
        ensureMetaCharsetElement();
    }

    public Charset charset() {
        return this.outputSettings.charset();
    }

    public void updateMetaCharsetElement(boolean update) {
        this.updateMetaCharset = update;
    }

    public boolean updateMetaCharsetElement() {
        return this.updateMetaCharset;
    }

    @Override // org.jsoup.nodes.Element, org.jsoup.nodes.Node
    /* renamed from: clone */
    public Document mo7clone() {
        Document clone = (Document) super.mo7clone();
        clone.outputSettings = this.outputSettings.m8clone();
        return clone;
    }

    private void ensureMetaCharsetElement() {
        if (this.updateMetaCharset) {
            OutputSettings.Syntax syntax = outputSettings().syntax();
            if (syntax == OutputSettings.Syntax.html) {
                Element metaCharset = select("meta[charset]").first();
                if (metaCharset != null) {
                    metaCharset.attr("charset", charset().displayName());
                } else {
                    Element head = head();
                    if (head != null) {
                        head.appendElement("meta").attr("charset", charset().displayName());
                    }
                }
                select("meta[name=charset]").remove();
                return;
            }
            if (syntax == OutputSettings.Syntax.xml) {
                Node node = childNodes().get(0);
                if (node instanceof XmlDeclaration) {
                    XmlDeclaration decl = (XmlDeclaration) node;
                    if (decl.attr("declaration").equals("xml")) {
                        decl.attr("encoding", charset().displayName());
                        String version = decl.attr("version");
                        if (version != null) {
                            decl.attr("version", "1.0");
                            return;
                        }
                        return;
                    }
                    XmlDeclaration decl2 = new XmlDeclaration("xml", this.baseUri, false);
                    decl2.attr("version", "1.0");
                    decl2.attr("encoding", charset().displayName());
                    prependChild(decl2);
                    return;
                }
                XmlDeclaration decl3 = new XmlDeclaration("xml", this.baseUri, false);
                decl3.attr("version", "1.0");
                decl3.attr("encoding", charset().displayName());
                prependChild(decl3);
            }
        }
    }

    /* loaded from: jsoup-1.8.3.jar:org/jsoup/nodes/Document$OutputSettings.class */
    public static class OutputSettings implements Cloneable {
        private Entities.EscapeMode escapeMode = Entities.EscapeMode.base;
        private Charset charset = Charset.forName("UTF-8");
        private CharsetEncoder charsetEncoder = this.charset.newEncoder();
        private boolean prettyPrint = true;
        private boolean outline = false;
        private int indentAmount = 1;
        private Syntax syntax = Syntax.html;

        /* loaded from: jsoup-1.8.3.jar:org/jsoup/nodes/Document$OutputSettings$Syntax.class */
        public enum Syntax {
            html,
            xml
        }

        public Entities.EscapeMode escapeMode() {
            return this.escapeMode;
        }

        public OutputSettings escapeMode(Entities.EscapeMode escapeMode) {
            this.escapeMode = escapeMode;
            return this;
        }

        public Charset charset() {
            return this.charset;
        }

        public OutputSettings charset(Charset charset) {
            this.charset = charset;
            this.charsetEncoder = charset.newEncoder();
            return this;
        }

        public OutputSettings charset(String charset) {
            charset(Charset.forName(charset));
            return this;
        }

        CharsetEncoder encoder() {
            return this.charsetEncoder;
        }

        public Syntax syntax() {
            return this.syntax;
        }

        public OutputSettings syntax(Syntax syntax) {
            this.syntax = syntax;
            return this;
        }

        public boolean prettyPrint() {
            return this.prettyPrint;
        }

        public OutputSettings prettyPrint(boolean pretty) {
            this.prettyPrint = pretty;
            return this;
        }

        public boolean outline() {
            return this.outline;
        }

        public OutputSettings outline(boolean outlineMode) {
            this.outline = outlineMode;
            return this;
        }

        public int indentAmount() {
            return this.indentAmount;
        }

        public OutputSettings indentAmount(int indentAmount) {
            Validate.isTrue(indentAmount >= 0);
            this.indentAmount = indentAmount;
            return this;
        }

        /* renamed from: clone, reason: merged with bridge method [inline-methods] */
        public OutputSettings m8clone() {
            try {
                OutputSettings clone = (OutputSettings) super.clone();
                clone.charset(this.charset.name());
                clone.escapeMode = Entities.EscapeMode.valueOf(this.escapeMode.name());
                return clone;
            } catch (CloneNotSupportedException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public OutputSettings outputSettings() {
        return this.outputSettings;
    }

    public Document outputSettings(OutputSettings outputSettings) {
        Validate.notNull(outputSettings);
        this.outputSettings = outputSettings;
        return this;
    }

    public QuirksMode quirksMode() {
        return this.quirksMode;
    }

    public Document quirksMode(QuirksMode quirksMode) {
        this.quirksMode = quirksMode;
        return this;
    }
}
