package freemarker.core;

import freemarker.core.BreakInstruction;
import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.LinkedList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/SwitchBlock.class */
final class SwitchBlock extends TemplateElement {
    private Case defaultCase;
    private final Expression searched;

    SwitchBlock(Expression searched) {
        this.searched = searched;
        this.nestedElements = new LinkedList();
    }

    void addCase(Case cas) {
        if (cas.condition == null) {
            this.defaultCase = cas;
        }
        this.nestedElements.add(cas);
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        boolean processedCase = false;
        for (Case cas : this.nestedElements) {
            try {
                boolean processCase = false;
                if (processedCase) {
                    processCase = true;
                } else if (cas.condition != null) {
                    processCase = EvalUtil.compare(this.searched, 1, "case==", cas.condition, cas.condition, env);
                }
                if (processCase) {
                    env.visitByHiddingParent(cas);
                    processedCase = true;
                }
            } catch (BreakInstruction.Break e) {
                return;
            }
        }
        if (!processedCase && this.defaultCase != null) {
            env.visitByHiddingParent(this.defaultCase);
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer buf = new StringBuffer();
        if (canonical) {
            buf.append('<');
        }
        buf.append(getNodeTypeSymbol());
        buf.append(' ');
        buf.append(this.searched.getCanonicalForm());
        if (canonical) {
            buf.append('>');
            for (int i = 0; i < this.nestedElements.size(); i++) {
                Case cas = (Case) this.nestedElements.get(i);
                buf.append(cas.getCanonicalForm());
            }
            buf.append("</").append(getNodeTypeSymbol()).append('>');
        }
        return buf.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#switch";
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
        return this.searched;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.VALUE;
    }
}
