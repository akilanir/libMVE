package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Case.class */
final class Case extends TemplateElement {
    final int TYPE_CASE = 0;
    final int TYPE_DEFAULT = 1;
    Expression condition;

    Case(Expression matchingValue, TemplateElement nestedBlock) {
        this.condition = matchingValue;
        this.nestedBlock = nestedBlock;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visitByHiddingParent(this.nestedBlock);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        if (this.condition != null) {
            sb.append(' ');
            sb.append(this.condition.getCanonicalForm());
        }
        if (canonical) {
            sb.append('>');
            if (this.nestedBlock != null) {
                sb.append(this.nestedBlock.getCanonicalForm());
            }
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return this.condition != null ? "#case" : "#default";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.condition;
            case 1:
                return new Integer(this.condition != null ? 0 : 1);
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.CONDITION;
            case 1:
                return ParameterRole.AST_NODE_SUBTYPE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
