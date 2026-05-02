package org.jsoup.nodes;

import java.io.IOException;
import org.jsoup.nodes.Document;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/nodes/DataNode.class */
public class DataNode extends Node {
    private static final String DATA_KEY = "data";

    public DataNode(String data, String baseUri) {
        super(baseUri);
        this.attributes.put(DATA_KEY, data);
    }

    @Override // org.jsoup.nodes.Node
    public String nodeName() {
        return "#data";
    }

    public String getWholeData() {
        return this.attributes.get(DATA_KEY);
    }

    public DataNode setWholeData(String data) {
        this.attributes.put(DATA_KEY, data);
        return this;
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlHead(Appendable accum, int depth, Document.OutputSettings out) throws IOException {
        accum.append(getWholeData());
    }

    @Override // org.jsoup.nodes.Node
    void outerHtmlTail(Appendable accum, int depth, Document.OutputSettings out) {
    }

    @Override // org.jsoup.nodes.Node
    public String toString() {
        return outerHtml();
    }

    public static DataNode createFromEncoded(String encodedData, String baseUri) {
        String data = Entities.unescape(encodedData);
        return new DataNode(data, baseUri);
    }
}
