package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/DollarVariable.class */
final class DollarVariable extends TemplateElement {
    private final Expression expression;
    private final Expression escapedExpression;

    DollarVariable(Expression expression, Expression escapedExpression) {
        this.expression = expression;
        this.escapedExpression = escapedExpression;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        env.getOut().write(this.escapedExpression.evalAndCoerceToString(env));
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        sb.append("${");
        sb.append(this.expression.getCanonicalForm());
        sb.append("}");
        if (!canonical && this.expression != this.escapedExpression) {
            sb.append(" auto-escaped");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "${...}";
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsOpeningWhitespace() {
        return true;
    }

    @Override // freemarker.core.TemplateElement
    boolean heedsTrailingWhitespace() {
        return true;
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
        return this.expression;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.CONTENT;
    }
}
