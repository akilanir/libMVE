package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NoEscapeBlock.class */
class NoEscapeBlock extends TemplateElement {
    NoEscapeBlock(TemplateElement nestedBlock) {
        this.nestedBlock = nestedBlock;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visit(this.nestedBlock);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            return new StringBuffer().append("<").append(getNodeTypeSymbol()).append('>').append(this.nestedBlock.getCanonicalForm()).append("</").append(getNodeTypeSymbol()).append('>').toString();
        }
        return getNodeTypeSymbol();
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

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#noescape";
    }
}
