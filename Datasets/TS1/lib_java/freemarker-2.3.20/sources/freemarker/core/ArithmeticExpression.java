package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ArithmeticExpression.class */
final class ArithmeticExpression extends Expression {
    static final int TYPE_SUBSTRACTION = 0;
    static final int TYPE_MULTIPLICATION = 1;
    static final int TYPE_DIVISION = 2;
    static final int TYPE_MODULO = 3;
    private static final char[] OPERATOR_IMAGES = {'-', '*', '/', '%'};
    private final Expression lho;
    private final Expression rho;
    private final int operator;

    ArithmeticExpression(Expression lho, Expression rho, int operator) {
        this.lho = lho;
        this.rho = rho;
        this.operator = operator;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        Number lhoNumber = this.lho.evalToNumber(env);
        Number rhoNumber = this.rho.evalToNumber(env);
        ArithmeticEngine ae = env != null ? env.getArithmeticEngine() : getTemplate().getArithmeticEngine();
        switch (this.operator) {
            case 0:
                return new SimpleNumber(ae.subtract(lhoNumber, rhoNumber));
            case 1:
                return new SimpleNumber(ae.multiply(lhoNumber, rhoNumber));
            case 2:
                return new SimpleNumber(ae.divide(lhoNumber, rhoNumber));
            case 3:
                return new SimpleNumber(ae.modulus(lhoNumber, rhoNumber));
            default:
                throw new _MiscTemplateException(this, new Object[]{"Unknown operation: ", new Integer(this.operator)});
        }
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.lho.getCanonicalForm()).append(' ').append(OPERATOR_IMAGES[this.operator]).append(' ').append(this.rho.getCanonicalForm()).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return String.valueOf(OPERATOR_IMAGES[this.operator]);
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.constantValue != null || (this.lho.isLiteral() && this.rho.isLiteral());
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new ArithmeticExpression(this.lho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.rho.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.operator);
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 3;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.lho;
            case 1:
                return this.rho;
            case 2:
                return new Integer(this.operator);
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.LEFT_HAND_OPERAND;
            case 1:
                return ParameterRole.RIGHT_HAND_OPERAND;
            case 2:
                return ParameterRole.AST_NODE_SUBTYPE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
