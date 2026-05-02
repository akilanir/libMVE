package freemarker.template.utility;

import java.io.PrintStream;
import java.io.PrintWriter;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/utility/UndeclaredThrowableException.class */
public class UndeclaredThrowableException extends RuntimeException {
    private final Throwable t;

    public UndeclaredThrowableException(Throwable t) {
        this.t = t;
    }

    @Override // java.lang.Throwable
    public void printStackTrace() {
        printStackTrace(System.err);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream ps) {
        synchronized (ps) {
            ps.print("Undeclared throwable:");
            this.t.printStackTrace(ps);
        }
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter pw) {
        synchronized (pw) {
            pw.print("Undeclared throwable:");
            this.t.printStackTrace(pw);
        }
    }

    public Throwable getUndeclaredThrowable() {
        return this.t;
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.t;
    }
}
