package org.mozilla.javascript.tools.shell;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInputStream;
import java.io.OutputStream;
import java.io.PrintStream;
import java.io.Reader;
import java.lang.reflect.InvocationTargetException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextAction;
import org.mozilla.javascript.ContextFactory;
import org.mozilla.javascript.ErrorReporter;
import org.mozilla.javascript.Function;
import org.mozilla.javascript.ImporterTopLevel;
import org.mozilla.javascript.NativeArray;
import org.mozilla.javascript.RhinoException;
import org.mozilla.javascript.Script;
import org.mozilla.javascript.ScriptRuntime;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;
import org.mozilla.javascript.Synchronizer;
import org.mozilla.javascript.Undefined;
import org.mozilla.javascript.Wrapper;
import org.mozilla.javascript.commonjs.module.Require;
import org.mozilla.javascript.commonjs.module.RequireBuilder;
import org.mozilla.javascript.commonjs.module.provider.SoftCachingModuleScriptProvider;
import org.mozilla.javascript.commonjs.module.provider.UrlModuleSourceProvider;
import org.mozilla.javascript.serialize.ScriptableInputStream;
import org.mozilla.javascript.serialize.ScriptableOutputStream;
import org.mozilla.javascript.tools.ToolErrorReporter;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/shell/Global.class */
public class Global extends ImporterTopLevel {
    static final long serialVersionUID = 4029130780977538005L;
    NativeArray history;
    boolean attemptedJLineLoad;
    private ShellConsole console;
    private InputStream inStream;
    private PrintStream outStream;
    private PrintStream errStream;
    boolean initialized;
    private QuitAction quitAction;
    private HashMap<String, String> doctestCanonicalizations;
    private boolean sealedStdLib = false;
    private String[] prompts = {"js> ", "  > "};

    public Global() {
    }

    public Global(Context cx) {
        init(cx);
    }

    public boolean isInitialized() {
        return this.initialized;
    }

    public void initQuitAction(QuitAction quitAction) {
        if (quitAction == null) {
            throw new IllegalArgumentException("quitAction is null");
        }
        if (this.quitAction != null) {
            throw new IllegalArgumentException("The method is once-call.");
        }
        this.quitAction = quitAction;
    }

    public void init(ContextFactory factory) {
        factory.call(new ContextAction() { // from class: org.mozilla.javascript.tools.shell.Global.1
            @Override // org.mozilla.javascript.ContextAction
            public Object run(Context cx) {
                Global.this.init(cx);
                return null;
            }
        });
    }

    public void init(Context cx) {
        initStandardObjects(cx, this.sealedStdLib);
        String[] names = {"defineClass", "deserialize", "doctest", "gc", "help", "load", "loadClass", "print", "quit", "readline", "readFile", "readUrl", "runCommand", "seal", "serialize", "spawn", "sync", "toint32", "version", "write"};
        defineFunctionProperties(names, Global.class, 2);
        Environment.defineClass(this);
        Environment environment = new Environment(this);
        defineProperty("environment", environment, 2);
        this.history = (NativeArray) cx.newArray(this, 0);
        defineProperty("history", this.history, 2);
        this.initialized = true;
    }

    public Require installRequire(Context cx, List<String> modulePath, boolean sandboxed) {
        RequireBuilder rb = new RequireBuilder();
        rb.setSandboxed(sandboxed);
        List<URI> uris = new ArrayList<>();
        if (modulePath != null) {
            for (String path : modulePath) {
                try {
                    URI uri = new URI(path);
                    if (!uri.isAbsolute()) {
                        uri = new File(path).toURI().resolve("");
                    }
                    if (!uri.toString().endsWith("/")) {
                        uri = new URI(uri + "/");
                    }
                    uris.add(uri);
                } catch (URISyntaxException usx) {
                    throw new RuntimeException(usx);
                }
            }
        }
        rb.setModuleScriptProvider(new SoftCachingModuleScriptProvider(new UrlModuleSourceProvider(uris, null)));
        Require require = rb.createRequire(cx, this);
        require.install(this);
        return require;
    }

