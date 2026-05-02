package freemarker.core;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BreakInstruction.class */
final class BreakInstruction extends TemplateElement {
    BreakInstruction() {
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) {
        throw Break.INSTANCE;
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        return canonical ? new StringBuffer().append("<").append(getNodeTypeSymbol()).append("/>").toString() : getNodeTypeSymbol();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#break";
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

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/BreakInstruction$Break.class */
    static class Break extends RuntimeException {
        static final Break INSTANCE = new Break();

        private Break() {
        }
    }
}
