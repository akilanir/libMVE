package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/RecoveryBlock.class */
final class RecoveryBlock extends TemplateElement {
    RecoveryBlock(TemplateElement block) {
        this.nestedBlock = block;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visitByHiddingParent(this.nestedBlock);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            StringBuffer buf = new StringBuffer();
            buf.append('<').append(getNodeTypeSymbol()).append('>');
            if (this.nestedBlock != null) {
                buf.append(this.nestedBlock.getCanonicalForm());
            }
            buf.append("</").append(getNodeTypeSymbol()).append('>');
            return buf.toString();
        }
        return getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#recover";
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
