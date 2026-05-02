package org.mozilla.javascript.tools.shell;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.lang.reflect.Constructor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Proxy;
import java.nio.charset.Charset;
import org.mozilla.javascript.Kit;
import org.mozilla.javascript.Scriptable;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellConsole.class */
public abstract class ShellConsole {
    private static final Class[] NO_ARG = new Class[0];
    private static final Class[] BOOLEAN_ARG = {Boolean.TYPE};
    private static final Class[] STRING_ARG = {String.class};
    private static final Class[] CHARSEQ_ARG = {CharSequence.class};

    public abstract InputStream getIn();

    public abstract String readLine() throws IOException;

    public abstract String readLine(String str) throws IOException;

    public abstract void flush() throws IOException;

    public abstract void print(String str) throws IOException;

    public abstract void println() throws IOException;

    public abstract void println(String str) throws IOException;

    protected ShellConsole() {
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Object tryInvoke(Object obj, String method, Class[] paramTypes, Object... args) {
        try {
            Method m = obj.getClass().getDeclaredMethod(method, paramTypes);
            if (m != null) {
                return m.invoke(obj, args);
            }
            return null;
        } catch (IllegalAccessException e) {
            return null;
        } catch (IllegalArgumentException e2) {
            return null;
        } catch (NoSuchMethodException e3) {
            return null;
        } catch (InvocationTargetException e4) {
            return null;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV1.class */
    private static class JLineShellConsoleV1 extends ShellConsole {
        private final Object reader;
        private final InputStream in;

        JLineShellConsoleV1(Object reader, Charset cs) {
            this.reader = reader;
            this.in = new ConsoleInputStream(this, cs);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public InputStream getIn() {
            return this.in;
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine() throws IOException {
            return (String) ShellConsole.tryInvoke(this.reader, "readLine", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine(String prompt) throws IOException {
            return (String) ShellConsole.tryInvoke(this.reader, "readLine", ShellConsole.STRING_ARG, prompt);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void flush() throws IOException {
            ShellConsole.tryInvoke(this.reader, "flushConsole", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void print(String s) throws IOException {
            ShellConsole.tryInvoke(this.reader, "printString", ShellConsole.STRING_ARG, s);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println() throws IOException {
            ShellConsole.tryInvoke(this.reader, "printNewline", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println(String s) throws IOException {
            ShellConsole.tryInvoke(this.reader, "printString", ShellConsole.STRING_ARG, s);
            ShellConsole.tryInvoke(this.reader, "printNewline", ShellConsole.NO_ARG, new Object[0]);
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellConsole$JLineShellConsoleV2.class */
    private static class JLineShellConsoleV2 extends ShellConsole {
        private final Object reader;
        private final InputStream in;

        JLineShellConsoleV2(Object reader, Charset cs) {
            this.reader = reader;
            this.in = new ConsoleInputStream(this, cs);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public InputStream getIn() {
            return this.in;
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine() throws IOException {
            return (String) ShellConsole.tryInvoke(this.reader, "readLine", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine(String prompt) throws IOException {
            return (String) ShellConsole.tryInvoke(this.reader, "readLine", ShellConsole.STRING_ARG, prompt);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void flush() throws IOException {
            ShellConsole.tryInvoke(this.reader, "flush", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void print(String s) throws IOException {
            ShellConsole.tryInvoke(this.reader, "print", ShellConsole.CHARSEQ_ARG, s);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println() throws IOException {
            ShellConsole.tryInvoke(this.reader, "println", ShellConsole.NO_ARG, new Object[0]);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println(String s) throws IOException {
            ShellConsole.tryInvoke(this.reader, "println", ShellConsole.CHARSEQ_ARG, s);
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellConsole$ConsoleInputStream.class */
    private static class ConsoleInputStream extends InputStream {
        private static final byte[] EMPTY = new byte[0];
        private final ShellConsole console;
        private final Charset cs;
        private byte[] buffer = EMPTY;
        private int cursor = -1;
        private boolean atEOF = false;

        public ConsoleInputStream(ShellConsole console, Charset cs) {
            this.console = console;
            this.cs = cs;
        }

        @Override // java.io.InputStream
        public synchronized int read(byte[] b, int off, int len) throws IOException {
            if (b == null) {
                throw new NullPointerException();
            }
            if (off < 0 || len < 0 || len > b.length - off) {
                throw new IndexOutOfBoundsException();
            }
            if (len == 0) {
                return 0;
            }
            if (!ensureInput()) {
                return -1;
            }
            int n = Math.min(len, this.buffer.length - this.cursor);
            for (int i = 0; i < n; i++) {
                b[off + i] = this.buffer[this.cursor + i];
            }
            if (n < len) {
                n++;
                b[off + n] = 10;
            }
            this.cursor += n;
            return n;
        }

        @Override // java.io.InputStream
        public synchronized int read() throws IOException {
            if (!ensureInput()) {
                return -1;
            }
            if (this.cursor == this.buffer.length) {
                this.cursor++;
                return 10;
            }
            byte[] bArr = this.buffer;
            int i = this.cursor;
            this.cursor = i + 1;
            return bArr[i];
        }

        private boolean ensureInput() throws IOException {
            if (this.atEOF) {
                return false;
            }
            if (this.cursor < 0 || this.cursor > this.buffer.length) {
                if (readNextLine() == -1) {
                    this.atEOF = true;
                    return false;
                }
                this.cursor = 0;
                return true;
            }
            return true;
        }

        private int readNextLine() throws IOException {
            String line = this.console.readLine(null);
            if (line != null) {
                this.buffer = line.getBytes(this.cs);
                return this.buffer.length;
            }
            this.buffer = EMPTY;
            return -1;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/ShellConsole$SimpleShellConsole.class */
    private static class SimpleShellConsole extends ShellConsole {
        private final InputStream in;
        private final PrintWriter out;
        private final BufferedReader reader;

        SimpleShellConsole(InputStream in, PrintStream ps, Charset cs) {
            this.in = in;
            this.out = new PrintWriter(ps);
            this.reader = new BufferedReader(new InputStreamReader(in, cs));
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public InputStream getIn() {
            return this.in;
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine() throws IOException {
            return this.reader.readLine();
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public String readLine(String prompt) throws IOException {
            if (prompt != null) {
                this.out.write(prompt);
                this.out.flush();
            }
            return this.reader.readLine();
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void flush() throws IOException {
            this.out.flush();
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void print(String s) throws IOException {
            this.out.print(s);
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println() throws IOException {
            this.out.println();
        }

        @Override // org.mozilla.javascript.tools.shell.ShellConsole
        public void println(String s) throws IOException {
            this.out.println(s);
        }
    }

    public static ShellConsole getConsole(InputStream in, PrintStream ps, Charset cs) {
        return new SimpleShellConsole(in, ps, cs);
    }

    public static ShellConsole getConsole(Scriptable scope, Charset cs) {
        ClassLoader classLoader = ShellConsole.class.getClassLoader();
        if (classLoader == null) {
            classLoader = ClassLoader.getSystemClassLoader();
        }
        if (classLoader == null) {
            return null;
        }
        try {
            Class<?> readerClass = Kit.classOrNull(classLoader, "jline.console.ConsoleReader");
            if (readerClass != null) {
                return getJLineShellConsoleV2(classLoader, readerClass, scope, cs);
            }
            Class<?> readerClass2 = Kit.classOrNull(classLoader, "jline.ConsoleReader");
            if (readerClass2 != null) {
                return getJLineShellConsoleV1(classLoader, readerClass2, scope, cs);
            }
            return null;
        } catch (IllegalAccessException e) {
            return null;
        } catch (InstantiationException e2) {
            return null;
        } catch (NoSuchMethodException e3) {
            return null;
        } catch (InvocationTargetException e4) {
            return null;
        }
    }

    private static JLineShellConsoleV1 getJLineShellConsoleV1(ClassLoader classLoader, Class<?> readerClass, Scriptable scope, Charset cs) throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        Constructor<?> c = readerClass.getConstructor(new Class[0]);
        Object reader = c.newInstance(new Object[0]);
        tryInvoke(reader, "setBellEnabled", BOOLEAN_ARG, Boolean.FALSE);
        Class<?> completorClass = Kit.classOrNull(classLoader, "jline.Completor");
        Object completor = Proxy.newProxyInstance(classLoader, new Class[]{completorClass}, new FlexibleCompletor(completorClass, scope));
        tryInvoke(reader, "addCompletor", new Class[]{completorClass}, completor);
        return new JLineShellConsoleV1(reader, cs);
    }

    private static JLineShellConsoleV2 getJLineShellConsoleV2(ClassLoader classLoader, Class<?> readerClass, Scriptable scope, Charset cs) throws NoSuchMethodException, InstantiationException, IllegalAccessException, InvocationTargetException {
        Constructor<?> c = readerClass.getConstructor(new Class[0]);
        Object reader = c.newInstance(new Object[0]);
        tryInvoke(reader, "setBellEnabled", BOOLEAN_ARG, Boolean.FALSE);
        Class<?> completorClass = Kit.classOrNull(classLoader, "jline.console.completer.Completer");
        Object completor = Proxy.newProxyInstance(classLoader, new Class[]{completorClass}, new FlexibleCompletor(completorClass, scope));
        tryInvoke(reader, "addCompleter", new Class[]{completorClass}, completor);
        return new JLineShellConsoleV2(reader, cs);
    }
}
