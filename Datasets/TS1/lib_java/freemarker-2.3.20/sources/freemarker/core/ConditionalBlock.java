package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ConditionalBlock.class */
final class ConditionalBlock extends TemplateElement {
    static final int TYPE_IF = 0;
    static final int TYPE_ELSE = 1;
    static final int TYPE_ELSE_IF = 2;
    final Expression condition;
    private final int type;
    boolean isLonelyIf;

    ConditionalBlock(Expression condition, TemplateElement nestedBlock, int type) {
        this.condition = condition;
        this.nestedBlock = nestedBlock;
        this.type = type;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if ((this.condition == null || this.condition.evalToBoolean(env)) && this.nestedBlock != null) {
            env.visitByHiddingParent(this.nestedBlock);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(getNodeTypeSymbol());
        if (this.condition != null) {
            buf.append(' ');
            buf.append(this.condition.getCanonicalForm());
        }
        if (canonical) {
            buf.append(">");
            if (this.nestedBlock != null) {
                buf.append(this.nestedBlock.getCanonicalForm());
            }
            if (this.isLonelyIf) {
                buf.append("</#if>");
            }
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        if (this.type == 1) {
            return "#else";
        }
        if (this.type == 0) {
            return "#if";
        }
        if (this.type == 2) {
            return "#elseif";
        }
        throw new RuntimeException("Unknown type");
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
                return new Integer(this.type);
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
