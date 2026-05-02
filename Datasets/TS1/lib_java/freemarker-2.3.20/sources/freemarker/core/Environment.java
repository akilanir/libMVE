package freemarker.core;

import freemarker.core.BodyInstruction;
import freemarker.core.BreakInstruction;
import freemarker.core.IteratorBlock;
import freemarker.core.Macro;
import freemarker.core.ReturnInstruction;
import freemarker.ext.beans.BeansWrapper;
import freemarker.log.Logger;
import freemarker.template.Configuration;
import freemarker.template.SimpleHash;
import freemarker.template.SimpleSequence;
import freemarker.template.Template;
import freemarker.template.TemplateCollectionModel;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateExceptionHandler;
import freemarker.template.TemplateHashModel;
import freemarker.template.TemplateHashModelEx;
import freemarker.template.TemplateModel;
import freemarker.template.TemplateModelException;
import freemarker.template.TemplateModelIterator;
import freemarker.template.TemplateNodeModel;
import freemarker.template.TemplateScalarModel;
import freemarker.template.TemplateSequenceModel;
import freemarker.template.TemplateTransformModel;
import freemarker.template.utility.DateUtil;
import freemarker.template.utility.NullWriter;
import freemarker.template.utility.StringUtil;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.Collator;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Set;
import java.util.StringTokenizer;
import java.util.TimeZone;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/Environment.class */
public final class Environment extends Configurable {
    static final String STACK_SECTION_SEPARATOR = "----------";
    private static final ThreadLocal threadEnv = new ThreadLocal();
    private static final Logger logger = Logger.getLogger("freemarker.runtime");
    private static final Logger attemptLogger = Logger.getLogger("freemarker.runtime.attempt");
    private static final Map localizedNumberFormats = new HashMap();
    private static final Map localizedDateFormats = new HashMap();
    private static final DecimalFormat C_NUMBER_FORMAT = new DecimalFormat("0.################", new DecimalFormatSymbols(Locale.US));
    private final TemplateHashModel rootDataModel;
    private final ArrayList instructionStack;
    private final ArrayList recoveredErrorStack;
    private NumberFormat numberFormat;
    private Map numberFormats;
    private DateFormat timeFormat;
    private DateFormat dateFormat;
    private DateFormat dateTimeFormat;
    private Map[] dateFormats;
    private NumberFormat cNumberFormat;
    private DateUtil.DateToISO8601CalendarFactory isoBuiltInCalendarFactory;
    private Collator collator;
    private Writer out;
    private Macro.Context currentMacroContext;
    private ArrayList localContextStack;
    private Namespace mainNamespace;
    private Namespace currentNamespace;
    private Namespace globalNamespace;
    private HashMap loadedLibs;
    private boolean inAttemptBlock;
    private Throwable lastThrowable;
    private TemplateModel lastReturnValue;
    private HashMap macroToNamespaceLookup;
    private TemplateNodeModel currentVisitorNode;
    private TemplateSequenceModel nodeNamespaces;
    private int nodeNamespaceIndex;
    private String currentNodeName;
    private String currentNodeNS;
    private String cachedURLEscapingCharset;
    private boolean urlEscapingCharsetCached;
    private boolean fastInvalidReferenceExceptions;
    private static final TemplateModel[] NO_OUT_ARGS;
    private static final Writer EMPTY_BODY_WRITER;

    static {
        C_NUMBER_FORMAT.setGroupingUsed(false);
        C_NUMBER_FORMAT.setDecimalSeparatorAlwaysShown(false);
        NO_OUT_ARGS = new TemplateModel[0];
        EMPTY_BODY_WRITER = new Writer() { // from class: freemarker.core.Environment.6
            @Override // java.io.Writer
            public void write(char[] cbuf, int off, int len) throws IOException {
                if (len > 0) {
                    throw new IOException("This transform does not allow nested content.");
                }
            }

            @Override // java.io.Writer, java.io.Flushable
            public void flush() {
            }

            @Override // java.io.Writer, java.io.Closeable, java.lang.AutoCloseable
            public void close() {
            }
        };
    }

    public static Environment getCurrentEnvironment() {
        return (Environment) threadEnv.get();
    }

    public Environment(Template template, TemplateHashModel rootDataModel, Writer out) {
        super(template);
        this.instructionStack = new ArrayList();
        this.recoveredErrorStack = new ArrayList();
        this.macroToNamespaceLookup = new HashMap();
        this.globalNamespace = new Namespace(this, null);
        Namespace namespace = new Namespace(this, template);
        this.mainNamespace = namespace;
        this.currentNamespace = namespace;
        this.out = out;
        this.rootDataModel = rootDataModel;
        importMacros(template);
    }

    public Template getTemplate() {
        return (Template) getParent();
    }

    private void clearCachedValues() {
        this.numberFormats = null;
        this.numberFormat = null;
        this.dateFormats = null;
        this.collator = null;
        this.cachedURLEscapingCharset = null;
        this.urlEscapingCharsetCached = false;
    }

    /* JADX WARN: Finally extract failed */
    public void process() throws TemplateException, IOException {
        Object savedEnv = threadEnv.get();
        threadEnv.set(this);
        try {
            clearCachedValues();
            try {
                doAutoImportsAndIncludes(this);
                visit(getTemplate().getRootTreeNode());
                if (getAutoFlush()) {
                    this.out.flush();
                }
                clearCachedValues();
                threadEnv.set(savedEnv);
            } catch (Throwable th) {
                clearCachedValues();
                throw th;
            }
        } catch (Throwable th2) {
            threadEnv.set(savedEnv);
            throw th2;
        }
    }

    void visit(TemplateElement element) throws TemplateException, IOException {
        pushElement(element);
        try {
            try {
                element.accept(this);
                popElement();
            } catch (TemplateException te) {
                handleTemplateException(te);
                popElement();
            }
        } catch (Throwable th) {
            popElement();
            throw th;
        }
    }

    void visitByHiddingParent(TemplateElement element) throws TemplateException, IOException {
        TemplateElement parent = replaceTopElement(element);
        try {
            try {
                element.accept(this);
                replaceTopElement(parent);
            } catch (TemplateException te) {
                handleTemplateException(te);
                replaceTopElement(parent);
            }
        } catch (Throwable th) {
            replaceTopElement(parent);
            throw th;
        }
    }

    private TemplateElement replaceTopElement(TemplateElement element) {
        return (TemplateElement) this.instructionStack.set(this.instructionStack.size() - 1, element);
    }

