package freemarker.template;

import freemarker.core.Environment;
import freemarker.core.TemplateElement;
import freemarker.core._CoreAPI;
import freemarker.core._ErrorDescriptionBuilder;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.io.StringWriter;

/* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateException.class */
public class TemplateException extends Exception {
    private static final String THE_FAILING_INSTRUCTION = "The failing instruction";
    private static final boolean BEFORE_1_4 = before14();
    private static final Class[] EMPTY_CLASS_ARRAY = new Class[0];
    private static final Object[] EMPTY_OBJECT_ARRAY = new Object[0];
    private transient _ErrorDescriptionBuilder descriptionBuilder;
    private final Throwable causeException;
    private final transient Environment env;
    private transient TemplateElement[] ftlInstructionStackSnapshot;
    private String renderedFtlInstructionStackSnapshot;
    private String renderedFtlInstructionStackSnapshotTop;
    private String description;
    private transient String messageWithoutStackTop;
    private transient String message;
    private transient Object lock;
    private transient ThreadLocal messageWasAlreadyPrintedForThisTrace;
    static Class class$java$lang$Exception;

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateException$StackTraceWriter.class */
    private interface StackTraceWriter {
        void print(Object obj);

        void println(Object obj);

        void println();

        void printStandardStackTrace(Throwable th);
    }

