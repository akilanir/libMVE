package org.simpleframework.xml.filter;

import java.util.Stack;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/filter/StackFilter.class */
public class StackFilter implements Filter {
    private Stack<Filter> stack = new Stack<>();

    public void push(Filter filter) {
        this.stack.push(filter);
    }

    @Override // org.simpleframework.xml.filter.Filter
    public String replace(String text) {
        String value;
        int i = this.stack.size();
        do {
            i--;
            if (i >= 0) {
                value = this.stack.get(i).replace(text);
            } else {
                return null;
            }
        } while (value == null);
        return value;
    }
}
