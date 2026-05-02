package org.jsoup.select;

import org.jsoup.nodes.Node;

/* loaded from: jsoup-1.7.3.jar:org/jsoup/select/NodeVisitor.class */
public interface NodeVisitor {
    void head(Node node, int i);

    void tail(Node node, int i);
}
