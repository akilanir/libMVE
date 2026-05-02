package freemarker.core;

import freemarker.core.Environment;
import freemarker.template.SimpleSequence;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateNodeModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/VisitNode.class */
final class VisitNode extends TemplateElement {
    Expression targetNode;
    Expression namespaces;

    VisitNode(Expression targetNode, Expression namespaces) {
        this.targetNode = targetNode;
        this.namespaces = namespaces;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws IOException, TemplateException {
        TemplateModel node = this.targetNode.eval(env);
        if (!(node instanceof TemplateNodeModel)) {
            throw new UnexpectedTypeException(this.targetNode, node, "node", env);
        }
        TemplateModel nss = this.namespaces == null ? null : this.namespaces.eval(env);
        if (this.namespaces instanceof StringLiteral) {
            nss = env.importLib(((TemplateScalarModel) nss).getAsString(), (String) null);
        } else if (this.namespaces instanceof ListLiteral) {
            nss = ((ListLiteral) this.namespaces).evaluateStringsToNamespaces(env);
        }
        if (nss != null) {
            if (nss instanceof Environment.Namespace) {
                SimpleSequence ss = new SimpleSequence(1);
                ss.add(nss);
                nss = ss;
            } else if (!(nss instanceof TemplateSequenceModel)) {
                if (this.namespaces != null) {
                    throw new UnexpectedTypeException(this.namespaces, nss, "sequence", env);
                }
                throw new _MiscTemplateException(env, "Expecting a sequence of namespaces after \"using\"");
            }
        }
        env.visit((TemplateNodeModel) node, (TemplateSequenceModel) nss);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        sb.append(' ');
        sb.append(this.targetNode.getCanonicalForm());
        if (this.namespaces != null) {
            sb.append(" using ");
            sb.append(this.namespaces.getCanonicalForm());
        }
        if (canonical) {
            sb.append("/>");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#visit";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 2;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.targetNode;
            case 1:
                return this.namespaces;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        switch (idx) {
            case 0:
                return ParameterRole.NODE;
            case 1:
                return ParameterRole.NAMESPACE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }
}
