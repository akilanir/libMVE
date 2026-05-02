package freemarker.core;

import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/FlushInstruction.class */
final class FlushInstruction extends TemplateElement {
    FlushInstruction() {
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws IOException {
        env.getOut().flush();
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        return canonical ? new StringBuffer().append("<").append(getNodeTypeSymbol()).append("/>").toString() : getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#flush";
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
