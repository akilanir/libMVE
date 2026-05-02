package org.jsoup.select;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Element;
import org.jsoup.nodes.FormElement;

/* loaded from: jsoup-1.8.2.jar:org/jsoup/select/Elements.class */
public class Elements extends ArrayList<Element> {
    public Elements() {
    }

    public Elements(int initialCapacity) {
        super(initialCapacity);
    }

    public Elements(Collection<Element> elements) {
        super(elements);
    }

    public Elements(List<Element> elements) {
        super(elements);
    }

    public Elements(Element... elements) {
        super(Arrays.asList(elements));
    }

    @Override // java.util.ArrayList
    public Elements clone() {
        Elements clone = new Elements(size());
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element e = i$.next();
            clone.add(e.mo7clone());
        }
        return clone;
    }

    public String attr(String attributeKey) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (element.hasAttr(attributeKey)) {
                return element.attr(attributeKey);
            }
        }
        return "";
    }

    public boolean hasAttr(String attributeKey) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (element.hasAttr(attributeKey)) {
                return true;
            }
        }
        return false;
    }

    public Elements attr(String attributeKey, String attributeValue) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.attr(attributeKey, attributeValue);
        }
        return this;
    }

    public Elements removeAttr(String attributeKey) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.removeAttr(attributeKey);
        }
        return this;
    }

    public Elements addClass(String className) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.addClass(className);
        }
        return this;
    }

    public Elements removeClass(String className) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.removeClass(className);
        }
        return this;
    }

    public Elements toggleClass(String className) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.toggleClass(className);
        }
        return this;
    }

    public boolean hasClass(String className) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (element.hasClass(className)) {
                return true;
            }
        }
        return false;
    }

    public String val() {
        if (size() > 0) {
            return first().val();
        }
        return "";
    }

    public Elements val(String value) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.val(value);
        }
        return this;
    }

    public String text() {
        StringBuilder sb = new StringBuilder();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (sb.length() != 0) {
                sb.append(" ");
            }
            sb.append(element.text());
        }
        return sb.toString();
    }

    public boolean hasText() {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (element.hasText()) {
                return true;
            }
        }
        return false;
    }

    public String html() {
        StringBuilder sb = new StringBuilder();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (sb.length() != 0) {
                sb.append("\n");
            }
            sb.append(element.html());
        }
        return sb.toString();
    }

    public String outerHtml() {
        StringBuilder sb = new StringBuilder();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            if (sb.length() != 0) {
                sb.append("\n");
            }
            sb.append(element.outerHtml());
        }
        return sb.toString();
    }

    @Override // java.util.AbstractCollection
    public String toString() {
        return outerHtml();
    }

    public Elements tagName(String tagName) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.tagName(tagName);
        }
        return this;
    }

    public Elements html(String html) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.html(html);
        }
        return this;
    }

    public Elements prepend(String html) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.prepend(html);
        }
        return this;
    }

    public Elements append(String html) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.append(html);
        }
        return this;
    }

    public Elements before(String html) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.before(html);
        }
        return this;
    }

    public Elements after(String html) {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.after(html);
        }
        return this;
    }

    public Elements wrap(String html) {
        Validate.notEmpty(html);
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.wrap(html);
        }
        return this;
    }

    public Elements unwrap() {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.unwrap();
        }
        return this;
    }

    public Elements empty() {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.empty();
        }
        return this;
    }

    public Elements remove() {
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element element = i$.next();
            element.remove();
        }
        return this;
    }

    public Elements select(String query) {
        return Selector.select(query, this);
    }

    public Elements not(String query) {
        Elements out = Selector.select(query, this);
        return Selector.filterOut(this, out);
    }

    public Elements eq(int index) {
        return size() > index ? new Elements(get(index)) : new Elements();
    }

    public boolean is(String query) {
        Elements children = select(query);
        return !children.isEmpty();
    }

    public Elements parents() {
        HashSet<Element> combo = new LinkedHashSet<>();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element e = i$.next();
            combo.addAll(e.parents());
        }
        return new Elements(combo);
    }

    public Element first() {
        if (isEmpty()) {
            return null;
        }
        return get(0);
    }

    public Element last() {
        if (isEmpty()) {
            return null;
        }
        return get(size() - 1);
    }

    public Elements traverse(NodeVisitor nodeVisitor) {
        Validate.notNull(nodeVisitor);
        NodeTraversor traversor = new NodeTraversor(nodeVisitor);
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element el = i$.next();
            traversor.traverse(el);
        }
        return this;
    }

    public List<FormElement> forms() {
        ArrayList<FormElement> forms = new ArrayList<>();
        Iterator i$ = iterator();
        while (i$.hasNext()) {
            Element el = i$.next();
            if (el instanceof FormElement) {
                forms.add((FormElement) el);
            }
        }
        return forms;
    }
}
