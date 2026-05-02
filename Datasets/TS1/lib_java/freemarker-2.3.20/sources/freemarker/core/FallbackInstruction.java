package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/FallbackInstruction.class */
final class FallbackInstruction extends TemplateElement {
    FallbackInstruction() {
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws IOException, TemplateException {
        env.fallback();
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        return canonical ? new StringBuffer().append("<").append(getNodeTypeSymbol()).append("/>").toString() : getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#fallback";
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
}
