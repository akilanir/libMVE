package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NotExpression.class */
final class NotExpression extends BooleanExpression {
    private final Expression target;

    NotExpression(Expression target) {
        this.target = target;
    }

    @Override // freemarker.core.Expression
    boolean evalToBoolean(Environment env) throws TemplateException {
        return !this.target.evalToBoolean(env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append("!").append(this.target.getCanonicalForm()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "!";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.target.isLiteral();
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new NotExpression(this.target.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
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
        return this.target;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.RIGHT_HAND_OPERAND;
    }
}
