package freemarker.core;

import freemarker.template.TemplateException;
import freemarker.template.utility.StandardCompress;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/CompressedBlock.class */
final class CompressedBlock extends TemplateElement {
    CompressedBlock(TemplateElement nestedBlock) {
        this.nestedBlock = nestedBlock;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visitAndTransform(this.nestedBlock, StandardCompress.INSTANCE, null);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            String nested = this.nestedBlock != null ? this.nestedBlock.getCanonicalForm() : "";
            return new StringBuffer().append("<").append(getNodeTypeSymbol()).append(">").append(nested).append("</").append(getNodeTypeSymbol()).append(">").toString();
        }
        return getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#compress";
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
    boolean isIgnorable() {
        return this.nestedBlock == null || this.nestedBlock.isIgnorable();
    }
}
