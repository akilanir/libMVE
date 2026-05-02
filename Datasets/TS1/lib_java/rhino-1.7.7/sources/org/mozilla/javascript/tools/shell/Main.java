package org.mozilla.javascript.tools.shell;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
import java.lang.ref.ReferenceQueue;
import java.lang.ref.SoftReference;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextAction;
import org.mozilla.javascript.Function;
import org.mozilla.javascript.GeneratedClassLoader;
import org.mozilla.javascript.Kit;
import org.mozilla.javascript.NativeArray;
import org.mozilla.javascript.RhinoException;
import org.mozilla.javascript.Script;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.SecurityController;
import org.mozilla.javascript.commonjs.module.ModuleScope;
import org.mozilla.javascript.commonjs.module.Require;
import org.mozilla.javascript.tools.SourceReader;
import org.mozilla.javascript.tools.ToolErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Main.class */
public class Main {
    protected static ToolErrorReporter errorReporter;
    private static final int EXITCODE_RUNTIME_ERROR = 3;
    private static final int EXITCODE_FILE_NOT_FOUND = 4;
    static List<String> modulePath;
    static String mainModule;
    static Require require;
    private static SecurityProxy securityImpl;
    public static ShellContextFactory shellContextFactory = new ShellContextFactory();
    public static Global global = new Global();
    protected static int exitCode = 0;
    static boolean processStdin = true;
    static List<String> fileList = new ArrayList();
    static boolean sandboxed = false;
    static boolean useRequire = false;
    private static final ScriptCache scriptCache = new ScriptCache(32);

