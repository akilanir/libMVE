package org.simpleframework.xml.filter;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/filter/EnvironmentFilter.class */
public class EnvironmentFilter implements Filter {
    private Filter filter;

    public EnvironmentFilter() {
        this(null);
    }

    public EnvironmentFilter(Filter filter) {
        this.filter = filter;
    }

    @Override // org.simpleframework.xml.filter.Filter
    public String replace(String text) {
        String value = System.getenv(text);
        if (value != null) {
            return value;
        }
        if (this.filter != null) {
            return this.filter.replace(text);
        }
        return null;
    }
}
