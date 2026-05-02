package freemarker.core;

import freemarker.core.Environment;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/BlockAssignment.class */
final class BlockAssignment extends TemplateElement {
    private final String varName;
    private final Expression namespaceExp;
    private final int scope;

    BlockAssignment(TemplateElement nestedBlock, String varName, int scope, Expression namespaceExp) {
        this.nestedBlock = nestedBlock;
        this.varName = varName;
        this.namespaceExp = namespaceExp;
        this.scope = scope;
    }

    @Override // freemarker.core.TemplateElement
    void accept(Environment env) throws TemplateException, IOException {
        if (this.nestedBlock != null) {
            env.visitAndTransform(this.nestedBlock, new CaptureOutput(this, env), null);
            return;
        }
        TemplateModel value = new SimpleScalar("");
        if (this.namespaceExp != null) {
            Environment.Namespace ns = (Environment.Namespace) this.namespaceExp.eval(env);
            ns.put(this.varName, value);
        } else if (this.scope == 1) {
            env.setVariable(this.varName, value);
        } else if (this.scope == 3) {
            env.setGlobalVariable(this.varName, value);
        } else if (this.scope == 2) {
            env.setLocalVariable(this.varName, value);
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/BlockAssignment$CaptureOutput.class */
    private class CaptureOutput implements TemplateTransformModel {
        private final Environment env;
        private final Environment.Namespace fnsModel;
        private final BlockAssignment this$0;

        CaptureOutput(BlockAssignment blockAssignment, Environment env) throws TemplateException {
            this.this$0 = blockAssignment;
            this.env = env;
            TemplateModel nsModel = null;
            if (blockAssignment.namespaceExp != null) {
                nsModel = blockAssignment.namespaceExp.eval(env);
                if (!(nsModel instanceof Environment.Namespace)) {
                    throw new UnexpectedTypeException(blockAssignment.namespaceExp, nsModel, "namespace", env);
                }
            }
            this.fnsModel = (Environment.Namespace) nsModel;
        }

        @Override // freemarker.template.TemplateTransformModel
        public Writer getWriter(Writer out, Map args) {
            return new StringWriter(this) { // from class: freemarker.core.BlockAssignment.CaptureOutput.1
                private final CaptureOutput this$1;

                {
                    this.this$1 = this;
                }

                @Override // java.io.StringWriter, java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
                public void close() {
                    SimpleScalar result = new SimpleScalar(toString());
                    switch (this.this$1.this$0.scope) {
                        case 1:
                            if (this.this$1.fnsModel != null) {
                                this.this$1.fnsModel.put(this.this$1.this$0.varName, result);
                                break;
                            } else {
                                this.this$1.env.setVariable(this.this$1.this$0.varName, result);
                                break;
                            }
                        case 2:
                            this.this$1.env.setLocalVariable(this.this$1.this$0.varName, result);
                            break;
                        case 3:
                            this.this$1.env.setGlobalVariable(this.this$1.this$0.varName, result);
                            break;
                    }
                }
            };
        }
    }

    @Override // freemarker.core.TemplateElement
    protected String dump(boolean canonical) {
        StringBuffer sb = new StringBuffer();
        if (canonical) {
            sb.append("<");
        }
        sb.append(getNodeTypeSymbol());
        sb.append(' ');
        sb.append(this.varName);
        if (this.namespaceExp != null) {
            sb.append(" in ");
            sb.append(this.namespaceExp.getCanonicalForm());
        }
        if (canonical) {
            sb.append('>');
            sb.append(this.nestedBlock == null ? "" : this.nestedBlock.getCanonicalForm());
            sb.append("</");
            sb.append(getNodeTypeSymbol());
            sb.append('>');
        } else {
            sb.append(" = .nested_output");
        }
        return sb.toString();
    }

    @Override // freemarker.core.TemplateObject
    String getNodeTypeSymbol() {
        return Assignment.getDirectiveName(this.scope);
    }

    @Override // freemarker.core.TemplateObject
    int getParameterCount() {
        return 3;
    }

    @Override // freemarker.core.TemplateObject
    Object getParameterValue(int idx) {
        switch (idx) {
            case 0:
                return this.varName;
            case 1:
                return new Integer(this.scope);
            case 2:
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
                return ParameterRole.VARIABLE_SCOPE;
            case 2:
                return ParameterRole.NAMESPACE;
            default:
                throw new IndexOutOfBoundsException();
        }
    }

    @Override // freemarker.core.TemplateElement
    boolean isIgnorable() {
        return false;
    }
}
