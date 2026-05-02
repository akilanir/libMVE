package org.jsoup.nodes;

import java.io.IOException;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/nodes/XmlDeclaration.class */
public class XmlDeclaration extends Node {
    private final String name;
    private final boolean isProcessingInstruction;

    public XmlDeclaration(String name, String baseUri, boolean isProcessingInstruction) {
        super(baseUri);
        Validate.notNull(name);
        this.name = name;
        this.isProcessingInstruction = isProcessingInstruction;
    }

    @Override // org.jsoup.nodes.Node
    public String nodeName() {
        return "#declaration";
    }

    public String name() {
        return this.name;
    }

    public String getWholeDeclaration() {
        return this.attributes.html().trim();
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlHead(Appendable accum, int depth, Document.OutputSettings out) throws IOException {
        accum.append("<").append(this.isProcessingInstruction ? "!" : "?").append(this.name);
        this.attributes.html(accum, out);
        accum.append(this.isProcessingInstruction ? "!" : "?").append(">");
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlTail(Appendable accum, int depth, Document.OutputSettings out) {
    }

    @Override // org.jsoup.nodes.Node
    public String toString() {
        return outerHtml();
    }
}
