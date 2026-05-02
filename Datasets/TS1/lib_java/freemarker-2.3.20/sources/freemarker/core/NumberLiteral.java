package freemarker.core;

import freemarker.core.Expression;
import freemarker.template.SimpleNumber;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNumberModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/NumberLiteral.class */
final class NumberLiteral extends Expression implements TemplateNumberModel {
    private final Number value;

    public NumberLiteral(Number value) {
        this.value = value;
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) {
        return new SimpleNumber(this.value);
    }

    @Override // freemarker.core.Expression
    public String evalAndCoerceToString(Environment env) {
        return env.formatNumber(this.value);
    }

    @Override // freemarker.template.TemplateNumberModel
    public Number getAsNumber() {
        return this.value;
    }

    String getName() {
        return new StringBuffer().append("the number: '").append(this.value).append("'").toString();
    }

    @Override // freemarker.core.TemplateObject
    public String getCanonicalForm() {
        return this.value.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return getCanonicalForm();
    }

    @Override // freemarker.core.Expression
    boolean isLiteral() {
        return true;
    }

    @Override // freemarker.core.Expression
    protected Expression deepCloneWithIdentifierReplaced_inner(String replacedIdentifier, Expression replacement, Expression.ReplacemenetState replacementState) {
        return new NumberLiteral(this.value);
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
}
