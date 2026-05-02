package org.jsoup.examples;

import java.io.IOException;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/examples/HtmlToPlainText.class */
public class HtmlToPlainText {
    private static final String userAgent = "Mozilla/5.0 (jsoup)";
    private static final int timeout = 5000;

    public static void main(String... args) throws IOException {
        Validate.isTrue(args.length == 1 || args.length == 2, "usage: java -cp jsoup.jar org.jsoup.examples.HtmlToPlainText url [selector]");
        String url = args[0];
        String selector = args.length == 2 ? args[1] : null;
        Document doc = Jsoup.connect(url).userAgent(userAgent).timeout(timeout).get();
        HtmlToPlainText formatter = new HtmlToPlainText();
        if (selector != null) {
            Elements elements = doc.select(selector);
            Iterator i$ = elements.iterator();
            while (i$.hasNext()) {
                Element element = i$.next();
                String plainText = formatter.getPlainText(element);
                System.out.println(plainText);
            }
            return;
        }
        String plainText2 = formatter.getPlainText(doc);
        System.out.println(plainText2);
    }

    public String getPlainText(Element element) {
        FormattingVisitor formatter = new FormattingVisitor();
        NodeTraversor traversor = new NodeTraversor(formatter);
        traversor.traverse(element);
        return formatter.toString();
    }

    /* loaded from: jsoup-1.8.2.jar:org/jsoup/examples/HtmlToPlainText$FormattingVisitor.class */
    private class FormattingVisitor implements NodeVisitor {
        private static final int maxWidth = 80;
        private int width;
        private StringBuilder accum;

        private FormattingVisitor() {
            this.width = 0;
            this.accum = new StringBuilder();
        }

        @Override // org.jsoup.select.NodeVisitor
        public void head(Node node, int depth) {
            String name = node.nodeName();
            if (node instanceof TextNode) {
                append(((TextNode) node).text());
                return;
            }
            if (name.equals("li")) {
                append("\n * ");
            } else if (name.equals("dt")) {
                append("  ");
            } else if (StringUtil.in(name, "p", "h1", "h2", "h3", "h4", "h5", "tr")) {
                append("\n");
            }
        }

        @Override // org.jsoup.select.NodeVisitor
        public void tail(Node node, int depth) {
            String name = node.nodeName();
            if (StringUtil.in(name, "br", "dd", "dt", "p", "h1", "h2", "h3", "h4", "h5")) {
                append("\n");
            } else if (name.equals("a")) {
                append(String.format(" <%s>", node.absUrl("href")));
            }
        }

        private void append(String text) {
            if (text.startsWith("\n")) {
                this.width = 0;
            }
            if (text.equals(" ") && (this.accum.length() == 0 || StringUtil.in(this.accum.substring(this.accum.length() - 1), " ", "\n"))) {
                return;
            }
            if (text.length() + this.width > maxWidth) {
                String[] words = text.split("\\s+");
                int i = 0;
                while (i < words.length) {
                    String word = words[i];
                    boolean last = i == words.length - 1;
                    if (!last) {
                        word = word + " ";
                    }
                    if (word.length() + this.width > maxWidth) {
                        this.accum.append("\n").append(word);
                        this.width = word.length();
                    } else {
                        this.accum.append(word);
                        this.width += word.length();
                    }
                    i++;
                }
                return;
            }
            this.accum.append(text);
            this.width += text.length();
        }

        public String toString() {
            return this.accum.toString();
        }
    }
}
