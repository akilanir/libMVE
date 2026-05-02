package ezvcard.io.html;

import ezvcard.util.HtmlUtils;
import ezvcard.util.StringUtils;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.TextNode;
import org.jsoup.select.Elements;

/* loaded from: ez-vcard-0.9.6.jar:ezvcard/io/html/HCardElement.class */
public class HCardElement {
    private final Element element;

    public HCardElement(Element element) {
        this.element = element;
    }

    public String tagName() {
        return this.element.tagName();
    }

    public String attr(String name) {
        return this.element.attr(name);
    }

    public String absUrl(String name) {
        String url = this.element.absUrl(name);
        if (url.length() == 0) {
            url = this.element.attr(name);
        }
        return url;
    }

    public Set<String> classNames() {
        return this.element.classNames();
    }

    public String value() {
        return value(this.element);
    }

    public String firstValue(String cssClass) {
        Elements elements = this.element.getElementsByClass(cssClass);
        if (elements.isEmpty()) {
            return null;
        }
        return value(elements.first());
    }

    public List<String> allValues(String cssClass) {
        Elements elements = this.element.getElementsByClass(cssClass);
        List<String> values = new ArrayList<>(elements.size());
        Iterator i$ = elements.iterator();
        while (i$.hasNext()) {
            Element element = (Element) i$.next();
            values.add(value(element));
        }
        return values;
    }

    public List<String> types() {
        List<String> types = allValues("type");
        List<String> lowerCaseTypes = new ArrayList<>(types.size());
        for (String type : types) {
            lowerCaseTypes.add(type.toLowerCase());
        }
        return lowerCaseTypes;
    }

    public void append(String text) {
        boolean first = true;
        String[] lines = text.split("\\r\\n|\\n|\\r");
        for (String line : lines) {
            if (!first) {
                this.element.appendElement("br");
            }
            if (line.length() > 0) {
                this.element.appendText(line);
            }
            first = false;
        }
    }

    public Element getElement() {
        return this.element;
    }

    private String value(Element element) {
        if ("abbr".equals(element.tagName())) {
            String title = element.attr("title");
            if (title.length() > 0) {
                return title;
            }
        }
        StringBuilder value = new StringBuilder();
        Elements valueElements = element.getElementsByClass("value");
        if (valueElements.isEmpty()) {
            visitForValue(element, value);
        } else {
            Iterator i$ = valueElements.iterator();
            while (i$.hasNext()) {
                Element valueElement = (Element) i$.next();
                if (!HtmlUtils.isChildOf(valueElement, valueElements)) {
                    if ("abbr".equals(valueElement.tagName())) {
                        String title2 = valueElement.attr("title");
                        if (title2.length() > 0) {
                            value.append(title2);
                        }
                    }
                    visitForValue(valueElement, value);
                }
            }
        }
        return value.toString().trim();
    }

    private void visitForValue(Element element, StringBuilder value) {
        for (TextNode textNode : element.childNodes()) {
            if (textNode instanceof Element) {
                Element e = (Element) textNode;
                if (!e.classNames().contains("type")) {
                    if ("br".equals(e.tagName())) {
                        value.append(StringUtils.NEWLINE);
                    } else if (!"del".equals(e.tagName())) {
                        visitForValue(e, value);
                    }
                }
            } else if (textNode instanceof TextNode) {
                TextNode t = textNode;
                value.append(t.text());
            }
        }
    }
}