    private static boolean before14() {
        Class cls;
        if (class$java$lang$Exception == null) {
            cls = class$("java.lang.Exception");
            class$java$lang$Exception = cls;
        } else {
            cls = class$java$lang$Exception;
        }
        Class ec = cls;
        try {
            ec.getMethod("getCause", new Class[0]);
            return false;
        } catch (Throwable th) {
            return true;
        }
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    public TemplateException(Environment env) {
        this((String) null, (Exception) null, env);
    }

    public TemplateException(String description, Environment env) {
        this(description, (Exception) null, env);
    }

    public TemplateException(Exception cause, Environment env) {
        this((String) null, cause, env);
    }

    public TemplateException(Throwable cause, Environment env) {
        this((String) null, cause, env);
    }

    public TemplateException(String description, Exception cause, Environment env) {
        this(description, cause, env, (_ErrorDescriptionBuilder) null);
    }

    public TemplateException(String description, Throwable cause, Environment env) {
        this(description, cause, env, (_ErrorDescriptionBuilder) null);
    }

    protected TemplateException(Throwable cause, Environment env, _ErrorDescriptionBuilder descriptionBuilder, boolean preventAmbiguity) {
        this((String) null, cause, env, descriptionBuilder);
    }

    private TemplateException(String renderedDescription, Throwable cause, Environment env, _ErrorDescriptionBuilder descriptionBuilder) {
        this.lock = new Object();
        env = env == null ? Environment.getCurrentEnvironment() : env;
        this.env = env;
        this.causeException = cause;
        this.descriptionBuilder = descriptionBuilder;
        this.description = renderedDescription;
        if (env != null) {
            this.ftlInstructionStackSnapshot = _CoreAPI.getInstructionStackSnapshot(env);
        }
    }

    private void renderMessages() {
        String description = getDescription();
        if (description != null && description.length() != 0) {
            this.messageWithoutStackTop = description;
        } else if (getCause() != null) {
            this.messageWithoutStackTop = new StringBuffer().append("No error description was specified for this error; low-level message: ").append(getCause().getClass().getName()).append(": ").append(getCause().getMessage()).toString();
        } else {
            this.messageWithoutStackTop = "[No error description was available.]";
        }
        String stackTop = getFTLInstructionStackTop();
        if (stackTop != null) {
            this.message = new StringBuffer().append(this.messageWithoutStackTop).append("\n\n").append(THE_FAILING_INSTRUCTION).append(stackTop).toString();
            this.messageWithoutStackTop = this.message.substring(0, this.messageWithoutStackTop.length());
        } else {
            this.message = this.messageWithoutStackTop;
        }
    }

    public Exception getCauseException() {
        return this.causeException instanceof Exception ? (Exception) this.causeException : new Exception(new StringBuffer().append("Wrapped to Exception: ").append(this.causeException).toString());
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.causeException;
    }

    public String getFTLInstructionStack() {
        synchronized (this.lock) {
            if (this.ftlInstructionStackSnapshot != null || this.renderedFtlInstructionStackSnapshot != null) {
                if (this.renderedFtlInstructionStackSnapshot == null) {
                    StringWriter sw = new StringWriter();
                    PrintWriter pw = new PrintWriter(sw);
                    _CoreAPI.outputInstructionStack(this.ftlInstructionStackSnapshot, pw);
                    pw.close();
                    if (this.renderedFtlInstructionStackSnapshot == null) {
                        this.renderedFtlInstructionStackSnapshot = sw.toString();
                        deleteFTLInstructionStackSnapshotIfNotNeeded();
                    }
                }
                return this.renderedFtlInstructionStackSnapshot;
            }
            return null;
        }
    }

    private String getFTLInstructionStackTop() {
        String s;
        synchronized (this.lock) {
            if (this.ftlInstructionStackSnapshot != null || this.renderedFtlInstructionStackSnapshotTop != null) {
                if (this.renderedFtlInstructionStackSnapshotTop == null) {
                    int stackSize = this.ftlInstructionStackSnapshot.length;
                    if (stackSize == 0) {
                        s = "";
                    } else {
                        s = new StringBuffer().append(stackSize > 1 ? new StringBuffer().append(" (print stack trace for ").append(stackSize - 1).append(" more)").toString() : "").append(":\n==> ").append(_CoreAPI.instructionStackItemToString(this.ftlInstructionStackSnapshot[0])).toString();
                    }
                    if (this.renderedFtlInstructionStackSnapshotTop == null) {
                        this.renderedFtlInstructionStackSnapshotTop = s;
                        deleteFTLInstructionStackSnapshotIfNotNeeded();
                    }
                }
                return this.renderedFtlInstructionStackSnapshotTop.length() != 0 ? this.renderedFtlInstructionStackSnapshotTop : null;
            }
            return null;
        }
    }

    private void deleteFTLInstructionStackSnapshotIfNotNeeded() {
        if (this.renderedFtlInstructionStackSnapshot != null && this.renderedFtlInstructionStackSnapshotTop != null) {
            this.ftlInstructionStackSnapshot = null;
        }
    }

    private String getDescription() {
        String str;
        synchronized (this.lock) {
            if (this.description == null && this.descriptionBuilder != null) {
                this.description = this.descriptionBuilder.toString(getFailingInstruction());
                this.descriptionBuilder = null;
            }
            str = this.description;
        }
        return str;
    }

    private TemplateElement getFailingInstruction() {
        if (this.ftlInstructionStackSnapshot != null && this.ftlInstructionStackSnapshot.length > 0) {
            return this.ftlInstructionStackSnapshot[0];
        }
        return null;
    }

    public Environment getEnvironment() {
        return this.env;
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintStream out) {
        printStackTrace(out, true, true, true);
    }

    @Override // java.lang.Throwable
    public void printStackTrace(PrintWriter out) {
        printStackTrace(out, true, true, true);
    }

    public void printStackTrace(PrintWriter out, boolean heading, boolean ftlStackTrace, boolean javaStackTrace) {
        synchronized (out) {
            printStackTrace(new PrintWriterStackTraceWriter(out), heading, ftlStackTrace, javaStackTrace);
        }
    }

    public void printStackTrace(PrintStream out, boolean heading, boolean ftlStackTrace, boolean javaStackTrace) {
        synchronized (out) {
            printStackTrace(new PrintStreamStackTraceWriter(out), heading, ftlStackTrace, javaStackTrace);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:15:0x0055  */
    /* JADX WARN: Removed duplicated region for block: B:9:0x0015 A[Catch: all -> 0x015f, TryCatch #3 {, blocks: (B:6:0x0009, B:9:0x0015, B:11:0x0020, B:17:0x0059, B:18:0x0076, B:19:0x0077, B:21:0x007e, B:22:0x0089, B:23:0x0095, B:30:0x00a1, B:31:0x00a9, B:38:0x00ce, B:40:0x00d4, B:42:0x00db, B:43:0x00ed, B:45:0x0114, B:47:0x011d, B:50:0x0144, B:34:0x00b8, B:35:0x00c3, B:27:0x009d, B:29:0x00a0, B:37:0x00c7, B:54:0x015b), top: B:68:0x0009, inners: #0, #1 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void printStackTrace(freemarker.template.TemplateException.StackTraceWriter r5, boolean r6, boolean r7, boolean r8) {
        /*
            Method dump skipped, instructions count: 360
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.template.TemplateException.printStackTrace(freemarker.template.TemplateException$StackTraceWriter, boolean, boolean, boolean):void");
    }

    public void printStandardStackTrace(PrintStream ps) {
        super.printStackTrace(ps);
    }

    public void printStandardStackTrace(PrintWriter pw) {
        super.printStackTrace(pw);
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String str;
        if (this.messageWasAlreadyPrintedForThisTrace != null && this.messageWasAlreadyPrintedForThisTrace.get() == Boolean.TRUE) {
            return "[... Exception message was already printed; see it above ...]";
        }
        synchronized (this.lock) {
            if (this.message == null) {
                renderMessages();
            }
            str = this.message;
        }
        return str;
    }

    public String getMessageWithoutStackTop() {
        String str;
        synchronized (this.lock) {
            if (this.messageWithoutStackTop == null) {
                renderMessages();
            }
            str = this.messageWithoutStackTop;
        }
        return str;
    }

    private void writeObject(ObjectOutputStream out) throws IOException, ClassNotFoundException {
        getFTLInstructionStack();
        getFTLInstructionStackTop();
        getDescription();
        out.defaultWriteObject();
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        this.lock = new Object();
        in.defaultReadObject();
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateException$PrintStreamStackTraceWriter.class */
    private static class PrintStreamStackTraceWriter implements StackTraceWriter {
        private final PrintStream out;

        PrintStreamStackTraceWriter(PrintStream out) {
            this.out = out;
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void print(Object obj) {
            this.out.print(obj);
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void println(Object obj) {
            this.out.println(obj);
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void println() {
            this.out.println();
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void printStandardStackTrace(Throwable exception) {
            if (exception instanceof TemplateException) {
                ((TemplateException) exception).printStandardStackTrace(this.out);
            } else {
                exception.printStackTrace(this.out);
            }
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/template/TemplateException$PrintWriterStackTraceWriter.class */
    private static class PrintWriterStackTraceWriter implements StackTraceWriter {
        private final PrintWriter out;

        PrintWriterStackTraceWriter(PrintWriter out) {
            this.out = out;
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void print(Object obj) {
            this.out.print(obj);
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void println(Object obj) {
            this.out.println(obj);
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void println() {
            this.out.println();
        }

        @Override // freemarker.template.TemplateException.StackTraceWriter
        public void printStandardStackTrace(Throwable exception) {
            if (exception instanceof TemplateException) {
                ((TemplateException) exception).printStandardStackTrace(this.out);
            } else {
                exception.printStackTrace(this.out);
            }
        }
    }
}
