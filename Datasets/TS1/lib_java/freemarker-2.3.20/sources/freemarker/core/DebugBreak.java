package freemarker.core;

import freemarker.debug.impl.DebuggerService;
import freemarker.template.TemplateException;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/DebugBreak.class */
public class DebugBreak extends TemplateElement {
    public DebugBreak(TemplateElement nestedBlock) {
        this.nestedBlock = nestedBlock;
        nestedBlock.parent = this;
        copyLocationFrom(nestedBlock);
    }

    @Override // freemarker.core.TemplateElement
    protected void accept(Environment env) throws TemplateException, IOException {
        if (!DebuggerService.suspendEnvironment(env, getTemplate().getName(), this.nestedBlock.getBeginLine())) {
            this.nestedBlock.accept(env);
            return;
        }
        throw new StopException(env, "Stopped by debugger");
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        if (canonical) {
            StringBuffer sb = new StringBuffer();
            sb.append("<#-- ");
            sb.append("debug break");
            if (this.nestedBlock == null) {
                sb.append(" /-->");
            } else {
                sb.append(" -->");
                sb.append(this.nestedBlock.getCanonicalForm());
                sb.append("<#--/ debug break -->");
            }
            return sb.toString();
        }
        return "debug break";
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#debug_break";
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