    public static void help(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        PrintStream out = getInstance(funObj).getOut();
        out.println(ToolErrorReporter.getMessage("msg.help"));
    }

    public static void gc(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        System.gc();
    }

    public static Object print(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        return doPrint(args, funObj, true);
    }

    public static Object write(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        return doPrint(args, funObj, false);
    }

    private static Object doPrint(Object[] args, Function funObj, boolean newline) {
        PrintStream out = getInstance(funObj).getOut();
        for (int i = 0; i < args.length; i++) {
            if (i > 0) {
                out.print(" ");
            }
            String s = Context.toString(args[i]);
            out.print(s);
        }
        if (newline) {
            out.println();
        }
        return Context.getUndefinedValue();
    }

    public static void quit(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        Global global = getInstance(funObj);
        if (global.quitAction != null) {
            int exitCode = args.length == 0 ? 0 : ScriptRuntime.toInt32(args[0]);
            global.quitAction.quit(cx, exitCode);
        }
    }

    public static double version(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        double result = cx.getLanguageVersion();
        if (args.length > 0) {
            double d = Context.toNumber(args[0]);
            cx.setLanguageVersion((int) d);
        }
        return result;
    }

    public static void load(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        for (Object arg : args) {
            String file = Context.toString(arg);
            try {
                Main.processFile(cx, thisObj, file);
            } catch (IOException ioex) {
                String msg = ToolErrorReporter.getMessage("msg.couldnt.read.source", file, ioex.getMessage());
                throw Context.reportRuntimeError(msg);
            } catch (VirtualMachineError ex) {
                ex.printStackTrace();
                String msg2 = ToolErrorReporter.getMessage("msg.uncaughtJSException", ex.toString());
                throw Context.reportRuntimeError(msg2);
            }
        }
    }