    static {
        global.initQuitAction(new IProxy(3));
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Main$IProxy.class */
    private static class IProxy implements ContextAction, QuitAction {
        private static final int PROCESS_FILES = 1;
        private static final int EVAL_INLINE_SCRIPT = 2;
        private static final int SYSTEM_EXIT = 3;
        private int type;
        String[] args;
        String scriptText;

        IProxy(int type) {
            this.type = type;
        }

        @Override // org.mozilla.javascript.ContextAction
        public Object run(Context cx) {
            if (Main.useRequire) {
                Main.require = Main.global.installRequire(cx, Main.modulePath, Main.sandboxed);
            }
            if (this.type == 1) {
                Main.processFiles(cx, this.args);
                return null;
            }
            if (this.type == 2) {
                Main.evalInlineScript(cx, this.scriptText);
                return null;
            }
            throw Kit.codeBug();
        }

        @Override // org.mozilla.javascript.tools.shell.QuitAction
        public void quit(Context cx, int exitCode) {
            if (this.type == 3) {
                System.exit(exitCode);
                return;
            }
            throw Kit.codeBug();
        }
    }

    public static void main(String[] args) {
        try {
            if (Boolean.getBoolean("rhino.use_java_policy_security")) {
                initJavaPolicySecuritySupport();
            }
        } catch (SecurityException ex) {
            ex.printStackTrace(System.err);
        }
        int result = exec(args);
        if (result != 0) {
            System.exit(result);
        }
    }

    public static int exec(String[] origArgs) {
        errorReporter = new ToolErrorReporter(false, global.getErr());
        shellContextFactory.setErrorReporter(errorReporter);
        String[] args = processOptions(origArgs);
        if (exitCode > 0) {
            return exitCode;
        }
        if (processStdin) {
            fileList.add(null);
        }
        if (!global.initialized) {
            global.init(shellContextFactory);
        }
        IProxy iproxy = new IProxy(1);
        iproxy.args = args;
        shellContextFactory.call(iproxy);
        return exitCode;
    }

    static void processFiles(Context cx, String[] args) {
        Object[] array = new Object[args.length];
        System.arraycopy(args, 0, array, 0, args.length);
        Scriptable argsObj = cx.newArray(global, array);
        global.defineProperty("arguments", argsObj, 2);
        for (String file : fileList) {
            try {
                processSource(cx, file);
            } catch (IOException ioex) {
                Context.reportError(ToolErrorReporter.getMessage("msg.couldnt.read.source", file, ioex.getMessage()));
                exitCode = 4;
            } catch (VirtualMachineError ex) {
                ex.printStackTrace();
                String msg = ToolErrorReporter.getMessage("msg.uncaughtJSException", ex.toString());
                Context.reportError(msg);
                exitCode = 3;
            } catch (RhinoException rex) {
                ToolErrorReporter.reportException(cx.getErrorReporter(), rex);
                exitCode = 3;
            }
        }
    }

    static void evalInlineScript(Context cx, String scriptText) {
        try {
            Script script = cx.compileString(scriptText, "<command>", 1, null);
            if (script != null) {
                script.exec(cx, getShellScope());
            }
        } catch (VirtualMachineError ex) {
            ex.printStackTrace();
            String msg = ToolErrorReporter.getMessage("msg.uncaughtJSException", ex.toString());
            Context.reportError(msg);
            exitCode = 3;
        } catch (RhinoException rex) {
            ToolErrorReporter.reportException(cx.getErrorReporter(), rex);
            exitCode = 3;
        }
    }

    public static Global getGlobal() {
        return global;
    }

    static Scriptable getShellScope() {
        return getScope(null);
    }

    static Scriptable getScope(String path) {
        URI uri;
        if (useRequire) {
            if (path == null) {
                uri = new File(System.getProperty("user.dir")).toURI();
            } else if (SourceReader.toUrl(path) != null) {
                try {
                    uri = new URI(path);
                } catch (URISyntaxException e) {
                    uri = new File(path).toURI();
                }
            } else {
                uri = new File(path).toURI();
            }
            return new ModuleScope(global, uri, null);
        }
        return global;
    }

    public static String[] processOptions(String[] args) {
        String usageError;
        int i = 0;
        while (i != args.length) {
            String arg = args[i];
            if (!arg.startsWith("-")) {
                processStdin = false;
                fileList.add(arg);
                mainModule = arg;
                String[] result = new String[(args.length - i) - 1];
                System.arraycopy(args, i + 1, result, 0, (args.length - i) - 1);
                return result;
            }
            if (arg.equals("-version")) {
                i++;
                if (i == args.length) {
                    usageError = arg;
                } else {
                    try {
                        int version = Integer.parseInt(args[i]);
                        if (!Context.isValidLanguageVersion(version)) {
                            usageError = args[i];
                        } else {
                            shellContextFactory.setLanguageVersion(version);
                            i++;
                        }
                    } catch (NumberFormatException e) {
                        usageError = args[i];
                    }
                }
                global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                exitCode = 1;
                return null;
            }
            if (arg.equals("-opt") || arg.equals("-O")) {
                i++;
                if (i == args.length) {
                    usageError = arg;
                } else {
                    try {
                        int opt = Integer.parseInt(args[i]);
                        if (opt == -2) {
                            opt = -1;
                        } else if (!Context.isValidOptimizationLevel(opt)) {
                            usageError = args[i];
                        }
                        shellContextFactory.setOptimizationLevel(opt);
                        i++;
                    } catch (NumberFormatException e2) {
                        usageError = args[i];
                    }
                }
                global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                exitCode = 1;
                return null;
            }
            if (arg.equals("-encoding")) {
                i++;
                if (i == args.length) {
                    usageError = arg;
                    global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                    global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                    exitCode = 1;
                    return null;
                }
                String enc = args[i];
                shellContextFactory.setCharacterEncoding(enc);
                i++;
            } else {
                if (arg.equals("-strict")) {
                    shellContextFactory.setStrictMode(true);
                    shellContextFactory.setAllowReservedKeywords(false);
                    errorReporter.setIsReportingWarnings(true);
                } else if (arg.equals("-fatal-warnings")) {
                    shellContextFactory.setWarningAsError(true);
                } else if (arg.equals("-e")) {
                    processStdin = false;
                    i++;
                    if (i == args.length) {
                        usageError = arg;
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                        exitCode = 1;
                        return null;
                    }
                    if (!global.initialized) {
                        global.init(shellContextFactory);
                    }
                    IProxy iproxy = new IProxy(2);
                    iproxy.scriptText = args[i];
                    shellContextFactory.call(iproxy);
                } else if (arg.equals("-require")) {
                    useRequire = true;
                } else if (arg.equals("-sandbox")) {
                    sandboxed = true;
                    useRequire = true;
                } else if (arg.equals("-modules")) {
                    i++;
                    if (i == args.length) {
                        usageError = arg;
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                        exitCode = 1;
                        return null;
                    }
                    if (modulePath == null) {
                        modulePath = new ArrayList();
                    }
                    modulePath.add(args[i]);
                    useRequire = true;
                } else if (arg.equals("-w")) {
                    errorReporter.setIsReportingWarnings(true);
                } else if (arg.equals("-f")) {
                    processStdin = false;
                    i++;
                    if (i == args.length) {
                        usageError = arg;
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                        exitCode = 1;
                        return null;
                    }
                    if (args[i].equals("-")) {
                        fileList.add(null);
                    } else {
                        fileList.add(args[i]);
                        mainModule = args[i];
                    }
                } else if (arg.equals("-sealedlib")) {
                    global.setSealedStdLib(true);
                } else if (arg.equals("-debug")) {
                    shellContextFactory.setGeneratingDebug(true);
                } else {
                    if (arg.equals("-?") || arg.equals("-help")) {
                        global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                        exitCode = 1;
                        return null;
                    }
                    usageError = arg;
                    global.getOut().println(ToolErrorReporter.getMessage("msg.shell.invalid", usageError));
                    global.getOut().println(ToolErrorReporter.getMessage("msg.shell.usage", Main.class.getName()));
                    exitCode = 1;
                    return null;
                }
                i++;
            }
        }
        return new String[0];
    }

    private static void initJavaPolicySecuritySupport() {
        Throwable exObj;
        try {
            Class<?> cl = Class.forName("org.mozilla.javascript.tools.shell.JavaPolicySecurity");
            securityImpl = (SecurityProxy) cl.newInstance();
            SecurityController.initGlobal(securityImpl);
        } catch (ClassNotFoundException ex) {
            exObj = ex;
            throw Kit.initCause(new IllegalStateException("Can not load security support: " + exObj), exObj);
        } catch (IllegalAccessException ex2) {
            exObj = ex2;
            throw Kit.initCause(new IllegalStateException("Can not load security support: " + exObj), exObj);
        } catch (InstantiationException ex3) {
            exObj = ex3;
            throw Kit.initCause(new IllegalStateException("Can not load security support: " + exObj), exObj);
        } catch (LinkageError ex4) {
            exObj = ex4;
            throw Kit.initCause(new IllegalStateException("Can not load security support: " + exObj), exObj);
        }
    }

    public static void processSource(Context cx, String filename) throws IOException {
        Charset cs;
        if (filename != null && !filename.equals("-")) {
            if (useRequire && filename.equals(mainModule)) {
                require.requireMain(cx, filename);
                return;
            } else {
                processFile(cx, getScope(filename), filename);
                return;
            }
        }
        Scriptable scope = getShellScope();
        String charEnc = shellContextFactory.getCharacterEncoding();
        if (charEnc != null) {
            cs = Charset.forName(charEnc);
        } else {
            cs = Charset.defaultCharset();
        }
        ShellConsole console = global.getConsole(cs);
        if (filename == null) {
            console.println(cx.getImplementationVersion());
        }
        int lineno = 1;
        boolean hitEOF = false;
        while (!hitEOF) {
            String[] prompts = global.getPrompts(cx);
            String prompt = null;
            if (filename == null) {
                prompt = prompts[0];
            }
            console.flush();
            String source = "";
            while (true) {
                try {
                    String newline = console.readLine(prompt);
                    if (newline == null) {
                        hitEOF = true;
                        break;
                    }
                    source = source + newline + "\n";
                    lineno++;
                    if (!cx.stringIsCompilableUnit(source)) {
                        prompt = prompts[1];
                    }
                } catch (IOException ioe) {
                    console.println(ioe.toString());
                }
            }
            try {
                Script script = cx.compileString(source, "<stdin>", lineno, null);
                if (script != null) {
                    Object result = script.exec(cx, scope);
                    if (result != Context.getUndefinedValue() && (!(result instanceof Function) || !source.trim().startsWith("function"))) {
                        try {
                            console.println(Context.toString(result));
                        } catch (RhinoException rex) {
                            ToolErrorReporter.reportException(cx.getErrorReporter(), rex);
                        }
                    }
                    NativeArray nativeArray = global.history;
                    nativeArray.put((int) nativeArray.getLength(), nativeArray, source);
                }
            } catch (VirtualMachineError ex) {
                ex.printStackTrace();
                String msg = ToolErrorReporter.getMessage("msg.uncaughtJSException", ex.toString());
                Context.reportError(msg);
                exitCode = 3;
            } catch (RhinoException rex2) {
                ToolErrorReporter.reportException(cx.getErrorReporter(), rex2);
                exitCode = 3;
            }
        }
        console.println();
        console.flush();
    }

    public static void processFileNoThrow(Context cx, Scriptable scope, String filename) {
        try {
            processFile(cx, scope, filename);
        } catch (IOException ioex) {
            Context.reportError(ToolErrorReporter.getMessage("msg.couldnt.read.source", filename, ioex.getMessage()));
            exitCode = 4;
        } catch (VirtualMachineError ex) {
            ex.printStackTrace();
            String msg = ToolErrorReporter.getMessage("msg.uncaughtJSException", ex.toString());
            Context.reportError(msg);
            exitCode = 3;
        } catch (RhinoException rex) {
            ToolErrorReporter.reportException(cx.getErrorReporter(), rex);
            exitCode = 3;
        }
    }

    public static void processFile(Context cx, Scriptable scope, String filename) throws IOException {
        if (securityImpl == null) {
            processFileSecure(cx, scope, filename, null);
        } else {
            securityImpl.callProcessFileSecure(cx, scope, filename);
        }
    }

    static void processFileSecure(Context cx, Scriptable scope, String path, Object securityDomain) throws IOException {
        boolean isClass = path.endsWith(".class");
        Object source = readFileOrUrl(path, !isClass);
        byte[] digest = getDigest(source);
        String key = path + "_" + cx.getOptimizationLevel();
        ScriptReference ref = scriptCache.get(key, digest);
        Script script = ref != null ? ref.get() : null;
        if (script == null) {
            if (isClass) {
                script = loadCompiledScript(cx, path, (byte[]) source, securityDomain);
            } else {
                String strSrc = (String) source;
                if (strSrc.length() > 0 && strSrc.charAt(0) == '#') {
                    for (int i = 1; i != strSrc.length(); i++) {
                        int c = strSrc.charAt(i);
                        if (c == 10 || c == 13) {
                            strSrc = strSrc.substring(i);
                            break;
                        }
                    }
                }
                script = cx.compileString(strSrc, path, 1, securityDomain);
            }
            scriptCache.put(key, digest, script);
        }
        if (script != null) {
            script.exec(cx, scope);
        }
    }

    private static byte[] getDigest(Object source) {
        byte[] bytes;
        byte[] digest = null;
        if (source != null) {
            if (source instanceof String) {
                try {
                    bytes = ((String) source).getBytes("UTF-8");
                } catch (UnsupportedEncodingException e) {
                    bytes = ((String) source).getBytes();
                }
            } else {
                bytes = (byte[]) source;
            }
            try {
                MessageDigest md = MessageDigest.getInstance("MD5");
                digest = md.digest(bytes);
            } catch (NoSuchAlgorithmException nsa) {
                throw new RuntimeException(nsa);
            }
        }
        return digest;
    }

    private static Script loadCompiledScript(Context cx, String path, byte[] data, Object securityDomain) throws FileNotFoundException {
        int nameStart;
        if (data == null) {
            throw new FileNotFoundException(path);
        }
        int nameStart2 = path.lastIndexOf(47);
        if (nameStart2 < 0) {
            nameStart = 0;
        } else {
            nameStart = nameStart2 + 1;
        }
        int nameEnd = path.lastIndexOf(46);
        if (nameEnd < nameStart) {
            nameEnd = path.length();
        }
        String name = path.substring(nameStart, nameEnd);
        try {
            GeneratedClassLoader loader = SecurityController.createLoader(cx.getApplicationClassLoader(), securityDomain);
            Class<?> clazz = loader.defineClass(name, data);
            loader.linkClass(clazz);
            if (!Script.class.isAssignableFrom(clazz)) {
                throw Context.reportRuntimeError("msg.must.implement.Script");
            }
            return (Script) clazz.newInstance();
        } catch (IllegalAccessException iaex) {
            Context.reportError(iaex.toString());
            throw new RuntimeException(iaex);
        } catch (InstantiationException inex) {
            Context.reportError(inex.toString());
            throw new RuntimeException(inex);
        }
    }

    public static InputStream getIn() {
        return getGlobal().getIn();
    }

    public static void setIn(InputStream in) {
        getGlobal().setIn(in);
    }

    public static PrintStream getOut() {
        return getGlobal().getOut();
    }

    public static void setOut(PrintStream out) {
        getGlobal().setOut(out);
    }

    public static PrintStream getErr() {
        return getGlobal().getErr();
    }

    public static void setErr(PrintStream err) {
        getGlobal().setErr(err);
    }

    private static Object readFileOrUrl(String path, boolean convertToString) throws IOException {
        return SourceReader.readFileOrUrl(path, convertToString, shellContextFactory.getCharacterEncoding());
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Main$ScriptReference.class */
    static class ScriptReference extends SoftReference<Script> {
        String path;
        byte[] digest;

        ScriptReference(String path, byte[] digest, Script script, ReferenceQueue<Script> queue) {
            super(script, queue);
            this.path = path;
            this.digest = digest;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Main$ScriptCache.class */
    static class ScriptCache extends LinkedHashMap<String, ScriptReference> {
        ReferenceQueue<Script> queue;
        int capacity;

        ScriptCache(int capacity) {
            super(capacity + 1, 2.0f, true);
            this.capacity = capacity;
            this.queue = new ReferenceQueue<>();
        }

        @Override // java.util.LinkedHashMap
        protected boolean removeEldestEntry(Map.Entry<String, ScriptReference> eldest) {
            return size() > this.capacity;
        }

        ScriptReference get(String path, byte[] digest) {
            while (true) {
                ScriptReference ref = (ScriptReference) this.queue.poll();
                if (ref == null) {
                    break;
                }
                remove(ref.path);
            }
            ScriptReference ref2 = get(path);
            if (ref2 != null && !Arrays.equals(digest, ref2.digest)) {
                remove(ref2.path);
                ref2 = null;
            }
            return ref2;
        }

        void put(String path, byte[] digest, Script script) {
            put(path, new ScriptReference(path, digest, script, this.queue));
        }
    }
}
