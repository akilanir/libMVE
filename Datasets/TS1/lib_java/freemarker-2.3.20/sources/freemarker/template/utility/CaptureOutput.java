package freemarker.template.utility;

import freemarker.core.Environment;
import freemarker.template.SimpleScalar;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/CaptureOutput.class */
public class CaptureOutput implements TemplateTransformModel {
    @Override // freemarker.template.TemplateTransformModel
    public Writer getWriter(Writer out, Map args) throws TemplateModelException {
        if (args == null) {
            throw new TemplateModelException("Must specify the name of the variable in which to capture the output with the 'var' or 'local' or 'global' parameter.");
        }
        boolean local = false;
        boolean global = false;
        TemplateModel nsModel = (TemplateModel) args.get("namespace");
        Object varNameModel = args.get("var");
        if (varNameModel == null) {
            varNameModel = args.get("local");
            if (varNameModel == null) {
                varNameModel = args.get("global");
                global = true;
            } else {
                local = true;
            }
            if (varNameModel == null) {
                throw new TemplateModelException("Must specify the name of the variable in which to capture the output with the 'var' or 'local' or 'global' parameter.");
            }
        }
        if (args.size() == 2) {
            if (nsModel == null) {
                throw new TemplateModelException("Second parameter can only be namespace");
            }
            if (local) {
                throw new TemplateModelException("Cannot specify namespace for a local assignment");
            }
            if (global) {
                throw new TemplateModelException("Cannot specify namespace for a global assignment");
            }
            if (!(nsModel instanceof Environment.Namespace)) {
                throw new TemplateModelException(new StringBuffer().append("namespace parameter does not specify a namespace. It is a ").append(nsModel.getClass().getName()).toString());
            }
        } else if (args.size() != 1) {
            throw new TemplateModelException("Bad parameters. Use only one of 'var' or 'local' or 'global' parameters.");
        }
        if (!(varNameModel instanceof TemplateScalarModel)) {
            throw new TemplateModelException("'var' or 'local' or 'global' parameter doesn't evaluate to a string");
        }
        String varName = ((TemplateScalarModel) varNameModel).getAsString();
        if (varName == null) {
            throw new TemplateModelException("'var' or 'local' or 'global' parameter evaluates to null string");
        }
        StringBuffer buf = new StringBuffer();
        Environment env = Environment.getCurrentEnvironment();
        boolean localVar = local;
        boolean globalVar = global;
        return new Writer(this, buf, out, localVar, env, varName, globalVar, nsModel) { // from class: freemarker.template.utility.CaptureOutput.1
            private final StringBuffer val$buf;
            private final Writer val$out;
            private final boolean val$localVar;
            private final Environment val$env;
            private final String val$varName;
            private final boolean val$globalVar;
            private final TemplateModel val$nsModel;
            private final CaptureOutput this$0;

            {
                this.this$0 = this;
                this.val$buf = buf;
                this.val$out = out;
                this.val$localVar = localVar;
                this.val$env = env;
                this.val$varName = varName;
                this.val$globalVar = globalVar;
                this.val$nsModel = nsModel;
            }

            @Override // java.io.Writer
            public void write(char[] cbuf, int off, int len) {
                this.val$buf.append(cbuf, off, len);
            }

            @Override // java.io.Writer, java.io.Flushable
            public void flush() throws IOException {
                this.val$out.flush();
            }

            @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
            public void close() throws IOException {
                SimpleScalar result = new SimpleScalar(this.val$buf.toString());
                try {
                    if (this.val$localVar) {
                        this.val$env.setLocalVariable(this.val$varName, result);
                    } else if (this.val$globalVar) {
                        this.val$env.setGlobalVariable(this.val$varName, result);
                    } else if (this.val$nsModel == null) {
                        this.val$env.setVariable(this.val$varName, result);
                    } else {
                        ((Environment.Namespace) this.val$nsModel).put(this.val$varName, result);
                    }
                } catch (IllegalStateException ise) {
                    throw new IOException(new StringBuffer().append("Could not set variable ").append(this.val$varName).append(": ").append(ise.getMessage()).toString());
                }
            }
        };
    }
}