    public void visit(TemplateElement element, TemplateDirectiveModel directiveModel, Map args, List bodyParameterNames) throws TemplateException, IOException {
        TemplateDirectiveBody nested;
        TemplateModel[] outArgs;
        if (element == null) {
            nested = null;
        } else {
            nested = new TemplateDirectiveBody(this, element) { // from class: freemarker.core.Environment.1
                private final TemplateElement val$element;
                private final Environment this$0;

                {
                    this.this$0 = this;
                    this.val$element = element;
                }

                @Override // freemarker.template.TemplateDirectiveBody
                public void render(Writer newOut) throws TemplateException, IOException {
                    Writer prevOut = this.this$0.out;
                    this.this$0.out = newOut;
                    try {
                        this.this$0.visit(this.val$element);
                        this.this$0.out = prevOut;
                    } catch (Throwable th) {
                        this.this$0.out = prevOut;
                        throw th;
                    }
                }
            };
        }
        if (bodyParameterNames == null || bodyParameterNames.isEmpty()) {
            outArgs = NO_OUT_ARGS;
        } else {
            outArgs = new TemplateModel[bodyParameterNames.size()];
        }
        if (outArgs.length > 0) {
            pushLocalContext(new LocalContext(this, bodyParameterNames, outArgs) { // from class: freemarker.core.Environment.2
                private final List val$bodyParameterNames;
                private final TemplateModel[] val$outArgs;
                private final Environment this$0;

                {
                    this.this$0 = this;
                    this.val$bodyParameterNames = bodyParameterNames;
                    this.val$outArgs = outArgs;
                }

                @Override // freemarker.core.LocalContext
                public TemplateModel getLocalVariable(String name) {
                    int index = this.val$bodyParameterNames.indexOf(name);
                    if (index != -1) {
                        return this.val$outArgs[index];
                    }
                    return null;
                }

                @Override // freemarker.core.LocalContext
                public Collection getLocalVariableNames() {
                    return this.val$bodyParameterNames;
                }
            });
        }
        try {
            directiveModel.execute(this, args, outArgs, nested);
            if (outArgs.length > 0) {
                popLocalContext();
            }
        } catch (Throwable th) {
            if (outArgs.length > 0) {
                popLocalContext();
            }
            throw th;
        }
    }

