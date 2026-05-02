package org.jsoup.examples;

import java.io.IOException;
import org.jsoup.Jsoup;
import org.jsoup.helper.StringUtil;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.Node;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.NodeTraversor;
import org.jsoup.select.NodeVisitor;

/* loaded from: jsoup-1.8.1.jar:org/jsoup/examples/HtmlToPlainText.class */
public class HtmlToPlainText {
    public static void main(String... args) throws IOException {
        Validate.isTrue(args.length == 1, "usage: supply url to fetch");
        String url = args[0];
        Document doc = Jsoup.connect(url).get();
        HtmlToPlainText formatter = new HtmlToPlainText();
        String plainText = formatter.getPlainText(doc);
        System.out.println(plainText);
    }

    public String getPlainText(Element element) {
        FormattingVisitor formatter = new FormattingVisitor();
        NodeTraversor traversor = new NodeTraversor(formatter);
        traversor.traverse(element);
        return formatter.toString();
    }

    /* loaded from: jsoup-1.8.1.jar:org/jsoup/examples/HtmlToPlainText$FormattingVisitor.class */
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
            } else if (name.equals("li")) {
                append("\n * ");
            }
        }

        @Override // org.jsoup.select.NodeVisitor
        public void tail(Node node, int depth) {
            String name = node.nodeName();
            if (name.equals("br")) {
                append("\n");
            } else if (StringUtil.in(name, "p", "h1", "h2", "h3", "h4", "h5")) {
                append("\n\n");
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
