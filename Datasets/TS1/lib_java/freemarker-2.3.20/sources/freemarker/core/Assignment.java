package freemarker.core;

import freemarker.core.Environment;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateScalarModel;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Assignment.class */
final class Assignment extends TemplateElement {
    private String variableName;
    private Expression value;
    private Expression namespaceExp;
    private int scope;
    static final int NAMESPACE = 1;
    static final int LOCAL = 2;
    static final int GLOBAL = 3;

    Assignment(String variableName, Expression value, int scope) {
        this.variableName = variableName;
        this.value = value;
        this.scope = scope;
    }

    void setNamespaceExp(Expression namespaceExp) {
        this.namespaceExp = namespaceExp;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException {
        Environment.Namespace namespace = null;
        if (this.namespaceExp != null) {
            TemplateModel namespaceTM = this.namespaceExp.eval(env);
            try {
                namespace = (Environment.Namespace) namespaceTM;
                if (namespace == null) {
                    throw InvalidReferenceException.getInstance(this.namespaceExp, env);
                }
            } catch (ClassCastException e) {
                throw new UnexpectedTypeException(this.namespaceExp, namespaceTM, "namespace", env);
            }
        }
        TemplateModel tm = this.value.eval(env);
        if (tm == null) {
            if (env.isClassicCompatible()) {
                tm = TemplateScalarModel.EMPTY_STRING;
            } else {
                throw InvalidReferenceException.getInstance(this.value, env);
            }
        }
        if (this.scope == 2) {
            env.setLocalVariable(this.variableName, tm);
            return;
        }
        if (namespace == null) {
            if (this.scope == 3) {
                namespace = env.getGlobalNamespace();
            } else if (this.scope == 1) {
                namespace = env.getCurrentNamespace();
            } else {
                throw new RuntimeException(new StringBuffer().append("Unexpected scope type: ").append(this.scope).toString());
            }
        }
        namespace.put(this.variableName, tm);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        String dn = this.parent instanceof AssignmentInstruction ? null : getNodeTypeSymbol();
        if (dn != null) {
            if (canonical) {
                buf.append("<");
            }
            buf.append(dn);
            buf.append(' ');
        }
        buf.append(this.variableName);
        buf.append(" = ");
        buf.append(this.value.getCanonicalForm());
        if (dn != null) {
            if (this.namespaceExp != null) {
                buf.append(" in ");
                buf.append(this.namespaceExp.getCanonicalForm());
            }
            if (canonical) {
                buf.append(">");
            }
        }
        String result = buf.toString();
        return result;
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return getDirectiveName(this.scope);
    }

    static String getDirectiveName(int scope) {
        if (scope == 2) {
            return "#local";
        }
        if (scope == 3) {
            return "#global";
        }
        if (scope == 1) {
            return "#assign";
        }
        return "#{unknown_assignment_type}";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 4;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.variableName;
            case 1:
                return this.value;
            case 2:
                return new Integer(this.scope);
            case 3:
                return this.namespaceExp;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.ASSIGNMENT_TARGET;
            case 1:
                return ParameterRole.ASSIGNMENT_SOURCE;
            case 2:
                return ParameterRole.VARIABLE_SCOPE;
            case 3:
                return ParameterRole.NAMESPACE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
