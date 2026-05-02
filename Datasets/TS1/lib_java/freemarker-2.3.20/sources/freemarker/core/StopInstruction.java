package freemarker.core;

import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/StopInstruction.class */
final class StopInstruction extends TemplateElement {
    private Expression exp;

    StopInstruction(Expression exp) {
        this.exp = exp;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException {
        if (this.exp == null) {
            throw new StopException(env);
        }
        throw new StopException(env, this.exp.evalAndCoerceToString(env));
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        if (this.exp != null) {
            sb.append(' ');
            sb.append(this.exp.getCanonicalForm());
        }
        if (canonical) {
            sb.append("/>");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#stop";
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
        return this.exp;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.MESSAGE;
    }
}
