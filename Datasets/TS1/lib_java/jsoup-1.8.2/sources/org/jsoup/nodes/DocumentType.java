package org.jsoup.nodes;

import org.jsoup.helper.StringUtil;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/nodes/DocumentType.class */
public class DocumentType extends Node {
    private static final String NAME = "name";
    private static final String PUBLIC_ID = "publicId";
    private static final String SYSTEM_ID = "systemId";

    public DocumentType(String name, String publicId, String systemId, String baseUri) {
        super(baseUri);
        attr(NAME, name);
        attr(PUBLIC_ID, publicId);
        attr(SYSTEM_ID, systemId);
    }

    @Override // org.jsoup.nodes.Node
    public String nodeName() {
        return "#doctype";
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlHead(StringBuilder accum, int depth, Document.OutputSettings out) {
        if (out.syntax() == Document.OutputSettings.Syntax.html && !has(PUBLIC_ID) && !has(SYSTEM_ID)) {
            accum.append("<!doctype");
        } else {
            accum.append("<!DOCTYPE");
        }
        if (has(NAME)) {
            accum.append(" ").append(attr(NAME));
        }
        if (has(PUBLIC_ID)) {
            accum.append(" PUBLIC \"").append(attr(PUBLIC_ID)).append('\"');
        }
        if (has(SYSTEM_ID)) {
            accum.append(" \"").append(attr(SYSTEM_ID)).append('\"');
        }
        accum.append('>');
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlTail(StringBuilder accum, int depth, Document.OutputSettings out) {
    }

    private boolean has(String attribute) {
        return !StringUtil.isBlank(attr(attribute));
    }
}