    /* JADX WARN: Finally extract failed */
    /* JADX WARN: Removed duplicated region for block: B:61:? A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    void visitAndTransform(freemarker.core.TemplateElement r5, freemarker.template.TemplateTransformModel r6, java.util.Map r7) throws freemarker.template.TemplateException, java.io.IOException {
        /*
            r4 = this;
            r0 = r6
            r1 = r4
            java.io.Writer r1 = r1.out     // Catch: freemarker.template.TemplateException -> Lc5
            r2 = r7
            java.io.Writer r0 = r0.getWriter(r1, r2)     // Catch: freemarker.template.TemplateException -> Lc5
            r8 = r0
            r0 = r8
            if (r0 != 0) goto L17
            java.io.Writer r0 = freemarker.core.Environment.EMPTY_BODY_WRITER     // Catch: freemarker.template.TemplateException -> Lc5
            r8 = r0
        L17:
            r0 = r8
            boolean r0 = r0 instanceof freemarker.template.TransformControl     // Catch: freemarker.template.TemplateException -> Lc5
            if (r0 == 0) goto L27
            r0 = r8
            freemarker.template.TransformControl r0 = (freemarker.template.TransformControl) r0     // Catch: freemarker.template.TemplateException -> Lc5
            goto L28
        L27:
            r0 = 0
        L28:
            r9 = r0
            r0 = r4
            java.io.Writer r0 = r0.out     // Catch: freemarker.template.TemplateException -> Lc5
            r10 = r0
            r0 = r4
            r1 = r8
            r0.out = r1     // Catch: freemarker.template.TemplateException -> Lc5
            r0 = r9
            if (r0 == 0) goto L45
            r0 = r9
            int r0 = r0.onStart()     // Catch: java.lang.Throwable -> L6b java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
            if (r0 == 0) goto L5d
        L45:
            r0 = r5
            if (r0 == 0) goto L4e
            r0 = r4
            r1 = r5
            r0.visitByHiddingParent(r1)     // Catch: java.lang.Throwable -> L6b java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L4e:
            r0 = r9
            if (r0 == 0) goto L5d
            r0 = r9
            int r0 = r0.afterBody()     // Catch: java.lang.Throwable -> L6b java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
            if (r0 == 0) goto L45
        L5d:
            r0 = r4
            r1 = r10
            r0.out = r1     // Catch: freemarker.template.TemplateException -> Lc5
            r0 = r8
            r0.close()     // Catch: freemarker.template.TemplateException -> Lc5
            goto Lc2
        L6b:
            r11 = move-exception
            r0 = r9
            if (r0 == 0) goto L7e
            r0 = r9
            r1 = r11
            r0.onError(r1)     // Catch: freemarker.template.TemplateException -> L84 java.io.IOException -> L89 java.lang.RuntimeException -> L8e java.lang.Error -> L93 java.lang.Throwable -> L98 java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
            goto L81
        L7e:
            r0 = r11
            throw r0     // Catch: freemarker.template.TemplateException -> L84 java.io.IOException -> L89 java.lang.RuntimeException -> L8e java.lang.Error -> L93 java.lang.Throwable -> L98 java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L81:
            goto La4
        L84:
            r12 = move-exception
            r0 = r12
            throw r0     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L89:
            r12 = move-exception
            r0 = r12
            throw r0     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L8e:
            r12 = move-exception
            r0 = r12
            throw r0     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L93:
            r12 = move-exception
            r0 = r12
            throw r0     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        L98:
            r12 = move-exception
            freemarker.template.utility.UndeclaredThrowableException r0 = new freemarker.template.utility.UndeclaredThrowableException     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
            r1 = r0
            r2 = r12
            r1.<init>(r2)     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
            throw r0     // Catch: java.lang.Throwable -> Lb2 freemarker.template.TemplateException -> Lc5
        La4:
            r0 = r4
            r1 = r10
            r0.out = r1     // Catch: freemarker.template.TemplateException -> Lc5
            r0 = r8
            r0.close()     // Catch: freemarker.template.TemplateException -> Lc5
            goto Lc2
        Lb2:
            r13 = move-exception
            r0 = r4
            r1 = r10
            r0.out = r1     // Catch: freemarker.template.TemplateException -> Lc5
            r0 = r8
            r0.close()     // Catch: freemarker.template.TemplateException -> Lc5
            r0 = r13
            throw r0     // Catch: freemarker.template.TemplateException -> Lc5
        Lc2:
            goto Lcd
        Lc5:
            r8 = move-exception
            r0 = r4
            r1 = r8
            r0.handleTemplateException(r1)
        Lcd:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: freemarker.core.Environment.visitAndTransform(freemarker.core.TemplateElement, freemarker.template.TemplateTransformModel, java.util.Map):void");
    }

    void visitAttemptRecover(TemplateElement attemptBlock, RecoveryBlock recoveryBlock) throws TemplateException, IOException {
        Writer prevOut = this.out;
        StringWriter sw = new StringWriter();
        this.out = sw;
        TemplateException thrownException = null;
        boolean lastFIRE = setFastInvalidReferenceExceptions(false);
        boolean lastInAttemptBlock = this.inAttemptBlock;
        try {
            this.inAttemptBlock = true;
            visitByHiddingParent(attemptBlock);
            this.inAttemptBlock = lastInAttemptBlock;
            setFastInvalidReferenceExceptions(lastFIRE);
            this.out = prevOut;
        } catch (TemplateException te) {
            thrownException = te;
            this.inAttemptBlock = lastInAttemptBlock;
            setFastInvalidReferenceExceptions(lastFIRE);
            this.out = prevOut;
        } catch (Throwable th) {
            this.inAttemptBlock = lastInAttemptBlock;
            setFastInvalidReferenceExceptions(lastFIRE);
            this.out = prevOut;
            throw th;
        }
        if (thrownException != null) {
            if (attemptLogger.isDebugEnabled()) {
                attemptLogger.debug(new StringBuffer().append("Error in attempt block ").append(attemptBlock.getStartLocationQuoted()).toString(), thrownException);
            }
            try {
                this.recoveredErrorStack.add(thrownException);
                visit(recoveryBlock);
                this.recoveredErrorStack.remove(this.recoveredErrorStack.size() - 1);
                return;
            } catch (Throwable th2) {
                this.recoveredErrorStack.remove(this.recoveredErrorStack.size() - 1);
                throw th2;
            }
        }
        this.out.write(sw.toString());
    }

    String getCurrentRecoveredErrorMessage() throws TemplateException {
        if (this.recoveredErrorStack.isEmpty()) {
            throw new _MiscTemplateException(this, ".error is not available outside of a #recover block");
        }
        return ((Throwable) this.recoveredErrorStack.get(this.recoveredErrorStack.size() - 1)).getMessage();
    }

    public boolean isInAttemptBlock() {
        return this.inAttemptBlock;
    }

    void visit(BodyInstruction.Context bctxt) throws TemplateException, IOException {
        Macro.Context invokingMacroContext = getCurrentMacroContext();
        ArrayList prevLocalContextStack = this.localContextStack;
        TemplateElement body = invokingMacroContext.body;
        if (body != null) {
            this.currentMacroContext = invokingMacroContext.prevMacroContext;
            this.currentNamespace = invokingMacroContext.bodyNamespace;
            Configurable prevParent = getParent();
            setParent(this.currentNamespace.getTemplate());
            this.localContextStack = invokingMacroContext.prevLocalContextStack;
            if (invokingMacroContext.bodyParameterNames != null) {
                pushLocalContext(bctxt);
            }
            try {
                visit(body);
                if (invokingMacroContext.bodyParameterNames != null) {
                    popLocalContext();
                }
                this.currentMacroContext = invokingMacroContext;
                this.currentNamespace = getMacroNamespace(invokingMacroContext.getMacro());
                setParent(prevParent);
                this.localContextStack = prevLocalContextStack;
            } catch (Throwable th) {
                if (invokingMacroContext.bodyParameterNames != null) {
                    popLocalContext();
                }
                this.currentMacroContext = invokingMacroContext;
                this.currentNamespace = getMacroNamespace(invokingMacroContext.getMacro());
                setParent(prevParent);
                this.localContextStack = prevLocalContextStack;
                throw th;
            }
        }
    }

    void visitIteratorBlock(IteratorBlock.Context ictxt) throws TemplateException, IOException {
        pushLocalContext(ictxt);
        try {
            try {
                ictxt.runLoop(this);
                popLocalContext();
            } catch (BreakInstruction.Break e) {
                popLocalContext();
            } catch (TemplateException te) {
                handleTemplateException(te);
                popLocalContext();
            }
        } catch (Throwable th) {
            popLocalContext();
            throw th;
        }
    }

    void visit(TemplateNodeModel node, TemplateSequenceModel namespaces) throws TemplateException, IOException {
        if (this.nodeNamespaces == null) {
            SimpleSequence ss = new SimpleSequence(1);
            ss.add(this.currentNamespace);
            this.nodeNamespaces = ss;
        }
        int prevNodeNamespaceIndex = this.nodeNamespaceIndex;
        String prevNodeName = this.currentNodeName;
        String prevNodeNS = this.currentNodeNS;
        TemplateSequenceModel prevNodeNamespaces = this.nodeNamespaces;
        TemplateNodeModel prevVisitorNode = this.currentVisitorNode;
        this.currentVisitorNode = node;
        if (namespaces != null) {
            this.nodeNamespaces = namespaces;
        }
        try {
            TemplateModel macroOrTransform = getNodeProcessor(node);
            if (macroOrTransform instanceof Macro) {
                visit((Macro) macroOrTransform, null, null, null, null);
            } else if (macroOrTransform instanceof TemplateTransformModel) {
                visitAndTransform(null, (TemplateTransformModel) macroOrTransform, null);
            } else {
                String nodeType = node.getNodeType();
                if (nodeType != null) {
                    if (nodeType.equals("text") && (node instanceof TemplateScalarModel)) {
                        this.out.write(((TemplateScalarModel) node).getAsString());
                    } else if (nodeType.equals("document")) {
                        recurse(node, namespaces);
                    } else if (!nodeType.equals("pi") && !nodeType.equals("comment") && !nodeType.equals("document_type")) {
                        throw new _MiscTemplateException(this, noNodeHandlerDefinedDescription(node, node.getNodeNamespace(), nodeType));
                    }
                } else {
                    throw new _MiscTemplateException(this, noNodeHandlerDefinedDescription(node, node.getNodeNamespace(), "default"));
                }
            }
        } finally {
            this.currentVisitorNode = prevVisitorNode;
            this.nodeNamespaceIndex = prevNodeNamespaceIndex;
            this.currentNodeName = prevNodeName;
            this.currentNodeNS = prevNodeNS;
            this.nodeNamespaces = prevNodeNamespaces;
        }
    }

    private Object[] noNodeHandlerDefinedDescription(TemplateNodeModel node, String ns, String nodeType) throws TemplateModelException {
        String nsPrefix;
        if (ns != null) {
            if (ns.length() > 0) {
                nsPrefix = " and namespace ";
            } else {
                nsPrefix = " and no namespace";
            }
        } else {
            nsPrefix = "";
            ns = "";
        }
        return new Object[]{"No macro or directive is defined for node named ", new _DelayedJQuote(node.getNodeName()), nsPrefix, ns, ", and there is no fallback handler called @", nodeType, " either."};
    }

    void fallback() throws TemplateException, IOException {
        TemplateModel macroOrTransform = getNodeProcessor(this.currentNodeName, this.currentNodeNS, this.nodeNamespaceIndex);
        if (macroOrTransform instanceof Macro) {
            visit((Macro) macroOrTransform, null, null, null, null);
        } else if (macroOrTransform instanceof TemplateTransformModel) {
            visitAndTransform(null, (TemplateTransformModel) macroOrTransform, null);
        }
    }

    /* JADX WARN: Finally extract failed */
    void visit(Macro macro, Map namedArgs, List positionalArgs, List bodyParameterNames, TemplateElement nestedBlock) throws TemplateException, IOException {
        if (macro == Macro.DO_NOTHING_MACRO) {
            return;
        }
        pushElement(macro);
        try {
            Macro.Context previousMacroContext = this.currentMacroContext;
            macro.getClass();
            Macro.Context mc = new Macro.Context(macro, this, nestedBlock, bodyParameterNames);
            String catchAll = macro.getCatchAll();
            if (namedArgs != null) {
                unknownVars = catchAll != null ? new SimpleHash() : null;
                for (Map.Entry entry : namedArgs.entrySet()) {
                    String varName = (String) entry.getKey();
                    boolean hasVar = macro.hasArgNamed(varName);
                    if (!hasVar && catchAll == null) {
                        throw new _MiscTemplateException(this, new Object[]{"Macro ", new _DelayedJQuote(macro.getName()), " has no such argument: ", varName});
                    }
                    Expression arg = (Expression) entry.getValue();
                    TemplateModel value = arg.eval(this);
                    if (hasVar) {
                        mc.setLocalVar(varName, value);
                    } else {
                        ((SimpleHash) unknownVars).put(varName, value);
                    }
                }
            } else if (positionalArgs != null) {
                unknownVars = catchAll != null ? new SimpleSequence() : null;
                String[] argumentNames = macro.getArgumentNamesInternal();
                int size = positionalArgs.size();
                if (argumentNames.length < size && catchAll == null) {
                    throw new _MiscTemplateException(this, new Object[]{new StringBuffer().append("Macro ").append(StringUtil.jQuote(macro.getName())).append(" only accepts ").append(argumentNames.length).append(" parameters.").toString()});
                }
                for (int i = 0; i < size; i++) {
                    Expression argExp = (Expression) positionalArgs.get(i);
                    TemplateModel argModel = argExp.eval(this);
                    try {
                        if (i < argumentNames.length) {
                            String argName = argumentNames[i];
                            mc.setLocalVar(argName, argModel);
                        } else {
                            ((SimpleSequence) unknownVars).add(argModel);
                        }
                    } catch (RuntimeException re) {
                        throw new _MiscTemplateException(re, this);
                    }
                }
            }
            if (catchAll != null) {
                mc.setLocalVar(catchAll, unknownVars);
            }
            ArrayList prevLocalContextStack = this.localContextStack;
            this.localContextStack = null;
            Namespace prevNamespace = this.currentNamespace;
            Configurable prevParent = getParent();
            this.currentNamespace = (Namespace) this.macroToNamespaceLookup.get(macro);
            this.currentMacroContext = mc;
            try {
                try {
                    mc.runMacro(this);
                    this.currentMacroContext = previousMacroContext;
                    this.localContextStack = prevLocalContextStack;
                    this.currentNamespace = prevNamespace;
                    setParent(prevParent);
                } catch (Throwable th) {
                    this.currentMacroContext = previousMacroContext;
                    this.localContextStack = prevLocalContextStack;
                    this.currentNamespace = prevNamespace;
                    setParent(prevParent);
                    throw th;
                }
            } catch (ReturnInstruction.Return e) {
                this.currentMacroContext = previousMacroContext;
                this.localContextStack = prevLocalContextStack;
                this.currentNamespace = prevNamespace;
                setParent(prevParent);
            } catch (TemplateException te) {
                handleTemplateException(te);
                this.currentMacroContext = previousMacroContext;
                this.localContextStack = prevLocalContextStack;
                this.currentNamespace = prevNamespace;
                setParent(prevParent);
            }
        } finally {
            popElement();
        }
    }

