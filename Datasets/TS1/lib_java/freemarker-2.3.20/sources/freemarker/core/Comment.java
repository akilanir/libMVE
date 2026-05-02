package freemarker.core;

import freemarker.template.utility.StringUtil;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Comment.class */
public final class Comment extends TemplateElement {
    private final String text;

    Comment(String text) {
        this.text = text;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) {
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            return new StringBuffer().append("<#--").append(this.text).append("-->").toString();
        }
        return new StringBuffer().append("comment ").append(StringUtil.jQuote(this.text.trim())).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#--...--";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return this.text;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.CONTENT;
    }

    public String getText() {
        return this.text;
    }
}
