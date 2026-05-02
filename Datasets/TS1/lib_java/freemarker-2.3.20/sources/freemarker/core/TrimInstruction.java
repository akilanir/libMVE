package freemarker.core;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TrimInstruction.class */
final class TrimInstruction extends TemplateElement {
    private final int TYPE_T = 0;
    private final int TYPE_LT = 1;
    private final int TYPE_RT = 2;
    private final int TYPE_NT = 3;
    final boolean left;
    final boolean right;

    TrimInstruction(boolean left, boolean right) {
        this.left = left;
        this.right = right;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) {
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        if (canonical) {
            sb.append("/>");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        if (this.left && this.right) {
            return "#t";
        }
        if (this.left) {
            return "#lt";
        }
        if (this.right) {
            return "#rt";
        }
        return "#nt";
    }

    @Override // freemarker.core.TemplateElement
    boolean isIgnorable() {
        return true;
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 1;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        int type;
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        if (this.left && this.right) {
            type = 0;
        } else if (this.left) {
            type = 1;
        } else if (this.right) {
            type = 2;
        } else {
            type = 3;
        }
        return new Integer(type);
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.AST_NODE_SUBTYPE;
    }
}
