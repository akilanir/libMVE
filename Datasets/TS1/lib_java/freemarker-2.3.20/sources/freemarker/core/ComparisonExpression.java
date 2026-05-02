package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ComparisonExpression.class */
final class ComparisonExpression extends BooleanExpression {
    private final Expression left;
    private final Expression right;
    private final int operation;
    private final String opString;

    ComparisonExpression(Expression left, Expression right, String opString) {
        this.left = left;
        this.right = right;
        String opString2 = opString.intern();
        this.opString = opString2;
        if (opString2 == "==" || opString2 == "=") {
            this.operation = 1;
            return;
        }
        if (opString2 == "!=") {
            this.operation = 2;
            return;
        }
        if (opString2 == "gt" || opString2 == "\\gt" || opString2 == ">" || opString2 == "&gt;") {
            this.operation = 4;
            return;
        }
        if (opString2 == "gte" || opString2 == "\\gte" || opString2 == ">=" || opString2 == "&gt;=") {
            this.operation = 6;
            return;
        }
        if (opString2 == "lt" || opString2 == "\\lt" || opString2 == "<" || opString2 == "&lt;") {
            this.operation = 3;
        } else {
            if (opString2 == "lte" || opString2 == "\\lte" || opString2 == "<=" || opString2 == "&lt;=") {
                this.operation = 5;
                return;
            }
            throw new RuntimeException(new StringBuffer().append("Unknown comparison operator ").append(opString2).toString());
        }
    }

    @Override // freemarker.core.Expression
    boolean evalToBoolean(Environment env) throws TemplateException {
        return EvalUtil.compare(this.left, this.operation, this.opString, this.right, this, env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.left.getCanonicalForm()).append(' ').append(this.opString).append(' ').append(this.right.getCanonicalForm()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return this.opString;
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.constantValue != null || (this.left.isLiteral() && this.right.isLiteral());
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new ComparisonExpression(this.left.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.right.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.opString);
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        return idx == 0 ? this.left : this.right;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return ParameterRole.forBinaryOperatorOperand(idx);
    }
}
