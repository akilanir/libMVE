package org.simpleframework.xml.core;

import org.simpleframework.xml.filter.Filter;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/TemplateFilter.class */
class TemplateFilter implements Filter {
    private Context context;
    private Filter filter;

    public TemplateFilter(Context context, Filter filter) {
        this.context = context;
        this.filter = filter;
    }

    @Override // org.simpleframework.xml.filter.Filter
    public String replace(String name) {
        Object value = this.context.getAttribute(name);
        if (value != null) {
            return value.toString();
        }
        return this.filter.replace(name);
    }
}
