package freemarker.core;

import freemarker.core.Environment;
import freemarker.core.Macro;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import java.io.IOException;
import java.util.Collection;
import java.util.Collections;
import java.util.List;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BodyInstruction.class */
final class BodyInstruction extends TemplateElement {
    private List bodyParameters;

    BodyInstruction(List bodyParameters) {
        this.bodyParameters = bodyParameters;
    }

    List getBodyParameters() {
        return this.bodyParameters;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws IOException, TemplateException {
        Context bodyContext = new Context(this, env);
        env.visit(bodyContext);
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append('<');
        }
        sb.append(getNodeTypeSymbol());
        if (this.bodyParameters != null) {
            for (int i = 0; i < this.bodyParameters.size(); i++) {
                sb.append(' ');
                sb.append(this.bodyParameters.get(i));
            }
        }
        if (canonical) {
            sb.append('>');
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return "#nested";
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        if (this.bodyParameters != null) {
            return this.bodyParameters.size();
        }
        return 0;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        checkIndex(idx);
        return this.bodyParameters.get(idx);
    }

    @Override // freemarker.core.TemplateObject
    ParameterRole getParameterRole(int idx) {
        checkIndex(idx);
        return ParameterRole.PASSED_VALUE;
    }

    private void checkIndex(int idx) {
        if (this.bodyParameters == null || idx >= this.bodyParameters.size()) {
            throw new IndexOutOfBoundsException();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/BodyInstruction$Context.class */
    class Context implements LocalContext {
        Macro.Context invokingMacroContext;
        Environment.Namespace bodyVars;
        private final BodyInstruction this$0;

        Context(BodyInstruction bodyInstruction, Environment env) throws TemplateException {
            this.this$0 = bodyInstruction;
            this.invokingMacroContext = env.getCurrentMacroContext();
            List bodyParameterNames = this.invokingMacroContext.bodyParameterNames;
            if (bodyInstruction.bodyParameters != null) {
                for (int i = 0; i < bodyInstruction.bodyParameters.size(); i++) {
                    Expression exp = (Expression) bodyInstruction.bodyParameters.get(i);
                    TemplateModel tm = exp.eval(env);
                    if (bodyParameterNames != null && i < bodyParameterNames.size()) {
                        String bodyParameterName = (String) bodyParameterNames.get(i);
                        if (this.bodyVars == null) {
                            env.getClass();
                            this.bodyVars = new Environment.Namespace(env);
                        }
                        this.bodyVars.put(bodyParameterName, tm);
                    }
                }
            }
        }

        @Override // freemarker.core.LocalContext
        public TemplateModel getLocalVariable(String name) throws TemplateModelException {
            if (this.bodyVars == null) {
                return null;
            }
            return this.bodyVars.get(name);
        }

        @Override // freemarker.core.LocalContext
        public Collection getLocalVariableNames() {
            List bodyParameterNames = this.invokingMacroContext.bodyParameterNames;
            return bodyParameterNames == null ? Collections.EMPTY_LIST : bodyParameterNames;
        }
    }
}