    void visitMacroDef(Macro macro) {
        this.macroToNamespaceLookup.put(macro, this.currentNamespace);
        this.currentNamespace.put(macro.getName(), macro);
    }

    Namespace getMacroNamespace(Macro macro) {
        return (Namespace) this.macroToNamespaceLookup.get(macro);
    }

    void recurse(TemplateNodeModel node, TemplateSequenceModel namespaces) throws TemplateException, IOException {
        if (node == null) {
            node = getCurrentVisitorNode();
            if (node == null) {
                throw new _TemplateModelException("The target node of recursion is missing or null.");
            }
        }
        TemplateSequenceModel children = node.getChildNodes();
        if (children == null) {
            return;
        }
        for (int i = 0; i < children.size(); i++) {
            TemplateNodeModel child = (TemplateNodeModel) children.get(i);
            if (child != null) {
                visit(child, namespaces);
            }
        }
    }

    Macro.Context getCurrentMacroContext() {
        return this.currentMacroContext;
    }

    private void handleTemplateException(TemplateException te) throws TemplateException {
        if (this.lastThrowable == te) {
            throw te;
        }
        this.lastThrowable = te;
        if (logger.isErrorEnabled()) {
            logger.error("Error executing FreeMarker template", te);
        }
        if (te instanceof StopException) {
            throw te;
        }
        getTemplateExceptionHandler().handleTemplateException(te, this, this.out);
    }

    @Override // freemarker.core.Configurable
    public void setTemplateExceptionHandler(TemplateExceptionHandler templateExceptionHandler) {
        super.setTemplateExceptionHandler(templateExceptionHandler);
        this.lastThrowable = null;
    }

    @Override // freemarker.core.Configurable
    public void setLocale(Locale locale) {
        super.setLocale(locale);
        this.numberFormats = null;
        this.numberFormat = null;
        this.dateFormats = null;
        this.dateTimeFormat = null;
        this.dateFormat = null;
        this.timeFormat = null;
        this.collator = null;
    }

    @Override // freemarker.core.Configurable
    public void setTimeZone(TimeZone timeZone) {
        super.setTimeZone(timeZone);
        this.dateFormats = null;
        this.dateTimeFormat = null;
        this.dateFormat = null;
        this.timeFormat = null;
    }

    @Override // freemarker.core.Configurable
    public void setURLEscapingCharset(String urlEscapingCharset) {
        this.urlEscapingCharsetCached = false;
        super.setURLEscapingCharset(urlEscapingCharset);
    }

    @Override // freemarker.core.Configurable
    public void setOutputEncoding(String outputEncoding) {
        this.urlEscapingCharsetCached = false;
        super.setOutputEncoding(outputEncoding);
    }

