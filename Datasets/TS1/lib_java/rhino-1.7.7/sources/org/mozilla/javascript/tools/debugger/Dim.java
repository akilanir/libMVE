package org.mozilla.javascript.tools.debugger;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import org.mozilla.javascript.Callable;
import org.mozilla.javascript.Context;
import org.mozilla.javascript.ContextAction;
import org.mozilla.javascript.ContextFactory;
import org.mozilla.javascript.ImporterTopLevel;
import org.mozilla.javascript.Kit;
import org.mozilla.javascript.NativeCall;
import org.mozilla.javascript.ObjArray;
import org.mozilla.javascript.ScriptRuntime;
import org.mozilla.javascript.Scriptable;
import org.mozilla.javascript.ScriptableObject;
import org.mozilla.javascript.Undefined;
import org.mozilla.javascript.debug.DebugFrame;
import org.mozilla.javascript.debug.DebuggableObject;
import org.mozilla.javascript.debug.DebuggableScript;
import org.mozilla.javascript.debug.Debugger;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim.class */
public class Dim {
    public static final int STEP_OVER = 0;
    public static final int STEP_INTO = 1;
    public static final int STEP_OUT = 2;
    public static final int GO = 3;
    public static final int BREAK = 4;
    public static final int EXIT = 5;
    private static final int IPROXY_DEBUG = 0;
    private static final int IPROXY_LISTEN = 1;
    private static final int IPROXY_COMPILE_SCRIPT = 2;
    private static final int IPROXY_EVAL_SCRIPT = 3;
    private static final int IPROXY_STRING_IS_COMPILABLE = 4;
    private static final int IPROXY_OBJECT_TO_STRING = 5;
    private static final int IPROXY_OBJECT_PROPERTY = 6;
    private static final int IPROXY_OBJECT_IDS = 7;
    private GuiCallback callback;
    private boolean breakFlag;
    private ScopeProvider scopeProvider;
    private SourceProvider sourceProvider;
    private volatile ContextData interruptedContextData;
    private ContextFactory contextFactory;
    private boolean insideInterruptLoop;
    private String evalRequest;
    private StackFrame evalFrame;
    private String evalResult;
    private boolean breakOnExceptions;
    private boolean breakOnEnter;
    private boolean breakOnReturn;
    private DimIProxy listener;
    private int frameIndex = -1;
    private Object monitor = new Object();
    private Object eventThreadMonitor = new Object();
    private volatile int returnValue = -1;
    private final Map<String, SourceInfo> urlToSourceInfo = Collections.synchronizedMap(new HashMap());
    private final Map<String, FunctionSource> functionNames = Collections.synchronizedMap(new HashMap());
    private final Map<DebuggableScript, FunctionSource> functionToSource = Collections.synchronizedMap(new HashMap());

    public void setGuiCallback(GuiCallback callback) {
        this.callback = callback;
    }

    public void setBreak() {
        this.breakFlag = true;
    }

    public void setScopeProvider(ScopeProvider scopeProvider) {
        this.scopeProvider = scopeProvider;
    }

    public void setSourceProvider(SourceProvider sourceProvider) {
        this.sourceProvider = sourceProvider;
    }

    public void contextSwitch(int frameIndex) {
        this.frameIndex = frameIndex;
    }

    public void setBreakOnExceptions(boolean breakOnExceptions) {
        this.breakOnExceptions = breakOnExceptions;
    }

    public void setBreakOnEnter(boolean breakOnEnter) {
        this.breakOnEnter = breakOnEnter;
    }

    public void setBreakOnReturn(boolean breakOnReturn) {
        this.breakOnReturn = breakOnReturn;
    }

    public void attachTo(ContextFactory factory) {
        detach();
        this.contextFactory = factory;
        this.listener = new DimIProxy(1);
        factory.addListener(this.listener);
    }

    public void detach() {
        if (this.listener != null) {
            this.contextFactory.removeListener(this.listener);
            this.contextFactory = null;
            this.listener = null;
        }
    }

