package org.jsoup.select;

import java.util.ArrayList;
import java.util.Collection;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.List;
import org.jsoup.helper.Validate;
import org.jsoup.nodes.Element;

/* loaded from: jsoup-1.9.1.jar:org/jsoup/select/Selector.class */
public class Selector {
    private final Evaluator evaluator;
    private final Element root;

    private Selector(String query, Element root) {
        Validate.notNull(query);
        String query2 = query.trim();
        Validate.notEmpty(query2);
        Validate.notNull(root);
        this.evaluator = QueryParser.parse(query2);
        this.root = root;
    }

    private Selector(Evaluator evaluator, Element root) {
        Validate.notNull(evaluator);
        Validate.notNull(root);
        this.evaluator = evaluator;
        this.root = root;
    }

    public static Elements select(String query, Element root) {
        return new Selector(query, root).select();
    }

    public static Elements select(Evaluator evaluator, Element root) {
        return new Selector(evaluator, root).select();
    }

    public static Elements select(String query, Iterable<Element> roots) {
        Validate.notEmpty(query);
        Validate.notNull(roots);
        Evaluator evaluator = QueryParser.parse(query);
        ArrayList<Element> elements = new ArrayList<>();
        IdentityHashMap<Element, Boolean> seenElements = new IdentityHashMap<>();
        for (Element root : roots) {
            Elements found = select(evaluator, root);
            Iterator<Element> it = found.iterator();
            while (it.hasNext()) {
                Element el = it.next();
                if (!seenElements.containsKey(el)) {
                    elements.add(el);
                    seenElements.put(el, Boolean.TRUE);
                }
            }
        }
        return new Elements((List<Element>) elements);
    }

    private Elements select() {
        return Collector.collect(this.evaluator, this.root);
    }

    static Elements filterOut(Collection<Element> elements, Collection<Element> outs) {
        Elements output = new Elements();
        for (Element el : elements) {
            boolean found = false;
            Iterator<Element> it = outs.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                Element out = it.next();
                if (el.equals(out)) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                output.add(el);
            }
        }
        return output;
    }

    /* loaded from: jsoup-1.9.1.jar:org/jsoup/select/Selector$SelectorParseException.class */
    public static class SelectorParseException extends IllegalStateException {
        public SelectorParseException(String msg, Object... params) {
            super(String.format(msg, params));
        }
    }
}
