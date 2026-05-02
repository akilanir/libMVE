package org.jsoup.select;

import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/select/Collector.class */
public class Collector {
    private Collector() {
    }

    public static Elements collect(Evaluator eval, Element root) {
        Elements elements = new Elements();
        new NodeTraversor(new Accumulator(root, elements, eval)).traverse(root);
        return elements;
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/select/Collector$Accumulator.class */
    private static class Accumulator implements NodeVisitor {
        private final Element root;
        private final Elements elements;
        private final Evaluator eval;

        Accumulator(Element root, Elements elements, Evaluator eval) {
            this.root = root;
            this.elements = elements;
            this.eval = eval;
        }

        @Override // org.jsoup.select.NodeVisitor
        public void head(Node node, int depth) {
            if (node instanceof Element) {
                Element el = (Element) node;
                if (this.eval.matches(this.root, el)) {
                    this.elements.add(el);
                }
            }
        }

        @Override // org.jsoup.select.NodeVisitor
        public void tail(Node node, int depth) {
        }
    }
}
