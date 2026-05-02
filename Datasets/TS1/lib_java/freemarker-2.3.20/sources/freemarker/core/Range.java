package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Range.class */
final class Range extends Expression {
    final Expression lho;
    final Expression rho;

    Range(Expression lho, Expression rho) {
        this.lho = lho;
        this.rho = rho;
    }

    boolean hasRho() {
        return this.rho != null;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        int min = this.lho.evalToNumber(env).intValue();
        if (this.rho != null) {
            int max = this.rho.evalToNumber(env).intValue();
            return new NumericalRange(min, max);
        }
        return new NumericalRange(min);
    }

    @Override // freemarker.core.Expression
    boolean evalToBoolean(Environment env) throws TemplateException {
        throw new NonBooleanException(this, new NumericalRange(0, 0), env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        String rhs = this.rho != null ? this.rho.getCanonicalForm() : "";
        return new StringBuffer().append(this.lho.getCanonicalForm()).append("..").append(rhs).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "..";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        boolean rightIsLiteral = this.rho == null || this.rho.isLiteral();
        return this.constantValue != null || (this.lho.isLiteral() && rightIsLiteral);
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new Range(this.lho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.rho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState));
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.lho;
            case 1:
                return this.rho;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return ParameterRole.forBinaryOperatorOperand(idx);
    }
}