    String getEffectiveURLEscapingCharset() {
        if (!this.urlEscapingCharsetCached) {
            this.cachedURLEscapingCharset = getURLEscapingCharset();
            if (this.cachedURLEscapingCharset == null) {
                this.cachedURLEscapingCharset = getOutputEncoding();
            }
            this.urlEscapingCharsetCached = true;
        }
        return this.cachedURLEscapingCharset;
    }

    Collator getCollator() {
        if (this.collator == null) {
            this.collator = Collator.getInstance(getLocale());
        }
        return this.collator;
    }

    public boolean applyEqualsOperator(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compare(leftValue, 1, rightValue, this);
    }

    public boolean applyEqualsOperatorLenient(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compareLenient(leftValue, 1, rightValue, this);
    }

    public boolean applyLessThanOperator(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compare(leftValue, 3, rightValue, this);
    }

    public boolean applyLessThanOrEqualsOperator(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compare(leftValue, 5, rightValue, this);
    }

    public boolean applyGreaterThanOperator(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compare(leftValue, 4, rightValue, this);
    }

    public boolean applyWithGreaterThanOrEqualsOperator(TemplateModel leftValue, TemplateModel rightValue) throws TemplateException {
        return EvalUtil.compare(leftValue, 6, rightValue, this);
    }

    public void setOut(Writer out) {
        this.out = out;
    }

    public Writer getOut() {
        return this.out;
    }

    String formatNumber(Number number) {
        if (this.numberFormat == null) {
            this.numberFormat = getNumberFormatObject(getNumberFormat());
        }
        return this.numberFormat.format(number);
    }

    @Override // freemarker.core.Configurable
    public void setNumberFormat(String formatName) {
        super.setNumberFormat(formatName);
        this.numberFormat = null;
    }

    String formatDate(Date date, int type) throws TemplateModelException {
        DateFormat df = getDateFormatObject(type);
        if (df == null) {
            throw new _TemplateModelException(new _ErrorDescriptionBuilder("Can't convert the date to string, because it's not known which parts of the date variable are in use.").tips(MessageUtil.UNKNOWN_DATE_TYPE_ERROR_TIPS));
        }
        return df.format(date);
    }

    @Override // freemarker.core.Configurable
    public void setTimeFormat(String formatName) {
        super.setTimeFormat(formatName);
        this.timeFormat = null;
    }

    @Override // freemarker.core.Configurable
    public void setDateFormat(String formatName) {
        super.setDateFormat(formatName);
        this.dateFormat = null;
    }

    @Override // freemarker.core.Configurable
    public void setDateTimeFormat(String formatName) {
        super.setDateTimeFormat(formatName);
        this.dateTimeFormat = null;
    }

    public Configuration getConfiguration() {
        return getTemplate().getConfiguration();
    }

    TemplateModel getLastReturnValue() {
        return this.lastReturnValue;
    }

    void setLastReturnValue(TemplateModel lastReturnValue) {
        this.lastReturnValue = lastReturnValue;
    }

    void clearLastReturnValue() {
        this.lastReturnValue = null;
    }

    NumberFormat getNumberFormatObject(String pattern) {
        NumberFormat format;
        if (this.numberFormats == null) {
            this.numberFormats = new HashMap();
        }
        NumberFormat format2 = (NumberFormat) this.numberFormats.get(pattern);
        if (format2 != null) {
            return format2;
        }
        synchronized (localizedNumberFormats) {
            Locale locale = getLocale();
            NumberFormatKey fk = new NumberFormatKey(pattern, locale);
            format = (NumberFormat) localizedNumberFormats.get(fk);
            if (format == null) {
                if ("number".equals(pattern)) {
                    format = NumberFormat.getNumberInstance(locale);
                } else if ("currency".equals(pattern)) {
                    format = NumberFormat.getCurrencyInstance(locale);
                } else if ("percent".equals(pattern)) {
                    format = NumberFormat.getPercentInstance(locale);
                } else if ("computer".equals(pattern)) {
                    format = getCNumberFormat();
                } else {
                    format = new DecimalFormat(pattern, new DecimalFormatSymbols(getLocale()));
                }
                localizedNumberFormats.put(fk, format);
            }
        }
        NumberFormat format3 = (NumberFormat) format.clone();
        this.numberFormats.put(pattern, format3);
        return format3;
    }

