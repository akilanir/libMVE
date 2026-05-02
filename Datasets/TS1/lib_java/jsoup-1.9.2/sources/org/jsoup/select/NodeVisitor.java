package org.jsoup.select;

import org.jsoup.nodes.Node;

/* loaded from: jsoup-1.9.2.jar:org/jsoup/select/NodeVisitor.class */
public interface NodeVisitor {
    void head(Node node, int i);

    void tail(Node node, int i);
}
