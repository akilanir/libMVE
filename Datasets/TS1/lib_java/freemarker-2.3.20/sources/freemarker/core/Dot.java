package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.TemplateException;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Dot.class */
final class Dot extends Expression {
    private final Expression target;
    private final String key;

    Dot(Expression target, String key) {
        this.target = target;
        this.key = key;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        TemplateModel leftModel = this.target.eval(env);
        if (leftModel instanceof TemplateHashModel) {
            return ((TemplateHashModel) leftModel).get(this.key);
        }
        if (leftModel == null && env.isClassicCompatible()) {
            return null;
        }
        throw new UnexpectedTypeException(this.target, leftModel, "hash", env);
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return new StringBuffer().append(this.target.getCanonicalForm()).append(getNodeTypeSymbol()).append(this.key).toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return ".";
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return this.target.isLiteral();
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new Dot(this.target.deepCloneWithIdentifierReplaced(replacedIdentifier, replacement, replacementState), this.key);
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        return idx == 0 ? this.target : this.key;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        return ParameterRole.forBinaryOperatorOperand(idx);
    }

    boolean onlyHasIdentifiers() {
        return (this.target instanceof Identifier) || ((this.target instanceof Dot) && ((Dot) this.target).onlyHasIdentifiers());
    }
}
