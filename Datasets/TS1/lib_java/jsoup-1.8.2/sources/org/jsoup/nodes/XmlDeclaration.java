package org.jsoup.nodes;

import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/nodes/XmlDeclaration.class */
public class XmlDeclaration extends Node {
    static final String DECL_KEY = "declaration";
    private final boolean isProcessingInstruction;

    public XmlDeclaration(String data, String baseUri, boolean isProcessingInstruction) {
        super(baseUri);
        this.attributes.put(DECL_KEY, data);
        this.isProcessingInstruction = isProcessingInstruction;
    }

    @Override // org.jsoup.nodes.Node
    public String nodeName() {
        return "#declaration";
    }

    public String getWholeDeclaration() {
        String decl = this.attributes.get(DECL_KEY);
        if (decl.equals("xml") && this.attributes.size() > 1) {
            StringBuilder sb = new StringBuilder(decl);
            String version = this.attributes.get("version");
            if (version != null) {
                sb.append(" version=\"").append(version).append("\"");
            }
            String encoding = this.attributes.get("encoding");
            if (encoding != null) {
                sb.append(" encoding=\"").append(encoding).append("\"");
            }
            return sb.toString();
        }
        return this.attributes.get(DECL_KEY);
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlHead(StringBuilder accum, int depth, Document.OutputSettings out) {
        accum.append("<").append(this.isProcessingInstruction ? "!" : "?").append(getWholeDeclaration()).append(">");
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlTail(StringBuilder accum, int depth, Document.OutputSettings out) {
    }

    @Override // org.jsoup.nodes.Node
    public String toString() {
        return outerHtml();
    }
}
