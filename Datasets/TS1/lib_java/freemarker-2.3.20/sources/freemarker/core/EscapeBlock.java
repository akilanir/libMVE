package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/EscapeBlock.class */
class EscapeBlock extends TemplateElement {
    private final String variable;
    private final Expression expr;
    private Expression escapedExpr;

    EscapeBlock(String variable, Expression expr, Expression escapedExpr) {
        this.variable = variable;
        this.expr = expr;
        this.escapedExpr = escapedExpr;
    }

    void setContent(TemplateElement nestedBlock) {
        this.nestedBlock = nestedBlock;
        this.escapedExpr = null;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visit(this.nestedBlock);
        }
    }

    Expression doEscape(Expression expression) {
        return this.escapedExpr.deepCloneWithIdentifierReplaced(this.variable, expression, new Expression.ReplacemenetState());
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol()).append(' ').append(this.variable).append(" as ").append(this.expr.getCanonicalForm());
        if (canonical) {
            sb.append('>').append(this.nestedBlock.getCanonicalForm()).append("</").append(getNodeTypeSymbol()).append('>');
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#escape";
    }

    @Override // freemarker.core.TemplateElement
    boolean isShownInStackTrace() {
        return false;
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.variable;
            case 1:
                return this.expr;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.PLACEHOLDER_VARIABLE;
            case 1:
                return ParameterRole.EXPRESSION_TEMPLATE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
