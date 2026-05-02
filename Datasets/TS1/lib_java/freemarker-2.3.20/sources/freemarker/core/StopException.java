package freemarker.core;

import freemarker.template.TemplateException;
import java.io.PrintStream;
import java.io.PrintWriter;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/StopException.class */
public class StopException extends TemplateException {
    StopException(Environment env) {
        super(env);
    }

    StopException(Environment env, String s) {
        super(s, env);
    }

    @Override // freemarker.template.TemplateException, java.lang.Throwable
    public void printStackTrace(PrintWriter pw) {
        synchronized (pw) {
            String msg = getMessage();
            pw.print("Encountered stop instruction");
            if (msg != null && !msg.equals("")) {
                pw.println(new StringBuffer().append("\nCause given: ").append(msg).toString());
            } else {
                pw.println();
            }
            super.printStackTrace(pw);
        }
    }

    @Override // freemarker.template.TemplateException, java.lang.Throwable
    public void printStackTrace(PrintStream ps) {
        synchronized (ps) {
            String msg = getMessage();
            ps.print("Encountered stop instruction");
            if (msg != null && !msg.equals("")) {
                ps.println(new StringBuffer().append("\nCause given: ").append(msg).toString());
            } else {
                ps.println();
            }
            super.printStackTrace(ps);
        }
    }
}