    DateFormat getDateFormatObject(int dateType) throws TemplateModelException {
        switch (dateType) {
            case 0:
                return null;
            case 1:
                if (this.timeFormat == null) {
                    this.timeFormat = getDateFormatObject(dateType, getTimeFormat());
                }
                return this.timeFormat;
            case 2:
                if (this.dateFormat == null) {
                    this.dateFormat = getDateFormatObject(dateType, getDateFormat());
                }
                return this.dateFormat;
            case 3:
                if (this.dateTimeFormat == null) {
                    this.dateTimeFormat = getDateFormatObject(dateType, getDateTimeFormat());
                }
                return this.dateTimeFormat;
            default:
                throw new _TemplateModelException(new Object[]{"Unrecognized date type: ", new Integer(dateType)});
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    DateFormat getDateFormatObject(int dateType, String pattern) throws TemplateModelException {
        DateFormat format;
        if (this.dateFormats == null) {
            this.dateFormats = new Map[4];
            this.dateFormats[0] = new HashMap();
            this.dateFormats[1] = new HashMap();
            this.dateFormats[2] = new HashMap();
            this.dateFormats[3] = new HashMap();
        }
        Map typedDateFormat = this.dateFormats[dateType];
        DateFormat format2 = (DateFormat) typedDateFormat.get(pattern);
        if (format2 != null) {
            return format2;
        }
        synchronized (localizedDateFormats) {
            Locale locale = getLocale();
            TimeZone timeZone = getTimeZone();
            DateFormatKey fk = new DateFormatKey(dateType, pattern, locale, timeZone);
            format = (DateFormat) localizedDateFormats.get(fk);
            if (format == null) {
                StringTokenizer tok = new StringTokenizer(pattern, "_");
                int dateStyle = tok.hasMoreTokens() ? parseDateStyleToken(tok.nextToken()) : 2;
                if (dateStyle != -1) {
                    switch (dateType) {
                        case 0:
                            throw new _TemplateModelException(new _ErrorDescriptionBuilder("Can't convert the date to string using a built-in format because it's not known which parts of the date are in use.").tips(MessageUtil.UNKNOWN_DATE_TO_STRING_TIPS));
                        case 1:
                            format = DateFormat.getTimeInstance(dateStyle, locale);
                            break;
                        case 2:
                            format = DateFormat.getDateInstance(dateStyle, locale);
                            break;
                        case 3:
                            int timeStyle = tok.hasMoreTokens() ? parseDateStyleToken(tok.nextToken()) : dateStyle;
                            if (timeStyle != -1) {
                                format = DateFormat.getDateTimeInstance(dateStyle, timeStyle, locale);
                                break;
                            }
                            break;
                    }
                }
                if (format == null) {
                    try {
                        format = new SimpleDateFormat(pattern, locale);
                    } catch (IllegalArgumentException e) {
                        throw new _TemplateModelException(e, new Object[]{"Can't parse ", new _DelayedJQuote(pattern), " to a date format, because:\n", e});
                    }
                }
                format.setTimeZone(timeZone);
                localizedDateFormats.put(fk, format);
            }
        }
        DateFormat format3 = (DateFormat) format.clone();
        typedDateFormat.put(pattern, format3);
        return format3;
    }

    int parseDateStyleToken(String token) {
        if ("short".equals(token)) {
            return 3;
        }
        if ("medium".equals(token)) {
            return 2;
        }
        if ("long".equals(token)) {
            return 1;
        }
        if ("full".equals(token)) {
            return 0;
        }
        return -1;
    }

    DateUtil.DateToISO8601CalendarFactory getISOBuiltInCalendar() {
        if (this.isoBuiltInCalendarFactory == null) {
            this.isoBuiltInCalendarFactory = new DateUtil.TrivialDateToISO8601CalendarFactory();
        }
        return this.isoBuiltInCalendarFactory;
    }

    public NumberFormat getCNumberFormat() {
        if (this.cNumberFormat == null) {
            this.cNumberFormat = (DecimalFormat) C_NUMBER_FORMAT.clone();
        }
        return this.cNumberFormat;
    }

    TemplateTransformModel getTransform(Expression exp) throws TemplateException {
        TemplateTransformModel ttm = null;
        TemplateModel tm = exp.eval(this);
        if (tm instanceof TemplateTransformModel) {
            ttm = (TemplateTransformModel) tm;
        } else if (exp instanceof Identifier) {
            TemplateModel tm2 = getConfiguration().getSharedVariable(exp.toString());
            if (tm2 instanceof TemplateTransformModel) {
                ttm = (TemplateTransformModel) tm2;
            }
        }
        return ttm;
    }

    public TemplateModel getLocalVariable(String name) throws TemplateModelException {
        if (this.localContextStack != null) {
            for (int i = this.localContextStack.size() - 1; i >= 0; i--) {
                LocalContext lc = (LocalContext) this.localContextStack.get(i);
                TemplateModel tm = lc.getLocalVariable(name);
                if (tm != null) {
                    return tm;
                }
            }
        }
        if (this.currentMacroContext == null) {
            return null;
        }
        return this.currentMacroContext.getLocalVariable(name);
    }

    public TemplateModel getVariable(String name) throws TemplateModelException {
        TemplateModel result = getLocalVariable(name);
        if (result == null) {
            result = this.currentNamespace.get(name);
        }
        if (result == null) {
            result = getGlobalVariable(name);
        }
        return result;
    }

    public TemplateModel getGlobalVariable(String name) throws TemplateModelException {
        TemplateModel result = this.globalNamespace.get(name);
        if (result == null) {
            result = this.rootDataModel.get(name);
        }
        if (result == null) {
            result = getConfiguration().getSharedVariable(name);
        }
        return result;
    }

    public void setGlobalVariable(String name, TemplateModel model) {
        this.globalNamespace.put(name, model);
    }

    public void setVariable(String name, TemplateModel model) {
        this.currentNamespace.put(name, model);
    }

    public void setLocalVariable(String name, TemplateModel model) {
        if (this.currentMacroContext == null) {
            throw new IllegalStateException("Not executing macro body");
        }
        this.currentMacroContext.setLocalVar(name, model);
    }

    public Set getKnownVariableNames() throws TemplateModelException {
        Set set = getConfiguration().getSharedVariableNames();
        if (this.rootDataModel instanceof TemplateHashModelEx) {
            TemplateModelIterator rootNames = ((TemplateHashModelEx) this.rootDataModel).keys().iterator();
            while (rootNames.hasNext()) {
                set.add(((TemplateScalarModel) rootNames.next()).getAsString());
            }
        }
        TemplateModelIterator tmi = this.globalNamespace.keys().iterator();
        while (tmi.hasNext()) {
            set.add(((TemplateScalarModel) tmi.next()).getAsString());
        }
        TemplateModelIterator tmi2 = this.currentNamespace.keys().iterator();
        while (tmi2.hasNext()) {
            set.add(((TemplateScalarModel) tmi2.next()).getAsString());
        }
        if (this.currentMacroContext != null) {
            set.addAll(this.currentMacroContext.getLocalVariableNames());
        }
        if (this.localContextStack != null) {
            for (int i = this.localContextStack.size() - 1; i >= 0; i--) {
                LocalContext lc = (LocalContext) this.localContextStack.get(i);
                set.addAll(lc.getLocalVariableNames());
            }
        }
        return set;
    }

    public void outputInstructionStack(PrintWriter pw) {
        outputInstructionStack(getInstructionStackSnapshot(), pw);
        pw.flush();
    }

    static void outputInstructionStack(TemplateElement[] instructionStackSnapshot, PrintWriter pw) {
        pw.println("----------");
        if (instructionStackSnapshot != null) {
            int i = 0;
            while (i < instructionStackSnapshot.length) {
                TemplateElement stackEl = instructionStackSnapshot[i];
                pw.print(i == 0 ? "==> " : "    ");
                pw.println(instructionStackItemToString(stackEl));
                i++;
            }
        } else {
            pw.println("[the stack was empty]");
        }
        pw.println("----------");
    }

    TemplateElement[] getInstructionStackSnapshot() {
        int requiredLength = 0;
        int ln = this.instructionStack.size();
        for (int i = 0; i < ln; i++) {
            TemplateElement stackEl = (TemplateElement) this.instructionStack.get(i);
            if (i == ln || stackEl.isShownInStackTrace()) {
                requiredLength++;
            }
        }
        if (requiredLength == 0) {
            return null;
        }
        TemplateElement[] result = new TemplateElement[requiredLength];
        int dstIdx = requiredLength - 1;
        for (int i2 = 0; i2 < ln; i2++) {
            TemplateElement stackEl2 = (TemplateElement) this.instructionStack.get(i2);
            if (i2 == ln || stackEl2.isShownInStackTrace()) {
                int i3 = dstIdx;
                dstIdx--;
                result[i3] = stackEl2;
            }
        }
        return result;
    }

    static String instructionStackItemToString(TemplateElement stackEl) {
        StringBuffer sb = new StringBuffer();
        sb.append(MessageUtil.shorten(stackEl.getDescription(), 40));
        sb.append("  [");
        Macro enclosingMacro = getEnclosingMacro(stackEl);
        if (enclosingMacro != null) {
            sb.append(MessageUtil.formatLocationForEvaluationError(enclosingMacro, stackEl.beginLine, stackEl.beginColumn));
        } else {
            sb.append(MessageUtil.formatLocationForEvaluationError(stackEl.getTemplate(), stackEl.beginLine, stackEl.beginColumn));
        }
        sb.append("]");
        return sb.toString();
    }

    private static Macro getEnclosingMacro(TemplateElement stackEl) {
        while (stackEl != null) {
            if (stackEl instanceof Macro) {
                return (Macro) stackEl;
            }
            stackEl = (TemplateElement) stackEl.getParent();
        }
        return null;
    }

    private void pushLocalContext(LocalContext localContext) {
        if (this.localContextStack == null) {
            this.localContextStack = new ArrayList();
        }
        this.localContextStack.add(localContext);
    }

    private void popLocalContext() {
        this.localContextStack.remove(this.localContextStack.size() - 1);
    }

    ArrayList getLocalContextStack() {
        return this.localContextStack;
    }

    public Namespace getNamespace(String name) {
        if (name.startsWith("/")) {
            name = name.substring(1);
        }
        if (this.loadedLibs != null) {
            return (Namespace) this.loadedLibs.get(name);
        }
        return null;
    }

    public Namespace getMainNamespace() {
        return this.mainNamespace;
    }

    public Namespace getCurrentNamespace() {
        return this.currentNamespace;
    }

    public Namespace getGlobalNamespace() {
        return this.globalNamespace;
    }

    public TemplateHashModel getDataModel() {
        TemplateHashModel result = new TemplateHashModel(this) { // from class: freemarker.core.Environment.3
            private final Environment this$0;

            {
                this.this$0 = this;
            }

            @Override // freemarker.template.TemplateHashModel
            public boolean isEmpty() {
                return false;
            }

            @Override // freemarker.template.TemplateHashModel
            public TemplateModel get(String key) throws TemplateModelException {
                TemplateModel value = this.this$0.rootDataModel.get(key);
                if (value == null) {
                    value = this.this$0.getConfiguration().getSharedVariable(key);
                }
                return value;
            }
        };
        if (this.rootDataModel instanceof TemplateHashModelEx) {
            return new TemplateHashModelEx(this, result) { // from class: freemarker.core.Environment.4
                private final TemplateHashModel val$result;
                private final Environment this$0;

                {
                    this.this$0 = this;
                    this.val$result = result;
                }

                @Override // freemarker.template.TemplateHashModel
                public boolean isEmpty() throws TemplateModelException {
                    return this.val$result.isEmpty();
                }

                @Override // freemarker.template.TemplateHashModel
                public TemplateModel get(String key) throws TemplateModelException {
                    return this.val$result.get(key);
                }

                @Override // freemarker.template.TemplateHashModelEx
                public TemplateCollectionModel values() throws TemplateModelException {
                    return ((TemplateHashModelEx) this.this$0.rootDataModel).values();
                }

                @Override // freemarker.template.TemplateHashModelEx
                public TemplateCollectionModel keys() throws TemplateModelException {
                    return ((TemplateHashModelEx) this.this$0.rootDataModel).keys();
                }

                @Override // freemarker.template.TemplateHashModelEx
                public int size() throws TemplateModelException {
                    return ((TemplateHashModelEx) this.this$0.rootDataModel).size();
                }
            };
        }
        return result;
    }

    public TemplateHashModel getGlobalVariables() {
        return new TemplateHashModel(this) { // from class: freemarker.core.Environment.5
            private final Environment this$0;

            {
                this.this$0 = this;
            }

            @Override // freemarker.template.TemplateHashModel
            public boolean isEmpty() {
                return false;
            }

            @Override // freemarker.template.TemplateHashModel
            public TemplateModel get(String key) throws TemplateModelException {
                TemplateModel result = this.this$0.globalNamespace.get(key);
                if (result == null) {
                    result = this.this$0.rootDataModel.get(key);
                }
                if (result == null) {
                    result = this.this$0.getConfiguration().getSharedVariable(key);
                }
                return result;
            }
        };
    }

    private void pushElement(TemplateElement element) {
        this.instructionStack.add(element);
    }

    private void popElement() {
        this.instructionStack.remove(this.instructionStack.size() - 1);
    }

    void replaceElemetStackTop(TemplateElement instr) {
        this.instructionStack.set(this.instructionStack.size() - 1, instr);
    }

    public TemplateNodeModel getCurrentVisitorNode() {
        return this.currentVisitorNode;
    }

    public void setCurrentVisitorNode(TemplateNodeModel node) {
        this.currentVisitorNode = node;
    }

    TemplateModel getNodeProcessor(TemplateNodeModel node) throws TemplateException {
        String nodeName = node.getNodeName();
        if (nodeName == null) {
            throw new _MiscTemplateException(this, "Node name is null.");
        }
        TemplateModel result = getNodeProcessor(nodeName, node.getNodeNamespace(), 0);
        if (result == null) {
            String type = node.getNodeType();
            if (type == null) {
                type = "default";
            }
            result = getNodeProcessor(new StringBuffer().append("@").append(type).toString(), (String) null, 0);
        }
        return result;
    }

    private TemplateModel getNodeProcessor(String nodeName, String nsURI, int startIndex) throws TemplateException {
        TemplateModel result = null;
        int i = startIndex;
        while (i < this.nodeNamespaces.size()) {
            try {
                Namespace ns = (Namespace) this.nodeNamespaces.get(i);
                result = getNodeProcessor(ns, nodeName, nsURI);
                if (result != null) {
                    break;
                }
                i++;
            } catch (ClassCastException e) {
                throw new _MiscTemplateException(this, "A \"using\" clause should contain a sequence of namespaces or strings that indicate the location of importable macro libraries.");
            }
        }
        if (result != null) {
            this.nodeNamespaceIndex = i + 1;
            this.currentNodeName = nodeName;
            this.currentNodeNS = nsURI;
        }
        return result;
    }

    private TemplateModel getNodeProcessor(Namespace ns, String localName, String nsURI) throws TemplateException {
        TemplateModel result = null;
        if (nsURI == null) {
            result = ns.get(localName);
            if (!(result instanceof Macro) && !(result instanceof TemplateTransformModel)) {
                result = null;
            }
        } else {
            Template template = ns.getTemplate();
            String prefix = template.getPrefixForNamespace(nsURI);
            if (prefix == null) {
                return null;
            }
            if (prefix.length() > 0) {
                result = ns.get(new StringBuffer().append(prefix).append(":").append(localName).toString());
                if (!(result instanceof Macro) && !(result instanceof TemplateTransformModel)) {
                    result = null;
                }
            } else {
                if (nsURI.length() == 0) {
                    result = ns.get(new StringBuffer().append("N:").append(localName).toString());
                    if (!(result instanceof Macro) && !(result instanceof TemplateTransformModel)) {
                        result = null;
                    }
                }
                if (nsURI.equals(template.getDefaultNS())) {
                    result = ns.get(new StringBuffer().append("D:").append(localName).toString());
                    if (!(result instanceof Macro) && !(result instanceof TemplateTransformModel)) {
                        result = null;
                    }
                }
                if (result == null) {
                    result = ns.get(localName);
                    if (!(result instanceof Macro) && !(result instanceof TemplateTransformModel)) {
                        result = null;
                    }
                }
            }
        }
        return result;
    }

    public void include(String name, String encoding, boolean parse) throws IOException, TemplateException {
        include(getTemplateForInclusion(name, encoding, parse));
    }

    public Template getTemplateForInclusion(String name, String encoding, boolean parse) throws IOException {
        if (encoding == null) {
            encoding = getTemplate().getEncoding();
        }
        if (encoding == null) {
            encoding = getConfiguration().getEncoding(getLocale());
        }
        return getConfiguration().getTemplate(name, getLocale(), encoding, parse);
    }

    public void include(Template includedTemplate) throws TemplateException, IOException {
        Template prevTemplate = getTemplate();
        setParent(includedTemplate);
        importMacros(includedTemplate);
        try {
            visit(includedTemplate.getRootTreeNode());
            setParent(prevTemplate);
        } catch (Throwable th) {
            setParent(prevTemplate);
            throw th;
        }
    }

    public Namespace importLib(String name, String namespace) throws IOException, TemplateException {
        return importLib(getTemplateForImporting(name), namespace);
    }

    public Template getTemplateForImporting(String name) throws IOException {
        return getTemplateForInclusion(name, null, true);
    }

    public Namespace importLib(Template loadedTemplate, String namespace) throws IOException, TemplateException {
        if (this.loadedLibs == null) {
            this.loadedLibs = new HashMap();
        }
        String templateName = loadedTemplate.getName();
        Namespace existingNamespace = (Namespace) this.loadedLibs.get(templateName);
        if (existingNamespace != null) {
            if (namespace != null) {
                setVariable(namespace, existingNamespace);
            }
        } else {
            Namespace newNamespace = new Namespace(this, loadedTemplate);
            if (namespace != null) {
                this.currentNamespace.put(namespace, newNamespace);
                if (this.currentNamespace == this.mainNamespace) {
                    this.globalNamespace.put(namespace, newNamespace);
                }
            }
            Namespace prevNamespace = this.currentNamespace;
            this.currentNamespace = newNamespace;
            this.loadedLibs.put(templateName, this.currentNamespace);
            Writer prevOut = this.out;
            this.out = NullWriter.INSTANCE;
            try {
                include(loadedTemplate);
                this.out = prevOut;
                this.currentNamespace = prevNamespace;
            } catch (Throwable th) {
                this.out = prevOut;
                this.currentNamespace = prevNamespace;
                throw th;
            }
        }
        return (Namespace) this.loadedLibs.get(templateName);
    }

    String renderElementToString(TemplateElement te) throws IOException, TemplateException {
        Writer prevOut = this.out;
        try {
            StringWriter sw = new StringWriter();
            this.out = sw;
            visit(te);
            String stringWriter = sw.toString();
            this.out = prevOut;
            return stringWriter;
        } catch (Throwable th) {
            this.out = prevOut;
            throw th;
        }
    }

    void importMacros(Template template) {
        Iterator it = template.getMacros().values().iterator();
        while (it.hasNext()) {
            visitMacroDef((Macro) it.next());
        }
    }

    public String getNamespaceForPrefix(String prefix) {
        return this.currentNamespace.getTemplate().getNamespaceForPrefix(prefix);
    }

    public String getPrefixForNamespace(String nsURI) {
        return this.currentNamespace.getTemplate().getPrefixForNamespace(nsURI);
    }

    public String getDefaultNS() {
        return this.currentNamespace.getTemplate().getDefaultNS();
    }

    public Object __getitem__(String key) throws TemplateModelException {
        return BeansWrapper.getDefaultInstance().unwrap(getVariable(key));
    }

    public void __setitem__(String key, Object o) throws TemplateException {
        setGlobalVariable(key, getObjectWrapper().wrap(o));
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Environment$NumberFormatKey.class */
    private static final class NumberFormatKey {
        private final String pattern;
        private final Locale locale;

        NumberFormatKey(String pattern, Locale locale) {
            this.pattern = pattern;
            this.locale = locale;
        }

        public boolean equals(Object o) {
            if (o instanceof NumberFormatKey) {
                NumberFormatKey fk = (NumberFormatKey) o;
                return fk.pattern.equals(this.pattern) && fk.locale.equals(this.locale);
            }
            return false;
        }

        public int hashCode() {
            return this.pattern.hashCode() ^ this.locale.hashCode();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Environment$DateFormatKey.class */
    private static final class DateFormatKey {
        private final int dateType;
        private final String pattern;
        private final Locale locale;
        private final TimeZone timeZone;

        DateFormatKey(int dateType, String pattern, Locale locale, TimeZone timeZone) {
            this.dateType = dateType;
            this.pattern = pattern;
            this.locale = locale;
            this.timeZone = timeZone;
        }

        public boolean equals(Object o) {
            if (o instanceof DateFormatKey) {
                DateFormatKey fk = (DateFormatKey) o;
                return this.dateType == fk.dateType && fk.pattern.equals(this.pattern) && fk.locale.equals(this.locale) && fk.timeZone.equals(this.timeZone);
            }
            return false;
        }

        public int hashCode() {
            return ((this.dateType ^ this.pattern.hashCode()) ^ this.locale.hashCode()) ^ this.timeZone.hashCode();
        }
    }

    /* loaded from: freemarker-2.3.20.jar:freemarker/core/Environment$Namespace.class */
    public class Namespace extends SimpleHash {
        private Template template;
        private final Environment this$0;

        Namespace(Environment environment) {
            this.this$0 = environment;
            this.template = environment.getTemplate();
        }

        Namespace(Environment environment, Template template) {
            this.this$0 = environment;
            this.template = template;
        }

        public Template getTemplate() {
            return this.template == null ? this.this$0.getTemplate() : this.template;
        }
    }

    boolean getFastInvalidReferenceExceptions() {
        return this.fastInvalidReferenceExceptions;
    }

    boolean setFastInvalidReferenceExceptions(boolean b) {
        boolean res = this.fastInvalidReferenceExceptions;
        this.fastInvalidReferenceExceptions = b;
        return res;
    }
}
