package freemarker.core;

import freemarker.template.Template;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Interpret.class */
class Interpret extends BuiltIn {
    Interpret() {
    }

    @Override // freemarker.core.Expression
    TemplateModel _eval(Environment env) throws TemplateException {
        Expression sourceExpr;
        TemplateModel model = this.target.eval(env);
        String id = "anonymous_interpreted";
        if (model instanceof TemplateSequenceModel) {
            sourceExpr = (Expression) new DynamicKeyName(this.target, new NumberLiteral(new Integer(0))).copyLocationFrom(this.target);
            if (((TemplateSequenceModel) model).size() > 1) {
                id = ((Expression) new DynamicKeyName(this.target, new NumberLiteral(new Integer(1))).copyLocationFrom(this.target)).evalAndCoerceToString(env);
            }
        } else if (model instanceof TemplateScalarModel) {
            sourceExpr = this.target;
        } else {
            throw new UnexpectedTypeException(this.target, model, "sequence or string", env);
        }
        String templateSource = sourceExpr.evalAndCoerceToString(env);
        Template parentTemplate = env.getTemplate();
        try {
            Template interpretedTemplate = new Template(new StringBuffer().append(parentTemplate.getName() != null ? parentTemplate.getName() : "nameless_template").append("->").append(id).toString(), templateSource, parentTemplate.getConfiguration());
            interpretedTemplate.setLocale(env.getLocale());
            return new TemplateProcessorModel(this, interpretedTemplate);
        } catch (IOException e) {
            throw new _MiscTemplateException(this, e, env, new Object[]{"Template parsing with \"?", this.key, "\" has failed with this error:\n\n", "---begin-message---\n", new _DelayedGetMessage(e), "\n---end-message---", "\n\nThe failed expression:"});
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Interpret$TemplateProcessorModel.class */
    private class TemplateProcessorModel implements TemplateTransformModel {
        private final Template template;
        private final Interpret this$0;

        TemplateProcessorModel(Interpret interpret, Template template) {
            this.this$0 = interpret;
            this.template = template;
        }

        @Override // freemarker.template.TemplateTransformModel
        public Writer getWriter(Writer out, Map args) throws TemplateModelException, IOException {
            try {
                Environment env = Environment.getCurrentEnvironment();
                boolean lastFIRE = env.setFastInvalidReferenceExceptions(false);
                try {
                    env.include(this.template);
                    env.setFastInvalidReferenceExceptions(lastFIRE);
                    return new Writer(this, out, out) { // from class: freemarker.core.Interpret.TemplateProcessorModel.1
                        private final Writer val$out;
                        private final TemplateProcessorModel this$1;

                        {
                            this.this$1 = this;
                            this.val$out = out;
                        }

                        @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
                        public void close() {
                        }

                        @Override // java.io.Writer, java.io.Flushable
                        public void flush() throws IOException {
                            this.val$out.flush();
                        }

                        @Override // java.io.Writer
                        public void write(char[] cbuf, int off, int len) throws IOException {
                            this.val$out.write(cbuf, off, len);
                        }
                    };
                } catch (Throwable th) {
                    env.setFastInvalidReferenceExceptions(lastFIRE);
                    throw th;
                }
            } catch (Exception e) {
                throw new _TemplateModelException(e, new Object[]{"Template created with \"?", this.this$0.key, "\" has stopped with this error:\n\n", "---begin-message---\n", new _DelayedGetMessage(e), "\n---end-message---"});
            }
        }
    }
}
