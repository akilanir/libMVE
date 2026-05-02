package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/AssignmentInstruction.class */
final class AssignmentInstruction extends TemplateElement {
    private int scope;
    private Expression namespaceExp;

    AssignmentInstruction(int scope) {
        this.scope = scope;
        this.nestedElements = new ArrayList(1);
    }

    void addAssignment(Assignment ass) {
        this.nestedElements.add(ass);
    }

    void setNamespaceExp(Expression namespaceExp) {
        this.namespaceExp = namespaceExp;
        for (int i = 0; i < this.nestedElements.size(); i++) {
            ((Assignment) this.nestedElements.get(i)).setNamespaceExp(namespaceExp);
        }
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        for (int i = 0; i < this.nestedElements.size(); i++) {
            Assignment ass = (Assignment) this.nestedElements.get(i);
            env.visit(ass);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(Assignment.getDirectiveName(this.scope));
        if (canonical) {
            buf.append(' ');
            for (int i = 0; i < this.nestedElements.size(); i++) {
                Assignment ass = (Assignment) this.nestedElements.get(i);
                buf.append(ass.getCanonicalForm());
                if (i < this.nestedElements.size() - 1) {
                    buf.append(" ");
                }
            }
        } else {
            buf.append("-container");
        }
        if (this.namespaceExp != null) {
            buf.append(" in ");
            buf.append(this.namespaceExp.getCanonicalForm());
        }
        if (canonical) {
            buf.append("/>");
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return new Integer(this.scope);
            case 1:
                return this.namespaceExp;
            default:
                return null;
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.VARIABLE_SCOPE;
            case 1:
                return ParameterRole.NAMESPACE;
            default:
                return null;
        }
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return Assignment.getDirectiveName(this.scope);
    }

    @Override // freemarker.core.TemplateElement
    public TemplateElement postParseCleanup(boolean stripWhitespace) throws ParseException {
        super.postParseCleanup(stripWhitespace);
        if (this.nestedElements.size() == 1) {
            Assignment ass = (Assignment) this.nestedElements.get(0);
            ass.setLocation(getTemplate(), this, this);
            return ass;
        }
        return this;
    }
}