    public void dispose() {
        detach();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public FunctionSource getFunctionSource(DebuggableScript fnOrScript) {
        String source;
        DebuggableScript top;
        FunctionSource fsource = functionSource(fnOrScript);
        if (fsource == null) {
            String url = getNormalizedUrl(fnOrScript);
            SourceInfo si = sourceInfo(url);
            if (si == null && !fnOrScript.isGeneratedScript() && (source = loadSource(url)) != null) {
                DebuggableScript debuggableScript = fnOrScript;
                while (true) {
                    top = debuggableScript;
                    DebuggableScript parent = top.getParent();
                    if (parent == null) {
                        break;
                    }
                    debuggableScript = parent;
                }
                registerTopScript(top, source);
                fsource = functionSource(fnOrScript);
            }
        }
        return fsource;
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:14:0x0063 A[Catch: SecurityException -> 0x0086, IOException -> 0x010b, TRY_ENTER, TryCatch #0 {SecurityException -> 0x0086, blocks: (B:7:0x001d, B:9:0x0026, B:11:0x0032, B:13:0x0055, B:14:0x0063, B:16:0x0075), top: B:38:0x001d }] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0091 -> B:26:0x00dc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:24:0x00b1 -> B:26:0x00dc). Please report as a decompilation issue!!! */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:25:0x00c8 -> B:26:0x00dc). Please report as a decompilation issue!!! */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private java.lang.String loadSource(java.lang.String r7) {
        /*
            Method dump skipped, instructions count: 306
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.tools.debugger.Dim.loadSource(java.lang.String):java.lang.String");
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void registerTopScript(DebuggableScript topScript, String source) {
        String providedSource;
        if (!topScript.isTopLevel()) {
            throw new IllegalArgumentException();
        }
        String url = getNormalizedUrl(topScript);
        DebuggableScript[] functions = getAllFunctions(topScript);
        if (this.sourceProvider != null && (providedSource = this.sourceProvider.getSource(topScript)) != null) {
            source = providedSource;
        }
        SourceInfo sourceInfo = new SourceInfo(source, functions, url);
        synchronized (this.urlToSourceInfo) {
            SourceInfo old = this.urlToSourceInfo.get(url);
            if (old != null) {
                sourceInfo.copyBreakpointsFrom(old);
            }
            this.urlToSourceInfo.put(url, sourceInfo);
            for (int i = 0; i != sourceInfo.functionSourcesTop(); i++) {
                FunctionSource fsource = sourceInfo.functionSource(i);
                String name = fsource.name();
                if (name.length() != 0) {
                    this.functionNames.put(name, fsource);
                }
            }
        }
        synchronized (this.functionToSource) {
            for (int i2 = 0; i2 != functions.length; i2++) {
                this.functionToSource.put(functions[i2], sourceInfo.functionSource(i2));
            }
        }
        this.callback.updateSourceText(sourceInfo);
    }

    private FunctionSource functionSource(DebuggableScript fnOrScript) {
        return this.functionToSource.get(fnOrScript);
    }

    public String[] functionNames() {
        String[] strArr;
        synchronized (this.urlToSourceInfo) {
            strArr = (String[]) this.functionNames.keySet().toArray(new String[this.functionNames.size()]);
        }
        return strArr;
    }

    public FunctionSource functionSourceByName(String functionName) {
        return this.functionNames.get(functionName);
    }

    public SourceInfo sourceInfo(String url) {
        return this.urlToSourceInfo.get(url);
    }

    private String getNormalizedUrl(DebuggableScript fnOrScript) {
        int c;
        String url = fnOrScript.getSourceName();
        if (url == null) {
            url = "<stdin>";
        } else {
            StringBuilder sb = null;
            int urlLength = url.length();
            int cursor = 0;
            while (true) {
                int searchStart = url.indexOf(35, cursor);
                if (searchStart < 0) {
                    break;
                }
                String replace = null;
                int i = searchStart + 1;
                while (i != urlLength && 48 <= (c = url.charAt(i)) && c <= 57) {
                    i++;
                }
                if (i != searchStart + 1 && "(eval)".regionMatches(0, url, i, 6)) {
                    cursor = i + 6;
                    replace = "(eval)";
                }
                if (replace == null) {
                    break;
                }
                if (sb == null) {
                    sb = new StringBuilder();
                    sb.append(url.substring(0, searchStart));
                }
                sb.append(replace);
            }
            if (sb != null) {
                if (cursor != urlLength) {
                    sb.append(url.substring(cursor));
                }
                url = sb.toString();
            }
        }
        return url;
    }

    private static DebuggableScript[] getAllFunctions(DebuggableScript function) {
        ObjArray functions = new ObjArray();
        collectFunctions_r(function, functions);
        DebuggableScript[] result = new DebuggableScript[functions.size()];
        functions.toArray(result);
        return result;
    }

    private static void collectFunctions_r(DebuggableScript function, ObjArray array) {
        array.add(function);
        for (int i = 0; i != function.getFunctionCount(); i++) {
            collectFunctions_r(function.getFunction(i), array);
        }
    }

    public void clearAllBreakpoints() {
        for (SourceInfo si : this.urlToSourceInfo.values()) {
            si.removeAllBreakpoints();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleBreakpointHit(StackFrame frame, Context cx) {
        this.breakFlag = false;
        interrupted(cx, frame, null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handleExceptionThrown(Context cx, Throwable ex, StackFrame frame) {
        if (this.breakOnExceptions) {
            ContextData cd = frame.contextData();
            if (cd.lastProcessedException != ex) {
                interrupted(cx, frame, ex);
                cd.lastProcessedException = ex;
            }
        }
    }

    public ContextData currentContextData() {
        return this.interruptedContextData;
    }

    public void setReturnValue(int returnValue) {
        synchronized (this.monitor) {
            this.returnValue = returnValue;
            this.monitor.notify();
        }
    }

    public void go() {
        synchronized (this.monitor) {
            this.returnValue = 3;
            this.monitor.notifyAll();
        }
    }

    public String eval(String expr) {
        String result = "undefined";
        if (expr == null) {
            return result;
        }
        ContextData contextData = currentContextData();
        if (contextData == null || this.frameIndex >= contextData.frameCount()) {
            return result;
        }
        StackFrame frame = contextData.getFrame(this.frameIndex);
        if (contextData.eventThreadFlag) {
            Context cx = Context.getCurrentContext();
            result = do_eval(cx, frame, expr);
        } else {
            synchronized (this.monitor) {
                if (this.insideInterruptLoop) {
                    this.evalRequest = expr;
                    this.evalFrame = frame;
                    this.monitor.notify();
                    do {
                        try {
                            this.monitor.wait();
                        } catch (InterruptedException e) {
                            Thread.currentThread().interrupt();
                        }
                    } while (this.evalRequest != null);
                    result = this.evalResult;
                }
            }
        }
        return result;
    }

    public void compileScript(String url, String text) {
        DimIProxy action = new DimIProxy(2);
        action.url = url;
        action.text = text;
        action.withContext();
    }

    public void evalScript(String url, String text) {
        DimIProxy action = new DimIProxy(3);
        action.url = url;
        action.text = text;
        action.withContext();
    }

    public String objectToString(Object object) {
        DimIProxy action = new DimIProxy(5);
        action.object = object;
        action.withContext();
        return action.stringResult;
    }

    public boolean stringIsCompilableUnit(String str) {
        DimIProxy action = new DimIProxy(4);
        action.text = str;
        action.withContext();
        return action.booleanResult;
    }

    public Object getObjectProperty(Object object, Object id) {
        DimIProxy action = new DimIProxy(6);
        action.object = object;
        action.id = id;
        action.withContext();
        return action.objectResult;
    }

    public Object[] getObjectIds(Object object) {
        DimIProxy action = new DimIProxy(7);
        action.object = object;
        action.withContext();
        return action.objectArrayResult;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Object getObjectPropertyImpl(Context cx, Object object, Object id) {
        Object result;
        Scriptable scriptable = (Scriptable) object;
        if (id instanceof String) {
            String name = (String) id;
            if (name.equals("this")) {
                result = scriptable;
            } else if (name.equals("__proto__")) {
                result = scriptable.getPrototype();
            } else if (name.equals("__parent__")) {
                result = scriptable.getParentScope();
            } else {
                result = ScriptableObject.getProperty(scriptable, name);
                if (result == ScriptableObject.NOT_FOUND) {
                    result = Undefined.instance;
                }
            }
        } else {
            int index = ((Integer) id).intValue();
            result = ScriptableObject.getProperty(scriptable, index);
            if (result == ScriptableObject.NOT_FOUND) {
                result = Undefined.instance;
            }
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public Object[] getObjectIdsImpl(Context cx, Object object) {
        Object[] ids;
        if (!(object instanceof Scriptable) || object == Undefined.instance) {
            return Context.emptyArgs;
        }
        Scriptable scriptable = (Scriptable) object;
        if (scriptable instanceof DebuggableObject) {
            ids = ((DebuggableObject) scriptable).getAllIds();
        } else {
            ids = scriptable.getIds();
        }
        Scriptable proto = scriptable.getPrototype();
        Scriptable parent = scriptable.getParentScope();
        int extra = 0;
        if (proto != null) {
            extra = 0 + 1;
        }
        if (parent != null) {
            extra++;
        }
        if (extra != 0) {
            Object[] tmp = new Object[extra + ids.length];
            System.arraycopy(ids, 0, tmp, extra, ids.length);
            ids = tmp;
            int extra2 = 0;
            if (proto != null) {
                extra2 = 0 + 1;
                ids[0] = "__proto__";
            }
            if (parent != null) {
                int i = extra2;
                int i2 = extra2 + 1;
                ids[i] = "__parent__";
            }
        }
        return ids;
    }

    /* JADX WARN: Finally extract failed */
    private void interrupted(Context cx, StackFrame frame, Throwable scriptException) {
        String alertMessage;
        ContextData contextData = frame.contextData();
        boolean eventThreadFlag = this.callback.isGuiEventThread();
        contextData.eventThreadFlag = eventThreadFlag;
        boolean recursiveEventThreadCall = false;
        synchronized (this.eventThreadMonitor) {
            if (eventThreadFlag) {
                if (this.interruptedContextData != null) {
                    recursiveEventThreadCall = true;
                }
            } else {
                while (this.interruptedContextData != null) {
                    try {
                        this.eventThreadMonitor.wait();
                    } catch (InterruptedException e) {
                        return;
                    }
                }
            }
            this.interruptedContextData = contextData;
        }
        if (recursiveEventThreadCall) {
            return;
        }
        if (this.interruptedContextData == null) {
            Kit.codeBug();
        }
        try {
            int frameCount = contextData.frameCount();
            this.frameIndex = frameCount - 1;
            String threadTitle = Thread.currentThread().toString();
            if (scriptException == null) {
                alertMessage = null;
            } else {
                alertMessage = scriptException.toString();
            }
            int returnValue = -1;
            if (!eventThreadFlag) {
                synchronized (this.monitor) {
                    if (this.insideInterruptLoop) {
                        Kit.codeBug();
                    }
                    this.insideInterruptLoop = true;
                    this.evalRequest = null;
                    this.returnValue = -1;
                    this.callback.enterInterrupt(frame, threadTitle, alertMessage);
                    while (true) {
                        try {
                            try {
                                this.monitor.wait();
                                if (this.evalRequest != null) {
                                    this.evalResult = null;
                                    try {
                                        this.evalResult = do_eval(cx, this.evalFrame, this.evalRequest);
                                        this.evalRequest = null;
                                        this.evalFrame = null;
                                        this.monitor.notify();
                                    } catch (Throwable th) {
                                        this.evalRequest = null;
                                        this.evalFrame = null;
                                        this.monitor.notify();
                                        throw th;
                                    }
                                } else if (this.returnValue != -1) {
                                    break;
                                }
                            } catch (InterruptedException e2) {
                                Thread.currentThread().interrupt();
                            }
                        } catch (Throwable th2) {
                            this.insideInterruptLoop = false;
                            throw th2;
                        }
                    }
                    returnValue = this.returnValue;
                    this.insideInterruptLoop = false;
                }
            } else {
                this.returnValue = -1;
                this.callback.enterInterrupt(frame, threadTitle, alertMessage);
                while (this.returnValue == -1) {
                    try {
                        this.callback.dispatchNextGuiEvent();
                    } catch (InterruptedException e3) {
                    }
                }
                returnValue = this.returnValue;
            }
            switch (returnValue) {
                case 0:
                    contextData.breakNextLine = true;
                    contextData.stopAtFrameDepth = contextData.frameCount();
                    break;
                case 1:
                    contextData.breakNextLine = true;
                    contextData.stopAtFrameDepth = -1;
                    break;
                case 2:
                    if (contextData.frameCount() > 1) {
                        contextData.breakNextLine = true;
                        contextData.stopAtFrameDepth = contextData.frameCount() - 1;
                        break;
                    }
                    break;
            }
            synchronized (this.eventThreadMonitor) {
                this.interruptedContextData = null;
                this.eventThreadMonitor.notifyAll();
            }
        } catch (Throwable th3) {
            synchronized (this.eventThreadMonitor) {
                this.interruptedContextData = null;
                this.eventThreadMonitor.notifyAll();
                throw th3;
            }
        }
    }

    private static String do_eval(Context cx, StackFrame frame, String expr) {
        String resultString;
        Debugger saved_debugger = cx.getDebugger();
        Object saved_data = cx.getDebuggerContextData();
        int saved_level = cx.getOptimizationLevel();
        cx.setDebugger(null, null);
        cx.setOptimizationLevel(-1);
        cx.setGeneratingDebug(false);
        try {
            try {
                Callable script = (Callable) cx.compileString(expr, "", 0, null);
                Object result = script.call(cx, frame.scope, frame.thisObj, ScriptRuntime.emptyArgs);
                if (result == Undefined.instance) {
                    resultString = "";
                } else {
                    resultString = ScriptRuntime.toString(result);
                }
            } catch (Exception exc) {
                resultString = exc.getMessage();
                cx.setGeneratingDebug(true);
                cx.setOptimizationLevel(saved_level);
                cx.setDebugger(saved_debugger, saved_data);
            }
            if (resultString == null) {
                resultString = "null";
            }
            return resultString;
        } finally {
            cx.setGeneratingDebug(true);
            cx.setOptimizationLevel(saved_level);
            cx.setDebugger(saved_debugger, saved_data);
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim$DimIProxy.class */
    private static class DimIProxy implements ContextAction, ContextFactory.Listener, Debugger {
        private Dim dim;
        private int type;
        private String url;
        private String text;
        private Object object;
        private Object id;
        private boolean booleanResult;
        private String stringResult;
        private Object objectResult;
        private Object[] objectArrayResult;

        private DimIProxy(Dim dim, int type) {
            this.dim = dim;
            this.type = type;
        }

        @Override // org.mozilla.javascript.ContextAction
        public Object run(Context cx) {
            switch (this.type) {
                case 2:
                    cx.compileString(this.text, this.url, 1, null);
                    return null;
                case 3:
                    Scriptable scope = null;
                    if (this.dim.scopeProvider != null) {
                        scope = this.dim.scopeProvider.getScope();
                    }
                    if (scope == null) {
                        scope = new ImporterTopLevel(cx);
                    }
                    cx.evaluateString(scope, this.text, this.url, 1, null);
                    return null;
                case 4:
                    this.booleanResult = cx.stringIsCompilableUnit(this.text);
                    return null;
                case 5:
                    if (this.object == Undefined.instance) {
                        this.stringResult = "undefined";
                        return null;
                    }
                    if (this.object == null) {
                        this.stringResult = "null";
                        return null;
                    }
                    if (this.object instanceof NativeCall) {
                        this.stringResult = "[object Call]";
                        return null;
                    }
                    this.stringResult = Context.toString(this.object);
                    return null;
                case 6:
                    this.objectResult = this.dim.getObjectPropertyImpl(cx, this.object, this.id);
                    return null;
                case 7:
                    this.objectArrayResult = this.dim.getObjectIdsImpl(cx, this.object);
                    return null;
                default:
                    throw Kit.codeBug();
            }
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void withContext() {
            this.dim.contextFactory.call(this);
        }

        @Override // org.mozilla.javascript.ContextFactory.Listener
        public void contextCreated(Context cx) {
            if (this.type != 1) {
                Kit.codeBug();
            }
            ContextData contextData = new ContextData();
            Debugger debugger = new DimIProxy(this.dim, 0);
            cx.setDebugger(debugger, contextData);
            cx.setGeneratingDebug(true);
            cx.setOptimizationLevel(-1);
        }

        @Override // org.mozilla.javascript.ContextFactory.Listener
        public void contextReleased(Context cx) {
            if (this.type != 1) {
                Kit.codeBug();
            }
        }

        @Override // org.mozilla.javascript.debug.Debugger
        public DebugFrame getFrame(Context cx, DebuggableScript fnOrScript) {
            if (this.type != 0) {
                Kit.codeBug();
            }
            FunctionSource item = this.dim.getFunctionSource(fnOrScript);
            if (item == null) {
                return null;
            }
            return new StackFrame(cx, this.dim, item);
        }

        @Override // org.mozilla.javascript.debug.Debugger
        public void handleCompilationDone(Context cx, DebuggableScript fnOrScript, String source) {
            if (this.type != 0) {
                Kit.codeBug();
            }
            if (fnOrScript.isTopLevel()) {
                this.dim.registerTopScript(fnOrScript, source);
            }
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim$ContextData.class */
    public static class ContextData {
        private boolean breakNextLine;
        private boolean eventThreadFlag;
        private Throwable lastProcessedException;
        private ObjArray frameStack = new ObjArray();
        private int stopAtFrameDepth = -1;

        public static ContextData get(Context cx) {
            return (ContextData) cx.getDebuggerContextData();
        }

        public int frameCount() {
            return this.frameStack.size();
        }

        public StackFrame getFrame(int frameNumber) {
            int num = (this.frameStack.size() - frameNumber) - 1;
            return (StackFrame) this.frameStack.get(num);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void pushFrame(StackFrame frame) {
            this.frameStack.push(frame);
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void popFrame() {
            this.frameStack.pop();
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim$StackFrame.class */
    public static class StackFrame implements DebugFrame {
        private Dim dim;
        private ContextData contextData;
        private Scriptable scope;
        private Scriptable thisObj;
        private FunctionSource fsource;
        private boolean[] breakpoints;
        private int lineNumber;

        private StackFrame(Context cx, Dim dim, FunctionSource fsource) {
            this.dim = dim;
            this.contextData = ContextData.get(cx);
            this.fsource = fsource;
            this.breakpoints = fsource.sourceInfo().breakpoints;
            this.lineNumber = fsource.firstLine();
        }

        @Override // org.mozilla.javascript.debug.DebugFrame
        public void onEnter(Context cx, Scriptable scope, Scriptable thisObj, Object[] args) {
            this.contextData.pushFrame(this);
            this.scope = scope;
            this.thisObj = thisObj;
            if (this.dim.breakOnEnter) {
                this.dim.handleBreakpointHit(this, cx);
            }
        }

        @Override // org.mozilla.javascript.debug.DebugFrame
        public void onLineChange(Context cx, int lineno) {
            this.lineNumber = lineno;
            if (!this.breakpoints[lineno] && !this.dim.breakFlag) {
                boolean lineBreak = this.contextData.breakNextLine;
                if (lineBreak && this.contextData.stopAtFrameDepth >= 0) {
                    lineBreak = this.contextData.frameCount() <= this.contextData.stopAtFrameDepth;
                }
                if (lineBreak) {
                    this.contextData.stopAtFrameDepth = -1;
                    this.contextData.breakNextLine = false;
                } else {
                    return;
                }
            }
            this.dim.handleBreakpointHit(this, cx);
        }

        @Override // org.mozilla.javascript.debug.DebugFrame
        public void onExceptionThrown(Context cx, Throwable exception) {
            this.dim.handleExceptionThrown(cx, exception, this);
        }

        @Override // org.mozilla.javascript.debug.DebugFrame
        public void onExit(Context cx, boolean byThrow, Object resultOrException) {
            if (this.dim.breakOnReturn && !byThrow) {
                this.dim.handleBreakpointHit(this, cx);
            }
            this.contextData.popFrame();
        }

        @Override // org.mozilla.javascript.debug.DebugFrame
        public void onDebuggerStatement(Context cx) {
            this.dim.handleBreakpointHit(this, cx);
        }

        public SourceInfo sourceInfo() {
            return this.fsource.sourceInfo();
        }

        public ContextData contextData() {
            return this.contextData;
        }

        public Object scope() {
            return this.scope;
        }

        public Object thisObj() {
            return this.thisObj;
        }

        public String getUrl() {
            return this.fsource.sourceInfo().url();
        }

        public int getLineNumber() {
            return this.lineNumber;
        }

        public String getFunctionName() {
            return this.fsource.name();
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim$FunctionSource.class */
    public static class FunctionSource {
        private SourceInfo sourceInfo;
        private int firstLine;
        private String name;

        private FunctionSource(SourceInfo sourceInfo, int firstLine, String name) {
            if (name == null) {
                throw new IllegalArgumentException();
            }
            this.sourceInfo = sourceInfo;
            this.firstLine = firstLine;
            this.name = name;
        }

        public SourceInfo sourceInfo() {
            return this.sourceInfo;
        }

        public int firstLine() {
            return this.firstLine;
        }

        public String name() {
            return this.name;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/tools/debugger/Dim$SourceInfo.class */
    public static class SourceInfo {
        private static final boolean[] EMPTY_BOOLEAN_ARRAY = new boolean[0];
        private String source;
        private String url;
        private boolean[] breakableLines;
        private boolean[] breakpoints;
        private FunctionSource[] functionSources;

        /* JADX WARN: Multi-variable type inference failed */
        private SourceInfo(String source, DebuggableScript[] functions, String normilizedUrl) {
            this.source = source;
            this.url = normilizedUrl;
            int N = functions.length;
            int[] iArr = new int[N];
            for (int i = 0; i != N; i++) {
                iArr[i] = functions[i].getLineNumbers();
            }
            int minAll = 0;
            int maxAll = -1;
            int[] firstLines = new int[N];
            for (int i2 = 0; i2 != N; i2++) {
                Object[] objArr = iArr[i2];
                if (objArr == 0 || objArr.length == 0) {
                    firstLines[i2] = -1;
                } else {
                    char c = objArr[0];
                    int max = c;
                    int min = c;
                    for (int j = 1; j != objArr.length; j++) {
                        char c2 = objArr[j];
                        if (c2 < min) {
                            min = c2;
                        } else if (c2 > max) {
                            max = c2;
                        }
                    }
                    firstLines[i2] = min;
                    if (minAll > maxAll) {
                        minAll = min;
                        maxAll = max;
                    } else {
                        minAll = min < minAll ? min : minAll;
                        if (max > maxAll) {
                            maxAll = max;
                        }
                    }
                }
            }
            if (minAll > maxAll) {
                this.breakableLines = EMPTY_BOOLEAN_ARRAY;
                this.breakpoints = EMPTY_BOOLEAN_ARRAY;
            } else {
                if (minAll < 0) {
                    throw new IllegalStateException(String.valueOf(minAll));
                }
                int linesTop = maxAll + 1;
                this.breakableLines = new boolean[linesTop];
                this.breakpoints = new boolean[linesTop];
                for (int i3 = 0; i3 != N; i3++) {
                    Object[] objArr2 = iArr[i3];
                    if (objArr2 != 0 && objArr2.length != 0) {
                        for (int j2 = 0; j2 != objArr2.length; j2++) {
                            this.breakableLines[objArr2[j2]] = true;
                        }
                    }
                }
            }
            this.functionSources = new FunctionSource[N];
            for (int i4 = 0; i4 != N; i4++) {
                String name = functions[i4].getFunctionName();
                if (name == null) {
                    name = "";
                }
                this.functionSources[i4] = new FunctionSource(this, firstLines[i4], name);
            }
        }

        public String source() {
            return this.source;
        }

        public String url() {
            return this.url;
        }

        public int functionSourcesTop() {
            return this.functionSources.length;
        }

        public FunctionSource functionSource(int i) {
            return this.functionSources[i];
        }

        /* JADX INFO: Access modifiers changed from: private */
        public void copyBreakpointsFrom(SourceInfo old) {
            int end = old.breakpoints.length;
            if (end > this.breakpoints.length) {
                end = this.breakpoints.length;
            }
            for (int line = 0; line != end; line++) {
                if (old.breakpoints[line]) {
                    this.breakpoints[line] = true;
                }
            }
        }

        public boolean breakableLine(int line) {
            return line < this.breakableLines.length && this.breakableLines[line];
        }

        public boolean breakpoint(int line) {
            if (breakableLine(line)) {
                return line < this.breakpoints.length && this.breakpoints[line];
            }
            throw new IllegalArgumentException(String.valueOf(line));
        }

        public boolean breakpoint(int line, boolean value) {
            boolean changed;
            if (!breakableLine(line)) {
                throw new IllegalArgumentException(String.valueOf(line));
            }
            synchronized (this.breakpoints) {
                if (this.breakpoints[line] != value) {
                    this.breakpoints[line] = value;
                    changed = true;
                } else {
                    changed = false;
                }
            }
            return changed;
        }

        public void removeAllBreakpoints() {
            synchronized (this.breakpoints) {
                for (int line = 0; line != this.breakpoints.length; line++) {
                    this.breakpoints[line] = false;
                }
            }
        }
    }
}
