package freemarker.core;

import freemarker.template.TemplateException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ReturnInstruction.class */
public final class ReturnInstruction extends TemplateElement {
    private Expression exp;

    ReturnInstruction(Expression exp) {
        this.exp = exp;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException {
        if (this.exp != null) {
            env.setLastReturnValue(this.exp.eval(env));
        }
        if (nextSibling() != null) {
            throw Return.INSTANCE;
        }
        if (!(getParent() instanceof Macro) && !(getParent().getParent() instanceof Macro)) {
            throw Return.INSTANCE;
        }
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
        return "#return";
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/ReturnInstruction$Return.class */
    public static class Return extends RuntimeException {
        static final Return INSTANCE = new Return();

        private Return() {
        }
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
        return ParameterRole.VALUE;
    }
}