    public static void defineClass(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IllegalAccessException, InstantiationException, InvocationTargetException {
        Class<?> clazz = getClass(args);
        if (!Scriptable.class.isAssignableFrom(clazz)) {
            throw reportRuntimeError("msg.must.implement.Scriptable");
        }
        ScriptableObject.defineClass(thisObj, clazz);
    }

    public static void loadClass(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IllegalAccessException, InstantiationException {
        Class<?> clazz = getClass(args);
        if (!Script.class.isAssignableFrom(clazz)) {
            throw reportRuntimeError("msg.must.implement.Script");
        }
        Script script = (Script) clazz.newInstance();
        script.exec(cx, thisObj);
    }

    private static Class<?> getClass(Object[] args) {
        if (args.length == 0) {
            throw reportRuntimeError("msg.expected.string.arg");
        }
        Object arg0 = args[0];
        if (arg0 instanceof Wrapper) {
            Object wrapped = ((Wrapper) arg0).unwrap();
            if (wrapped instanceof Class) {
                return (Class) wrapped;
            }
        }
        String className = Context.toString(args[0]);
        try {
            return Class.forName(className);
        } catch (ClassNotFoundException e) {
            throw reportRuntimeError("msg.class.not.found", className);
        }
    }

    public static void serialize(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException {
        if (args.length < 2) {
            throw Context.reportRuntimeError("Expected an object to serialize and a filename to write the serialization to");
        }
        Object obj = args[0];
        String filename = Context.toString(args[1]);
        FileOutputStream fos = new FileOutputStream(filename);
        Scriptable scope = ScriptableObject.getTopLevelScope(thisObj);
        ScriptableOutputStream out = new ScriptableOutputStream(fos, scope);
        out.writeObject(obj);
        out.close();
    }

    public static Object deserialize(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException, ClassNotFoundException {
        if (args.length < 1) {
            throw Context.reportRuntimeError("Expected a filename to read the serialization from");
        }
        String filename = Context.toString(args[0]);
        FileInputStream fis = new FileInputStream(filename);
        Scriptable scope = ScriptableObject.getTopLevelScope(thisObj);
        ObjectInputStream in = new ScriptableInputStream(fis, scope);
        Object deserialized = in.readObject();
        in.close();
        return Context.toObject(deserialized, scope);
    }

    public String[] getPrompts(Context cx) {
        if (ScriptableObject.hasProperty(this, "prompts")) {
            Object promptsJS = ScriptableObject.getProperty(this, "prompts");
            if (promptsJS instanceof Scriptable) {
                Scriptable s = (Scriptable) promptsJS;
                if (ScriptableObject.hasProperty(s, 0) && ScriptableObject.hasProperty(s, 1)) {
                    Object elem0 = ScriptableObject.getProperty(s, 0);
                    if (elem0 instanceof Function) {
                        elem0 = ((Function) elem0).call(cx, this, s, new Object[0]);
                    }
                    this.prompts[0] = Context.toString(elem0);
                    Object elem1 = ScriptableObject.getProperty(s, 1);
                    if (elem1 instanceof Function) {
                        elem1 = ((Function) elem1).call(cx, this, s, new Object[0]);
                    }
                    this.prompts[1] = Context.toString(elem1);
                }
            }
        }
        return this.prompts;
    }

    public static Object doctest(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        if (args.length == 0) {
            return Boolean.FALSE;
        }
        String session = Context.toString(args[0]);
        Global global = getInstance(funObj);
        return new Integer(global.runDoctest(cx, global, session, null, 0));
    }

    public int runDoctest(Context cx, Scriptable scope, String session, String sourceName, int lineNumber) {
        String inputString;
        String resultString;
        this.doctestCanonicalizations = new HashMap<>();
        String[] lines = session.split("\r\n?|\n");
        String prompt0 = this.prompts[0].trim();
        String prompt1 = this.prompts[1].trim();
        int testCount = 0;
        int i = 0;
        while (i < lines.length && !lines[i].trim().startsWith(prompt0)) {
            i++;
        }
        while (i < lines.length) {
            String str = lines[i].trim().substring(prompt0.length()) + "\n";
            while (true) {
                inputString = str;
                i++;
                if (i >= lines.length || !lines[i].trim().startsWith(prompt1)) {
                    break;
                }
                str = (inputString + lines[i].trim().substring(prompt1.length())) + "\n";
            }
            String expectedString = "";
            while (i < lines.length && !lines[i].trim().startsWith(prompt0)) {
                expectedString = expectedString + lines[i] + "\n";
                i++;
            }
            PrintStream savedOut = getOut();
            PrintStream savedErr = getErr();
            ByteArrayOutputStream out = new ByteArrayOutputStream();
            ByteArrayOutputStream err = new ByteArrayOutputStream();
            setOut(new PrintStream(out));
            setErr(new PrintStream(err));
            String resultString2 = "";
            ErrorReporter savedErrorReporter = cx.getErrorReporter();
            cx.setErrorReporter(new ToolErrorReporter(false, getErr()));
            try {
                try {
                    testCount++;
                    Object result = cx.evaluateString(scope, inputString, "doctest input", 1, null);
                    if (result != Context.getUndefinedValue() && (!(result instanceof Function) || !inputString.trim().startsWith("function"))) {
                        resultString2 = Context.toString(result);
                    }
                    setOut(savedOut);
                    setErr(savedErr);
                    cx.setErrorReporter(savedErrorReporter);
                    resultString = resultString2 + err.toString() + out.toString();
                } catch (RhinoException e) {
                    ToolErrorReporter.reportException(cx.getErrorReporter(), e);
                    setOut(savedOut);
                    setErr(savedErr);
                    cx.setErrorReporter(savedErrorReporter);
                    resultString = resultString2 + err.toString() + out.toString();
                }
                if (!doctestOutputMatches(expectedString, resultString)) {
                    String message = "doctest failure running:\n" + inputString + "expected: " + expectedString + "actual: " + resultString + "\n";
                    if (sourceName != null) {
                        throw Context.reportRuntimeError(message, sourceName, (lineNumber + i) - 1, null, 0);
                    }
                    throw Context.reportRuntimeError(message);
                }
            } catch (Throwable th) {
                setOut(savedOut);
                setErr(savedErr);
                cx.setErrorReporter(savedErrorReporter);
                String str2 = resultString2 + err.toString() + out.toString();
                throw th;
            }
        }
        return testCount;
    }

    private boolean doctestOutputMatches(String expected, String actual) {
        String expected2 = expected.trim();
        String actual2 = actual.trim().replace("\r\n", "\n");
        if (expected2.equals(actual2)) {
            return true;
        }
        for (Map.Entry<String, String> entry : this.doctestCanonicalizations.entrySet()) {
            expected2 = expected2.replace(entry.getKey(), entry.getValue());
        }
        if (expected2.equals(actual2)) {
            return true;
        }
        Pattern p = Pattern.compile("@[0-9a-fA-F]+");
        Matcher expectedMatcher = p.matcher(expected2);
        Matcher actualMatcher = p.matcher(actual2);
        while (expectedMatcher.find() && actualMatcher.find() && actualMatcher.start() == expectedMatcher.start()) {
            int start = expectedMatcher.start();
            if (!expected2.substring(0, start).equals(actual2.substring(0, start))) {
                return false;
            }
            String expectedGroup = expectedMatcher.group();
            String actualGroup = actualMatcher.group();
            String mapping = this.doctestCanonicalizations.get(expectedGroup);
            if (mapping == null) {
                this.doctestCanonicalizations.put(expectedGroup, actualGroup);
                expected2 = expected2.replace(expectedGroup, actualGroup);
            } else if (!actualGroup.equals(mapping)) {
                return false;
            }
            if (expected2.equals(actual2)) {
                return true;
            }
        }
        return false;
    }

    public static Object spawn(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        Runner runner;
        Scriptable scope = funObj.getParentScope();
        if (args.length != 0 && (args[0] instanceof Function)) {
            Object[] newArgs = null;
            if (args.length > 1 && (args[1] instanceof Scriptable)) {
                newArgs = cx.getElements((Scriptable) args[1]);
            }
            if (newArgs == null) {
                newArgs = ScriptRuntime.emptyArgs;
            }
            runner = new Runner(scope, (Function) args[0], newArgs);
        } else if (args.length != 0 && (args[0] instanceof Script)) {
            runner = new Runner(scope, (Script) args[0]);
        } else {
            throw reportRuntimeError("msg.spawn.args");
        }
        runner.factory = cx.getFactory();
        Thread thread = new Thread(runner);
        thread.start();
        return thread;
    }

    public static Object sync(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        if (args.length >= 1 && args.length <= 2 && (args[0] instanceof Function)) {
            Object syncObject = null;
            if (args.length == 2 && args[1] != Undefined.instance) {
                syncObject = args[1];
            }
            return new Synchronizer((Function) args[0], syncObject);
        }
        throw reportRuntimeError("msg.sync.args");
    }

    public static Object runCommand(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException {
        String key;
        Object val;
        int L = args.length;
        if (L == 0 || (L == 1 && (args[0] instanceof Scriptable))) {
            throw reportRuntimeError("msg.runCommand.bad.args");
        }
        File wd = null;
        InputStream in = null;
        OutputStream out = null;
        OutputStream err = null;
        ByteArrayOutputStream outBytes = null;
        ByteArrayOutputStream errBytes = null;
        Object outObj = null;
        Object errObj = null;
        String[] environment = null;
        Scriptable params = null;
        Object[] addArgs = null;
        if (args[L - 1] instanceof Scriptable) {
            params = (Scriptable) args[L - 1];
            L--;
            Object envObj = ScriptableObject.getProperty(params, "env");
            if (envObj != Scriptable.NOT_FOUND) {
                if (envObj == null) {
                    environment = new String[0];
                } else {
                    if (!(envObj instanceof Scriptable)) {
                        throw reportRuntimeError("msg.runCommand.bad.env");
                    }
                    Scriptable envHash = (Scriptable) envObj;
                    Object[] ids = ScriptableObject.getPropertyIds(envHash);
                    environment = new String[ids.length];
                    for (int i = 0; i != ids.length; i++) {
                        Object keyObj = ids[i];
                        if (keyObj instanceof String) {
                            key = (String) keyObj;
                            val = ScriptableObject.getProperty(envHash, key);
                        } else {
                            int ikey = ((Number) keyObj).intValue();
                            key = Integer.toString(ikey);
                            val = ScriptableObject.getProperty(envHash, ikey);
                        }
                        if (val == ScriptableObject.NOT_FOUND) {
                            val = Undefined.instance;
                        }
                        environment[i] = key + '=' + ScriptRuntime.toString(val);
                    }
                }
            }
            Object wdObj = ScriptableObject.getProperty(params, "dir");
            if (wdObj != Scriptable.NOT_FOUND) {
                wd = new File(ScriptRuntime.toString(wdObj));
            }
            Object inObj = ScriptableObject.getProperty(params, "input");
            if (inObj != Scriptable.NOT_FOUND) {
                in = toInputStream(inObj);
            }
            outObj = ScriptableObject.getProperty(params, "output");
            if (outObj != Scriptable.NOT_FOUND) {
                out = toOutputStream(outObj);
                if (out == null) {
                    outBytes = new ByteArrayOutputStream();
                    out = outBytes;
                }
            }
            errObj = ScriptableObject.getProperty(params, "err");
            if (errObj != Scriptable.NOT_FOUND) {
                err = toOutputStream(errObj);
                if (err == null) {
                    errBytes = new ByteArrayOutputStream();
                    err = errBytes;
                }
            }
            Object addArgsObj = ScriptableObject.getProperty(params, "args");
            if (addArgsObj != Scriptable.NOT_FOUND) {
                Scriptable s = Context.toObject(addArgsObj, getTopLevelScope(thisObj));
                addArgs = cx.getElements(s);
            }
        }
        Global global = getInstance(funObj);
        if (out == null) {
            out = global != null ? global.getOut() : System.out;
        }
        if (err == null) {
            err = global != null ? global.getErr() : System.err;
        }
        String[] cmd = new String[addArgs == null ? L : L + addArgs.length];
        for (int i2 = 0; i2 != L; i2++) {
            cmd[i2] = ScriptRuntime.toString(args[i2]);
        }
        if (addArgs != null) {
            for (int i3 = 0; i3 != addArgs.length; i3++) {
                cmd[L + i3] = ScriptRuntime.toString(addArgs[i3]);
            }
        }
        int exitCode = runProcess(cmd, environment, wd, in, out, err);
        if (outBytes != null) {
            String s2 = ScriptRuntime.toString(outObj) + outBytes.toString();
            ScriptableObject.putProperty(params, "output", s2);
        }
        if (errBytes != null) {
            String s3 = ScriptRuntime.toString(errObj) + errBytes.toString();
            ScriptableObject.putProperty(params, "err", s3);
        }
        return new Integer(exitCode);
    }

    public static void seal(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        for (int i = 0; i != args.length; i++) {
            Object arg = args[i];
            if (!(arg instanceof ScriptableObject) || arg == Undefined.instance) {
                if (!(arg instanceof Scriptable) || arg == Undefined.instance) {
                    throw reportRuntimeError("msg.shell.seal.not.object");
                }
                throw reportRuntimeError("msg.shell.seal.not.scriptable");
            }
        }
        for (int i2 = 0; i2 != args.length; i2++) {
            ((ScriptableObject) args[i2]).sealObject();
        }
    }

    public static Object readFile(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException {
        if (args.length == 0) {
            throw reportRuntimeError("msg.shell.readFile.bad.args");
        }
        String path = ScriptRuntime.toString(args[0]);
        String charCoding = null;
        if (args.length >= 2) {
            charCoding = ScriptRuntime.toString(args[1]);
        }
        return readUrl(path, charCoding, true);
    }

    public static Object readUrl(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException {
        if (args.length == 0) {
            throw reportRuntimeError("msg.shell.readUrl.bad.args");
        }
        String url = ScriptRuntime.toString(args[0]);
        String charCoding = null;
        if (args.length >= 2) {
            charCoding = ScriptRuntime.toString(args[1]);
        }
        return readUrl(url, charCoding, false);
    }

    public static Object toint32(Context cx, Scriptable thisObj, Object[] args, Function funObj) {
        Object arg = args.length != 0 ? args[0] : Undefined.instance;
        if (arg instanceof Integer) {
            return arg;
        }
        return ScriptRuntime.wrapInt(ScriptRuntime.toInt32(arg));
    }

    private boolean loadJLine(Charset cs) {
        if (!this.attemptedJLineLoad) {
            this.attemptedJLineLoad = true;
            this.console = ShellConsole.getConsole(this, cs);
        }
        return this.console != null;
    }

    public ShellConsole getConsole(Charset cs) {
        if (!loadJLine(cs)) {
            this.console = ShellConsole.getConsole(getIn(), getErr(), cs);
        }
        return this.console;
    }

    public InputStream getIn() {
        if (this.inStream == null && !this.attemptedJLineLoad && loadJLine(Charset.defaultCharset())) {
            this.inStream = this.console.getIn();
        }
        return this.inStream == null ? System.in : this.inStream;
    }

    public void setIn(InputStream in) {
        this.inStream = in;
    }

    public PrintStream getOut() {
        return this.outStream == null ? System.out : this.outStream;
    }

    public void setOut(PrintStream out) {
        this.outStream = out;
    }

    public PrintStream getErr() {
        return this.errStream == null ? System.err : this.errStream;
    }

    public void setErr(PrintStream err) {
        this.errStream = err;
    }

    public void setSealedStdLib(boolean value) {
        this.sealedStdLib = value;
    }

    private static Global getInstance(Function function) {
        Scriptable scope = function.getParentScope();
        if (!(scope instanceof Global)) {
            throw reportRuntimeError("msg.bad.shell.function.scope", String.valueOf(scope));
        }
        return (Global) scope;
    }

    private static int runProcess(String[] cmd, String[] environment, File wd, InputStream in, OutputStream out, OutputStream err) throws IOException {
        Process p;
        if (environment == null) {
            p = Runtime.getRuntime().exec(cmd, (String[]) null, wd);
        } else {
            p = Runtime.getRuntime().exec(cmd, environment, wd);
        }
        PipeThread inThread = null;
        try {
            if (in != null) {
                inThread = new PipeThread(false, in, p.getOutputStream());
                inThread.start();
            } else {
                p.getOutputStream().close();
            }
            PipeThread outThread = null;
            if (out != null) {
                outThread = new PipeThread(true, p.getInputStream(), out);
                outThread.start();
            } else {
                p.getInputStream().close();
            }
            PipeThread errThread = null;
            if (err != null) {
                errThread = new PipeThread(true, p.getErrorStream(), err);
                errThread.start();
            } else {
                p.getErrorStream().close();
            }
            while (true) {
                try {
                    p.waitFor();
                    if (outThread != null) {
                        outThread.join();
                    }
                    if (inThread != null) {
                        inThread.join();
                    }
                    if (errThread == null) {
                        break;
                    }
                    errThread.join();
                    break;
                } catch (InterruptedException e) {
                }
            }
            int exitValue = p.exitValue();
            p.destroy();
            return exitValue;
        } catch (Throwable th) {
            p.destroy();
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:21:0x006a A[Catch: IOException -> 0x0078, DONT_GENERATE, TryCatch #0 {IOException -> 0x0078, blocks: (B:21:0x006a, B:22:0x0071), top: B:36:0x0067 }] */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0071 A[Catch: IOException -> 0x0078, DONT_GENERATE, TryCatch #0 {IOException -> 0x0078, blocks: (B:21:0x006a, B:22:0x0071), top: B:36:0x0067 }] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    static void pipe(boolean r5, java.io.InputStream r6, java.io.OutputStream r7) throws java.io.IOException {
        /*
            r0 = 4096(0x1000, float:5.74E-42)
            r8 = r0
            r0 = 4096(0x1000, float:5.74E-42)
            byte[] r0 = new byte[r0]     // Catch: java.lang.Throwable -> L7c
            r9 = r0
        Lb:
            r0 = r5
            if (r0 != 0) goto L1e
            r0 = r6
            r1 = r9
            r2 = 0
            r3 = 4096(0x1000, float:5.74E-42)
            int r0 = r0.read(r1, r2, r3)     // Catch: java.lang.Throwable -> L7c
            r10 = r0
            goto L32
        L1e:
            r0 = r6
            r1 = r9
            r2 = 0
            r3 = 4096(0x1000, float:5.74E-42)
            int r0 = r0.read(r1, r2, r3)     // Catch: java.io.IOException -> L2d java.lang.Throwable -> L7c
            r10 = r0
            goto L32
        L2d:
            r11 = move-exception
            goto L66
        L32:
            r0 = r10
            if (r0 >= 0) goto L3a
            goto L66
        L3a:
            r0 = r5
            if (r0 == 0) goto L4e
            r0 = r7
            r1 = r9
            r2 = 0
            r3 = r10
            r0.write(r1, r2, r3)     // Catch: java.lang.Throwable -> L7c
            r0 = r7
            r0.flush()     // Catch: java.lang.Throwable -> L7c
            goto L63
        L4e:
            r0 = r7
            r1 = r9
            r2 = 0
            r3 = r10
            r0.write(r1, r2, r3)     // Catch: java.io.IOException -> L5e java.lang.Throwable -> L7c
            r0 = r7
            r0.flush()     // Catch: java.io.IOException -> L5e java.lang.Throwable -> L7c
            goto L63
        L5e:
            r11 = move-exception
            goto L66
        L63:
            goto Lb
        L66:
            r0 = r5
            if (r0 == 0) goto L71
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> L78
            goto L75
        L71:
            r0 = r7
            r0.close()     // Catch: java.io.IOException -> L78
        L75:
            goto L95
        L78:
            r8 = move-exception
            goto L95
        L7c:
            r12 = move-exception
            r0 = r5
            if (r0 == 0) goto L89
            r0 = r6
            r0.close()     // Catch: java.io.IOException -> L90
            goto L8d
        L89:
            r0 = r7
            r0.close()     // Catch: java.io.IOException -> L90
        L8d:
            goto L92
        L90:
            r13 = move-exception
        L92:
            r0 = r12
            throw r0
        L95:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.tools.shell.Global.pipe(boolean, java.io.InputStream, java.io.OutputStream):void");
    }

    private static InputStream toInputStream(Object value) throws IOException {
        InputStream is = null;
        String s = null;
        if (value instanceof Wrapper) {
            Object unwrapped = ((Wrapper) value).unwrap();
            if (unwrapped instanceof InputStream) {
                is = (InputStream) unwrapped;
            } else if (unwrapped instanceof byte[]) {
                is = new ByteArrayInputStream((byte[]) unwrapped);
            } else if (unwrapped instanceof Reader) {
                s = readReader((Reader) unwrapped);
            } else if (unwrapped instanceof char[]) {
                s = new String((char[]) unwrapped);
            }
        }
        if (is == null) {
            if (s == null) {
                s = ScriptRuntime.toString(value);
            }
            is = new ByteArrayInputStream(s.getBytes());
        }
        return is;
    }

    private static OutputStream toOutputStream(Object value) {
        OutputStream os = null;
        if (value instanceof Wrapper) {
            Object unwrapped = ((Wrapper) value).unwrap();
            if (unwrapped instanceof OutputStream) {
                os = (OutputStream) unwrapped;
            }
        }
        return os;
    }

    private static String readUrl(String filePath, String charCoding, boolean urlIsFile) throws IOException {
        int chunkLength;
        InputStream is;
        Reader r;
        String type;
        InputStream is2 = null;
        try {
            if (!urlIsFile) {
                URL urlObj = new URL(filePath);
                URLConnection uc = urlObj.openConnection();
                is = uc.getInputStream();
                chunkLength = uc.getContentLength();
                if (chunkLength <= 0) {
                    chunkLength = 1024;
                }
                if (charCoding == null && (type = uc.getContentType()) != null) {
                    charCoding = getCharCodingFromType(type);
                }
            } else {
                File f = new File(filePath);
                if (!f.exists()) {
                    throw new FileNotFoundException("File not found: " + filePath);
                }
                if (!f.canRead()) {
                    throw new IOException("Cannot read file: " + filePath);
                }
                long length = f.length();
                chunkLength = (int) length;
                if (chunkLength != length) {
                    throw new IOException("Too big file size: " + length);
                }
                if (chunkLength == 0) {
                    return "";
                }
                is = new FileInputStream(f);
            }
            if (charCoding == null) {
                r = new InputStreamReader(is);
            } else {
                r = new InputStreamReader(is, charCoding);
            }
            String readReader = readReader(r, chunkLength);
            if (is != null) {
                is.close();
            }
            return readReader;
        } finally {
            if (0 != 0) {
                is2.close();
            }
        }
    }

    public static Object readline(Context cx, Scriptable thisObj, Object[] args, Function funObj) throws IOException {
        Global self = getInstance(funObj);
        if (args.length > 0) {
            return self.console.readLine(Context.toString(args[0]));
        }
        return self.console.readLine();
    }

    private static String getCharCodingFromType(String type) {
        int i = type.indexOf(59);
        if (i >= 0) {
            int end = type.length();
            do {
                i++;
                if (i == end) {
                    break;
                }
            } while (type.charAt(i) <= ' ');
            if ("charset".regionMatches(true, 0, type, i, "charset".length())) {
                int i2 = i + "charset".length();
                while (i2 != end && type.charAt(i2) <= ' ') {
                    i2++;
                }
                if (i2 != end && type.charAt(i2) == '=') {
                    do {
                        i2++;
                        if (i2 == end) {
                            break;
                        }
                    } while (type.charAt(i2) <= ' ');
                    if (i2 != end) {
                        while (type.charAt(end - 1) <= ' ') {
                            end--;
                        }
                        return type.substring(i2, end);
                    }
                    return null;
                }
                return null;
            }
            return null;
        }
        return null;
    }

    private static String readReader(Reader reader) throws IOException {
        return readReader(reader, 4096);
    }

    private static String readReader(Reader reader, int initialBufferSize) throws IOException {
        char[] buffer = new char[initialBufferSize];
        int offset = 0;
        while (true) {
            int n = reader.read(buffer, offset, buffer.length - offset);
            if (n >= 0) {
                offset += n;
                if (offset == buffer.length) {
                    char[] tmp = new char[buffer.length * 2];
                    System.arraycopy(buffer, 0, tmp, 0, offset);
                    buffer = tmp;
                }
            } else {
                return new String(buffer, 0, offset);
            }
        }
    }

    static RuntimeException reportRuntimeError(String msgId) {
        String message = ToolErrorReporter.getMessage(msgId);
        return Context.reportRuntimeError(message);
    }

    static RuntimeException reportRuntimeError(String msgId, String msgArg) {
        String message = ToolErrorReporter.getMessage(msgId, msgArg);
        return Context.reportRuntimeError(message);
    }
}
