package freemarker.template.utility;

import freemarker.core.Environment;
import freemarker.template.TemplateTransformModel;
import java.io.IOException;
import java.io.Writer;
import java.util.Map;
import org.python.core.PyObject;
import org.python.util.PythonInterpreter;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/JythonRuntime.class */
public class JythonRuntime extends PythonInterpreter implements TemplateTransformModel {
    @Override // freemarker.template.TemplateTransformModel
    public Writer getWriter(Writer out, Map args) {
        StringBuffer buf = new StringBuffer();
        Environment env = Environment.getCurrentEnvironment();
        return new Writer(this, buf, out, env) { // from class: freemarker.template.utility.JythonRuntime.1
            private final StringBuffer val$buf;
            private final Writer val$out;
            private final Environment val$env;
            private final JythonRuntime this$0;

            {
                this.this$0 = this;
                this.val$buf = buf;
                this.val$out = out;
                this.val$env = env;
            }

            @Override // java.io.Writer
            public void write(char[] cbuf, int off, int len) {
                this.val$buf.append(cbuf, off, len);
            }

            @Override // java.io.Writer, java.io.Flushable
            public void flush() throws IOException {
                interpretBuffer();
                this.val$out.flush();
            }

            @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
                interpretBuffer();
            }

            private void interpretBuffer() {
                synchronized (this.this$0) {
                    PyObject prevOut = this.this$0.systemState.stdout;
                    try {
                        this.this$0.setOut(this.val$out);
                        this.this$0.set("env", this.val$env);
                        this.this$0.exec(this.val$buf.toString());
                        this.val$buf.setLength(0);
                        this.this$0.setOut(prevOut);
                    } catch (Throwable th) {
                        this.this$0.setOut(prevOut);
                        throw th;
                    }
                }
            }
        };
    }
}
