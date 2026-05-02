package freemarker.core;

import freemarker.template.TemplateException;
import java.io.IOException;
import java.util.ArrayList;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/AttemptBlock.class */
final class AttemptBlock extends TemplateElement {
    private TemplateElement attemptBlock;
    private RecoveryBlock recoveryBlock;

    AttemptBlock(TemplateElement attemptBlock, RecoveryBlock recoveryBlock) {
        this.attemptBlock = attemptBlock;
        this.recoveryBlock = recoveryBlock;
        this.nestedElements = new ArrayList();
        this.nestedElements.add(attemptBlock);
        this.nestedElements.add(recoveryBlock);
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        env.visitAttemptRecover(this.attemptBlock, this.recoveryBlock);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (!canonical) {
            return getNodeTypeSymbol();
        }
        StringBuffer buf = new StringBuffer();
        buf.append("<");
        buf.append(getNodeTypeSymbol());
        buf.append(">");
        if (this.attemptBlock != null) {
            buf.append(this.attemptBlock.getCanonicalForm());
        }
        if (this.recoveryBlock != null) {
            buf.append(this.recoveryBlock.getCanonicalForm());
        }
        return buf.toString();
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
        return this.recoveryBlock;
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        if (idx != 0) {
            throw new IndexOutOfBoundsException();
        }
        return ParameterRole.ERROR_HANDLER;
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#attempt";
    }

    @Override // freemarker.core.TemplateElement
    boolean isShownInStackTrace() {
        return false;
    }
}
