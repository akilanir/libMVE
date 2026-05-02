package org.simpleframework.xml.core;

import org.simpleframework.xml.filter.Filter;

/* loaded from: simple-xml-2.7.1.jar:org/simpleframework/xml/core/TemplateEngine.class */
class TemplateEngine {
    private Template source = new Template();
    private Template name = new Template();
    private Template text = new Template();
    private Filter filter;
    private int off;

    public TemplateEngine(Filter filter) {
        this.filter = filter;
    }

    public String process(String value) {
        if (value.indexOf(36) < 0) {
            return value;
        }
        try {
            this.source.append(value);
            parse();
            String template = this.text.toString();
            clear();
            return template;
        } catch (Throwable th) {
            clear();
            throw th;
        }
    }

    private void parse() {
        while (this.off < this.source.count) {
            char[] cArr = this.source.buf;
            int i = this.off;
            this.off = i + 1;
            char next = cArr[i];
            if (next == '$' && this.off < this.source.count) {
                char[] cArr2 = this.source.buf;
                int i2 = this.off;
                this.off = i2 + 1;
                if (cArr2[i2] == '{') {
                    name();
                } else {
                    this.off--;
                }
            }
            this.text.append(next);
        }
    }

    private void name() {
        while (true) {
            if (this.off >= this.source.count) {
                break;
            }
            char[] cArr = this.source.buf;
            int i = this.off;
            this.off = i + 1;
            char next = cArr[i];
            if (next == '}') {
                replace();
                break;
            }
            this.name.append(next);
        }
        if (this.name.length() > 0) {
            this.text.append("${");
            this.text.append(this.name);
        }
    }

    private void replace() {
        if (this.name.length() > 0) {
            replace(this.name);
        }
        this.name.clear();
    }

    private void replace(Template name) {
        replace(name.toString());
    }

    private void replace(String name) {
        String value = this.filter.replace(name);
        if (value == null) {
            this.text.append("${");
            this.text.append(name);
            this.text.append("}");
            return;
        }
        this.text.append(value);
    }

    public void clear() {
        this.name.clear();
        this.text.clear();
        this.source.clear();
        this.off = 0;
    }
}
