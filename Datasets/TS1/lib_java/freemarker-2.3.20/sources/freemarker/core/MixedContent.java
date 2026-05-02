package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/MixedContent.class */
final class MixedContent extends TemplateElement {
    MixedContent() {
        this.nestedElements = new ArrayList();
    }

    void addElement(TemplateElement element) {
        this.nestedElements.add(element);
    }

    @Override // freemarker.core.TemplateElement
    TemplateElement postParseCleanup(boolean stripWhitespace) throws ParseException {
        super.postParseCleanup(stripWhitespace);
        if (this.nestedElements.size() == 1) {
            return (TemplateElement) this.nestedElements.get(0);
        }
        return this;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        for (int i = 0; i < this.nestedElements.size(); i++) {
            TemplateElement element = (TemplateElement) this.nestedElements.get(i);
            env.visit(element);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            StringBuffer buf = new StringBuffer();
            for (int i = 0; i < this.nestedElements.size(); i++) {
                TemplateElement element = (TemplateElement) this.nestedElements.get(i);
                buf.append(element.getCanonicalForm());
            }
            return buf.toString();
        }
        if (this.parent == null) {
            return "root";
        }
        return getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#mixed_content";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 0;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        throw new IndexOutOfBoundsException();
    }

    @Override // freemarker.core.TemplateElement
    boolean isShownInStackTrace() {
        return false;
    }

    @Override // freemarker.core.TemplateElement
    boolean isIgnorable() {
        return this.nestedElements == null || this.nestedElements.size() == 0;
    }
}
