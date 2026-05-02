package org.jsoup.nodes;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.helper.HttpConnection;
import org.jsoup.helper.Validate;
import org.jsoup.parser.Tag;
import org.jsoup.select.Elements;

/* loaded from: jsoup-1.8.1.jar:org/jsoup/nodes/FormElement.class */
public class FormElement extends Element {
    private final Elements elements;

    public FormElement(Tag tag, String baseUri, Attributes attributes) {
        super(tag, baseUri, attributes);
        this.elements = new Elements();
    }

    public Elements elements() {
        return this.elements;
    }

    public FormElement addElement(Element element) {
        this.elements.add(element);
        return this;
    }

    public Connection submit() {
        String action = hasAttr("action") ? absUrl("action") : baseUri();
        Validate.notEmpty(action, "Could not determine a form action URL for submit. Ensure you set a base URI when parsing.");
        Connection.Method method = attr("method").toUpperCase().equals("POST") ? Connection.Method.POST : Connection.Method.GET;
        Connection con = Jsoup.connect(action).data(formData()).method(method);
        return con;
    }

    public List<Connection.KeyVal> formData() {
        ArrayList<Connection.KeyVal> data = new ArrayList<>();
        Iterator i$ = this.elements.iterator();
        while (i$.hasNext()) {
            Element el = i$.next();
            if (el.tag().isFormSubmittable()) {
                String name = el.attr("name");
                if (name.length() != 0) {
                    if ("select".equals(el.tagName())) {
                        Elements options = el.select("option[selected]");
                        Iterator i$2 = options.iterator();
                        while (i$2.hasNext()) {
                            Element option = i$2.next();
                            data.add(HttpConnection.KeyVal.create(name, option.val()));
                        }
                    } else {
                        data.add(HttpConnection.KeyVal.create(name, el.val()));
                    }
                }
            }
        }
        return data;
    }

    @Override // org.jsoup.nodes.Element, org.jsoup.nodes.Node
    public boolean equals(Object o) {
        return super.equals(o);
    }
}
