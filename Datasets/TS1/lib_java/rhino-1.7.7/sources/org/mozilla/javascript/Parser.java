package org.mozilla.javascript;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.mozilla.classfile.ClassFileWriter;
import org.mozilla.javascript.Token;
import org.mozilla.javascript.ast.ArrayComprehension;
import org.mozilla.javascript.ast.ArrayComprehensionLoop;
import org.mozilla.javascript.ast.ArrayLiteral;
import org.mozilla.javascript.ast.Assignment;
import org.mozilla.javascript.ast.AstNode;
import org.mozilla.javascript.ast.AstRoot;
import org.mozilla.javascript.ast.Block;
import org.mozilla.javascript.ast.BreakStatement;
import org.mozilla.javascript.ast.CatchClause;
import org.mozilla.javascript.ast.Comment;
import org.mozilla.javascript.ast.ConditionalExpression;
import org.mozilla.javascript.ast.ContinueStatement;
import org.mozilla.javascript.ast.DestructuringForm;
import org.mozilla.javascript.ast.DoLoop;
import org.mozilla.javascript.ast.ElementGet;
import org.mozilla.javascript.ast.EmptyExpression;
import org.mozilla.javascript.ast.EmptyStatement;
import org.mozilla.javascript.ast.ErrorNode;
import org.mozilla.javascript.ast.ExpressionStatement;
import org.mozilla.javascript.ast.ForInLoop;
import org.mozilla.javascript.ast.ForLoop;
import org.mozilla.javascript.ast.FunctionCall;
import org.mozilla.javascript.ast.FunctionNode;
import org.mozilla.javascript.ast.GeneratorExpression;
import org.mozilla.javascript.ast.GeneratorExpressionLoop;
import org.mozilla.javascript.ast.IdeErrorReporter;
import org.mozilla.javascript.ast.IfStatement;
import org.mozilla.javascript.ast.InfixExpression;
import org.mozilla.javascript.ast.Jump;
import org.mozilla.javascript.ast.KeywordLiteral;
import org.mozilla.javascript.ast.Label;
import org.mozilla.javascript.ast.LabeledStatement;
import org.mozilla.javascript.ast.LetNode;
import org.mozilla.javascript.ast.Loop;
import org.mozilla.javascript.ast.Name;
import org.mozilla.javascript.ast.NewExpression;
import org.mozilla.javascript.ast.NumberLiteral;
import org.mozilla.javascript.ast.ObjectLiteral;
import org.mozilla.javascript.ast.ObjectProperty;
import org.mozilla.javascript.ast.ParenthesizedExpression;
import org.mozilla.javascript.ast.PropertyGet;
import org.mozilla.javascript.ast.RegExpLiteral;
import org.mozilla.javascript.ast.ReturnStatement;
import org.mozilla.javascript.ast.Scope;
import org.mozilla.javascript.ast.ScriptNode;
import org.mozilla.javascript.ast.StringLiteral;
import org.mozilla.javascript.ast.SwitchCase;
import org.mozilla.javascript.ast.SwitchStatement;
import org.mozilla.javascript.ast.Symbol;
import org.mozilla.javascript.ast.ThrowStatement;
import org.mozilla.javascript.ast.TryStatement;
import org.mozilla.javascript.ast.UnaryExpression;
import org.mozilla.javascript.ast.VariableDeclaration;
import org.mozilla.javascript.ast.VariableInitializer;
import org.mozilla.javascript.ast.WhileLoop;
import org.mozilla.javascript.ast.WithStatement;
import org.mozilla.javascript.ast.XmlDotQuery;
import org.mozilla.javascript.ast.XmlElemRef;
import org.mozilla.javascript.ast.XmlMemberGet;
import org.mozilla.javascript.ast.XmlPropRef;
import org.mozilla.javascript.ast.XmlRef;
import org.mozilla.javascript.ast.Yield;

/* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Parser.class */
public class Parser {
    public static final int ARGC_LIMIT = 65536;
    static final int CLEAR_TI_MASK = 65535;
    static final int TI_AFTER_EOL = 65536;
    static final int TI_CHECK_LABEL = 131072;
    CompilerEnvirons compilerEnv;
    private ErrorReporter errorReporter;
    private IdeErrorReporter errorCollector;
    private String sourceURI;
    private char[] sourceChars;
    boolean calledByCompileFunction;
    private boolean parseFinished;
    private TokenStream ts;
    private int currentFlaggedToken;
    private int currentToken;
    private int syntaxErrorCount;
    private List<Comment> scannedComments;
    private Comment currentJsDocComment;
    protected int nestingOfFunction;
    private LabeledStatement currentLabel;
    private boolean inDestructuringAssignment;
    protected boolean inUseStrictDirective;
    ScriptNode currentScriptOrFn;
    Scope currentScope;
    private int endFlags;
    private boolean inForInit;
    private Map<String, LabeledStatement> labelSet;
    private List<Loop> loopSet;
    private List<Jump> loopAndSwitchSet;
    private int prevNameTokenStart;
    private String prevNameTokenString;
    private int prevNameTokenLineno;
    private static final int PROP_ENTRY = 1;
    private static final int GET_ENTRY = 2;
    private static final int SET_ENTRY = 4;
    private static final int METHOD_ENTRY = 8;

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Parser$ParserException.class */
    private static class ParserException extends RuntimeException {
        static final long serialVersionUID = 5882582646773765630L;

        private ParserException() {
        }
    }

    public Parser() {
        this(new CompilerEnvirons());
    }

    public Parser(CompilerEnvirons compilerEnv) {
        this(compilerEnv, compilerEnv.getErrorReporter());
    }

    public Parser(CompilerEnvirons compilerEnv, ErrorReporter errorReporter) {
        this.currentFlaggedToken = 0;
        this.prevNameTokenString = "";
        this.compilerEnv = compilerEnv;
        this.errorReporter = errorReporter;
        if (errorReporter instanceof IdeErrorReporter) {
            this.errorCollector = (IdeErrorReporter) errorReporter;
        }
    }

    void addStrictWarning(String messageId, String messageArg) {
        int beg = -1;
        int end = -1;
        if (this.ts != null) {
            beg = this.ts.tokenBeg;
            end = this.ts.tokenEnd - this.ts.tokenBeg;
        }
        addStrictWarning(messageId, messageArg, beg, end);
    }

    void addStrictWarning(String messageId, String messageArg, int position, int length) {
        if (this.compilerEnv.isStrictMode()) {
            addWarning(messageId, messageArg, position, length);
        }
    }

    void addWarning(String messageId, String messageArg) {
        int beg = -1;
        int end = -1;
        if (this.ts != null) {
            beg = this.ts.tokenBeg;
            end = this.ts.tokenEnd - this.ts.tokenBeg;
        }
        addWarning(messageId, messageArg, beg, end);
    }

    void addWarning(String messageId, int position, int length) {
        addWarning(messageId, null, position, length);
    }

    void addWarning(String messageId, String messageArg, int position, int length) {
        String message = lookupMessage(messageId, messageArg);
        if (this.compilerEnv.reportWarningAsError()) {
            addError(messageId, messageArg, position, length);
        } else if (this.errorCollector != null) {
            this.errorCollector.warning(message, this.sourceURI, position, length);
        } else {
            this.errorReporter.warning(message, this.sourceURI, this.ts.getLineno(), this.ts.getLine(), this.ts.getOffset());
        }
    }

    void addError(String messageId) {
        addError(messageId, this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg);
    }

    void addError(String messageId, int position, int length) {
        addError(messageId, null, position, length);
    }

    void addError(String messageId, String messageArg) {
        addError(messageId, messageArg, this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg);
    }

    void addError(String messageId, String messageArg, int position, int length) {
        this.syntaxErrorCount++;
        String message = lookupMessage(messageId, messageArg);
        if (this.errorCollector != null) {
            this.errorCollector.error(message, this.sourceURI, position, length);
            return;
        }
        int lineno = 1;
        int offset = 1;
        String line = "";
        if (this.ts != null) {
            lineno = this.ts.getLineno();
            line = this.ts.getLine();
            offset = this.ts.getOffset();
        }
        this.errorReporter.error(message, this.sourceURI, lineno, line, offset);
    }

    private void addStrictWarning(String messageId, String messageArg, int position, int length, int line, String lineSource, int lineOffset) {
        if (this.compilerEnv.isStrictMode()) {
            addWarning(messageId, messageArg, position, length, line, lineSource, lineOffset);
        }
    }

    private void addWarning(String messageId, String messageArg, int position, int length, int line, String lineSource, int lineOffset) {
        String message = lookupMessage(messageId, messageArg);
        if (this.compilerEnv.reportWarningAsError()) {
            addError(messageId, messageArg, position, length, line, lineSource, lineOffset);
        } else if (this.errorCollector != null) {
            this.errorCollector.warning(message, this.sourceURI, position, length);
        } else {
            this.errorReporter.warning(message, this.sourceURI, line, lineSource, lineOffset);
        }
    }

    private void addError(String messageId, String messageArg, int position, int length, int line, String lineSource, int lineOffset) {
        this.syntaxErrorCount++;
        String message = lookupMessage(messageId, messageArg);
        if (this.errorCollector != null) {
            this.errorCollector.error(message, this.sourceURI, position, length);
        } else {
            this.errorReporter.error(message, this.sourceURI, line, lineSource, lineOffset);
        }
    }

    String lookupMessage(String messageId) {
        return lookupMessage(messageId, null);
    }

    String lookupMessage(String messageId, String messageArg) {
        return messageArg == null ? ScriptRuntime.getMessage0(messageId) : ScriptRuntime.getMessage1(messageId, messageArg);
    }

    void reportError(String messageId) {
        reportError(messageId, null);
    }

    void reportError(String messageId, String messageArg) {
        if (this.ts == null) {
            reportError(messageId, messageArg, 1, 1);
        } else {
            reportError(messageId, messageArg, this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg);
        }
    }

    void reportError(String messageId, int position, int length) {
        reportError(messageId, null, position, length);
    }

    void reportError(String messageId, String messageArg, int position, int length) {
        addError(messageId, position, length);
        if (!this.compilerEnv.recoverFromErrors()) {
            throw new ParserException();
        }
    }

    private int getNodeEnd(AstNode n) {
        return n.getPosition() + n.getLength();
    }

    private void recordComment(int lineno, String comment) {
        if (this.scannedComments == null) {
            this.scannedComments = new ArrayList();
        }
        Comment commentNode = new Comment(this.ts.tokenBeg, this.ts.getTokenLength(), this.ts.commentType, comment);
        if (this.ts.commentType == Token.CommentType.JSDOC && this.compilerEnv.isRecordingLocalJsDocComments()) {
            this.currentJsDocComment = commentNode;
        }
        commentNode.setLineno(lineno);
        this.scannedComments.add(commentNode);
    }

    private Comment getAndResetJsDoc() {
        Comment saved = this.currentJsDocComment;
        this.currentJsDocComment = null;
        return saved;
    }

    private int getNumberOfEols(String comment) {
        int lines = 0;
        for (int i = comment.length() - 1; i >= 0; i--) {
            if (comment.charAt(i) == '\n') {
                lines++;
            }
        }
        return lines;
    }

    private int peekToken() throws IOException {
        if (this.currentFlaggedToken != 0) {
            return this.currentToken;
        }
        int lineno = this.ts.getLineno();
        int tt = this.ts.getToken();
        boolean sawEOL = false;
        while (true) {
            if (tt != 1 && tt != 161) {
                break;
            }
            if (tt == 1) {
                lineno++;
                sawEOL = true;
            } else if (this.compilerEnv.isRecordingComments()) {
                String comment = this.ts.getAndResetCurrentComment();
                recordComment(lineno, comment);
                lineno += getNumberOfEols(comment);
            }
            tt = this.ts.getToken();
        }
        this.currentToken = tt;
        this.currentFlaggedToken = tt | (sawEOL ? 65536 : 0);
        return this.currentToken;
    }

    private int peekFlaggedToken() throws IOException {
        peekToken();
        return this.currentFlaggedToken;
    }

    private void consumeToken() {
        this.currentFlaggedToken = 0;
    }

    private int nextToken() throws IOException {
        int tt = peekToken();
        consumeToken();
        return tt;
    }

    private int nextFlaggedToken() throws IOException {
        peekToken();
        int ttFlagged = this.currentFlaggedToken;
        consumeToken();
        return ttFlagged;
    }

    private boolean matchToken(int toMatch) throws IOException {
        if (peekToken() != toMatch) {
            return false;
        }
        consumeToken();
        return true;
    }

    private int peekTokenOrEOL() throws IOException {
        int tt = peekToken();
        if ((this.currentFlaggedToken & 65536) != 0) {
            tt = 1;
        }
        return tt;
    }

    private boolean mustMatchToken(int toMatch, String messageId) throws IOException {
        return mustMatchToken(toMatch, messageId, this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg);
    }

    private boolean mustMatchToken(int toMatch, String msgId, int pos, int len) throws IOException {
        if (matchToken(toMatch)) {
            return true;
        }
        reportError(msgId, pos, len);
        return false;
    }

    private void mustHaveXML() {
        if (!this.compilerEnv.isXmlAvailable()) {
            reportError("msg.XML.not.available");
        }
    }

    public boolean eof() {
        return this.ts.eof();
    }

    boolean insideFunction() {
        return this.nestingOfFunction != 0;
    }

    void pushScope(Scope scope) {
        Scope parent = scope.getParentScope();
        if (parent != null) {
            if (parent != this.currentScope) {
                codeBug();
            }
        } else {
            this.currentScope.addChildScope(scope);
        }
        this.currentScope = scope;
    }

    void popScope() {
        this.currentScope = this.currentScope.getParentScope();
    }

    private void enterLoop(Loop loop) {
        if (this.loopSet == null) {
            this.loopSet = new ArrayList();
        }
        this.loopSet.add(loop);
        if (this.loopAndSwitchSet == null) {
            this.loopAndSwitchSet = new ArrayList();
        }
        this.loopAndSwitchSet.add(loop);
        pushScope(loop);
        if (this.currentLabel != null) {
            this.currentLabel.setStatement(loop);
            this.currentLabel.getFirstLabel().setLoop(loop);
            loop.setRelative(-this.currentLabel.getPosition());
        }
    }

    private void exitLoop() {
        Loop loop = this.loopSet.remove(this.loopSet.size() - 1);
        this.loopAndSwitchSet.remove(this.loopAndSwitchSet.size() - 1);
        if (loop.getParent() != null) {
            loop.setRelative(loop.getParent().getPosition());
        }
        popScope();
    }

    private void enterSwitch(SwitchStatement node) {
        if (this.loopAndSwitchSet == null) {
            this.loopAndSwitchSet = new ArrayList();
        }
        this.loopAndSwitchSet.add(node);
    }

    private void exitSwitch() {
        this.loopAndSwitchSet.remove(this.loopAndSwitchSet.size() - 1);
    }

    public AstRoot parse(String sourceString, String sourceURI, int lineno) {
        if (this.parseFinished) {
            throw new IllegalStateException("parser reused");
        }
        this.sourceURI = sourceURI;
        if (this.compilerEnv.isIdeMode()) {
            this.sourceChars = sourceString.toCharArray();
        }
        this.ts = new TokenStream(this, null, sourceString, lineno);
        try {
            try {
                AstRoot parse = parse();
                this.parseFinished = true;
                return parse;
            } catch (IOException e) {
                throw new IllegalStateException();
            }
        } catch (Throwable th) {
            this.parseFinished = true;
            throw th;
        }
    }

    public AstRoot parse(Reader sourceReader, String sourceURI, int lineno) throws IOException {
        if (this.parseFinished) {
            throw new IllegalStateException("parser reused");
        }
        if (this.compilerEnv.isIdeMode()) {
            return parse(readFully(sourceReader), sourceURI, lineno);
        }
        try {
            this.sourceURI = sourceURI;
            this.ts = new TokenStream(this, sourceReader, null, lineno);
            AstRoot parse = parse();
            this.parseFinished = true;
            return parse;
        } catch (Throwable th) {
            this.parseFinished = true;
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x00f5  */
    /* JADX WARN: Removed duplicated region for block: B:46:0x012c  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private org.mozilla.javascript.ast.AstRoot parse() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 414
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.Parser.parse():org.mozilla.javascript.ast.AstRoot");
    }

    private AstNode parseFunctionBody() throws IOException {
        AstNode n;
        boolean isExpressionClosure = false;
        if (!matchToken(85)) {
            if (this.compilerEnv.getLanguageVersion() < 180) {
                reportError("msg.no.brace.body");
            } else {
                isExpressionClosure = true;
            }
        }
        this.nestingOfFunction++;
        int pos = this.ts.tokenBeg;
        Block pn = new Block(pos);
        boolean inDirectivePrologue = true;
        boolean savedStrictMode = this.inUseStrictDirective;
        pn.setLineno(this.ts.lineno);
        try {
            if (isExpressionClosure) {
                ReturnStatement n2 = new ReturnStatement(this.ts.lineno);
                n2.setReturnValue(assignExpr());
                n2.putProp(25, Boolean.TRUE);
                pn.putProp(25, Boolean.TRUE);
                pn.addStatement(n2);
            } else {
                while (true) {
                    int tt = peekToken();
                    switch (tt) {
                        case -1:
                        case 0:
                        case 86:
                            break;
                        case 109:
                            consumeToken();
                            n = function(1);
                            continue;
                            pn.addStatement(n);
                        default:
                            n = statement();
                            if (inDirectivePrologue) {
                                String directive = getDirective(n);
                                if (directive == null) {
                                    inDirectivePrologue = false;
                                } else if (directive.equals("use strict")) {
                                    this.inUseStrictDirective = true;
                                    continue;
                                }
                            }
                            pn.addStatement(n);
                    }
                }
            }
            this.nestingOfFunction--;
            this.inUseStrictDirective = savedStrictMode;
        } catch (ParserException e) {
            this.nestingOfFunction--;
            this.inUseStrictDirective = savedStrictMode;
        } catch (Throwable th) {
            this.nestingOfFunction--;
            this.inUseStrictDirective = savedStrictMode;
            throw th;
        }
        int end = this.ts.tokenEnd;
        getAndResetJsDoc();
        if (!isExpressionClosure && mustMatchToken(86, "msg.no.brace.after.body")) {
            end = this.ts.tokenEnd;
        }
        pn.setLength(end - pos);
        return pn;
    }

    private String getDirective(AstNode n) {
        if (n instanceof ExpressionStatement) {
            AstNode e = ((ExpressionStatement) n).getExpression();
            if (e instanceof StringLiteral) {
                return ((StringLiteral) e).getValue();
            }
            return null;
        }
        return null;
    }

    private void parseFunctionParams(FunctionNode fnNode) throws IOException {
        if (matchToken(88)) {
            fnNode.setRp(this.ts.tokenBeg - fnNode.getPosition());
            return;
        }
        Map<String, Node> destructuring = null;
        Set<String> paramNames = new HashSet<>();
        do {
            int tt = peekToken();
            if (tt == 83 || tt == 85) {
                AstNode expr = destructuringPrimaryExpr();
                markDestructuring(expr);
                fnNode.addParam(expr);
                if (destructuring == null) {
                    destructuring = new HashMap<>();
                }
                String pname = this.currentScriptOrFn.getNextTempName();
                defineSymbol(87, pname, false);
                destructuring.put(pname, expr);
            } else if (mustMatchToken(39, "msg.no.parm")) {
                fnNode.addParam(createNameNode());
                String paramName = this.ts.getString();
                defineSymbol(87, paramName);
                if (this.inUseStrictDirective) {
                    if ("eval".equals(paramName) || "arguments".equals(paramName)) {
                        reportError("msg.bad.id.strict", paramName);
                    }
                    if (paramNames.contains(paramName)) {
                        addError("msg.dup.param.strict", paramName);
                    }
                    paramNames.add(paramName);
                }
            } else {
                fnNode.addParam(makeErrorNode());
            }
        } while (matchToken(89));
        if (destructuring != null) {
            Node destructuringNode = new Node(89);
            for (Map.Entry<String, Node> param : destructuring.entrySet()) {
                Node assign = createDestructuringAssignment(122, param.getValue(), createName(param.getKey()));
                destructuringNode.addChildToBack(assign);
            }
            fnNode.putProp(23, destructuringNode);
        }
        if (mustMatchToken(88, "msg.no.paren.after.parms")) {
            fnNode.setRp(this.ts.tokenBeg - fnNode.getPosition());
        }
    }

    private FunctionNode function(int type) throws IOException {
        int syntheticType = type;
        int baseLineno = this.ts.lineno;
        int functionSourceStart = this.ts.tokenBeg;
        Name name = null;
        AstNode memberExprNode = null;
        if (matchToken(39)) {
            name = createNameNode(true, 39);
            if (this.inUseStrictDirective) {
                String id = name.getIdentifier();
                if ("eval".equals(id) || "arguments".equals(id)) {
                    reportError("msg.bad.id.strict", id);
                }
            }
            if (!matchToken(87)) {
                if (this.compilerEnv.isAllowMemberExprAsFunctionName()) {
                    name = null;
                    memberExprNode = memberExprTail(false, name);
                }
                mustMatchToken(87, "msg.no.paren.parms");
            }
        } else if (!matchToken(87)) {
            if (this.compilerEnv.isAllowMemberExprAsFunctionName()) {
                memberExprNode = memberExpr(false);
            }
            mustMatchToken(87, "msg.no.paren.parms");
        }
        int lpPos = this.currentToken == 87 ? this.ts.tokenBeg : -1;
        if (memberExprNode != null) {
            syntheticType = 2;
        }
        if (syntheticType != 2 && name != null && name.length() > 0) {
            defineSymbol(109, name.getIdentifier());
        }
        FunctionNode fnNode = new FunctionNode(functionSourceStart, name);
        fnNode.setFunctionType(type);
        if (lpPos != -1) {
            fnNode.setLp(lpPos - functionSourceStart);
        }
        fnNode.setJsDocNode(getAndResetJsDoc());
        PerFunctionVariables savedVars = new PerFunctionVariables(fnNode);
        try {
            parseFunctionParams(fnNode);
            fnNode.setBody(parseFunctionBody());
            fnNode.setEncodedSourceBounds(functionSourceStart, this.ts.tokenEnd);
            fnNode.setLength(this.ts.tokenEnd - functionSourceStart);
            if (this.compilerEnv.isStrictMode() && !fnNode.getBody().hasConsistentReturnUsage()) {
                String msg = (name == null || name.length() <= 0) ? "msg.anon.no.return.value" : "msg.no.return.value";
                addStrictWarning(msg, name == null ? "" : name.getIdentifier());
            }
            if (memberExprNode != null) {
                Kit.codeBug();
                fnNode.setMemberExprNode(memberExprNode);
            }
            fnNode.setSourceName(this.sourceURI);
            fnNode.setBaseLineno(baseLineno);
            fnNode.setEndLineno(this.ts.lineno);
            if (this.compilerEnv.isIdeMode()) {
                fnNode.setParentScope(this.currentScope);
            }
            return fnNode;
        } finally {
            savedVars.restore();
        }
    }

    private AstNode statements(AstNode parent) throws IOException {
        if (this.currentToken != 85 && !this.compilerEnv.isIdeMode()) {
            codeBug();
        }
        int pos = this.ts.tokenBeg;
        AstNode block = parent != null ? parent : new Block(pos);
        block.setLineno(this.ts.lineno);
        while (true) {
            int tt = peekToken();
            if (tt <= 0 || tt == 86) {
                break;
            }
            block.addChild(statement());
        }
        block.setLength(this.ts.tokenBeg - pos);
        return block;
    }

    private AstNode statements() throws IOException {
        return statements(null);
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Parser$ConditionData.class */
    private static class ConditionData {
        AstNode condition;
        int lp;
        int rp;

        private ConditionData() {
            this.lp = -1;
            this.rp = -1;
        }
    }

    private ConditionData condition() throws IOException {
        ConditionData data = new ConditionData();
        if (mustMatchToken(87, "msg.no.paren.cond")) {
            data.lp = this.ts.tokenBeg;
        }
        data.condition = expr();
        if (mustMatchToken(88, "msg.no.paren.after.cond")) {
            data.rp = this.ts.tokenBeg;
        }
        if (data.condition instanceof Assignment) {
            addStrictWarning("msg.equal.as.assign", "", data.condition.getPosition(), data.condition.getLength());
        }
        return data;
    }

    private AstNode statement() throws IOException {
        int pos = this.ts.tokenBeg;
        try {
            AstNode pn = statementHelper();
            if (pn != null) {
                if (this.compilerEnv.isStrictMode() && !pn.hasSideEffects()) {
                    int beg = pn.getPosition();
                    int beg2 = Math.max(beg, lineBeginningFor(beg));
                    addStrictWarning(pn instanceof EmptyStatement ? "msg.extra.trailing.semi" : "msg.no.side.effects", "", beg2, nodeEnd(pn) - beg2);
                }
                return pn;
            }
        } catch (ParserException e) {
        }
        while (true) {
            int tt = peekTokenOrEOL();
            consumeToken();
            switch (tt) {
                case -1:
                case 0:
                case 1:
                case 82:
                    return new EmptyStatement(pos, this.ts.tokenBeg - pos);
            }
        }
    }

    private AstNode statementHelper() throws IOException {
        AstNode pn;
        if (this.currentLabel != null && this.currentLabel.getStatement() != null) {
            this.currentLabel = null;
        }
        int tt = peekToken();
        int i = this.ts.tokenBeg;
        switch (tt) {
            case -1:
                consumeToken();
                return makeErrorNode();
            case 4:
            case 72:
                pn = returnOrYield(tt, false);
                break;
            case 39:
                pn = nameOrLabel();
                if (!(pn instanceof ExpressionStatement)) {
                    return pn;
                }
                break;
            case 50:
                pn = throwStatement();
                break;
            case 81:
                return tryStatement();
            case 82:
                consumeToken();
                int pos = this.ts.tokenBeg;
                AstNode pn2 = new EmptyStatement(pos, this.ts.tokenEnd - pos);
                pn2.setLineno(this.ts.lineno);
                return pn2;
            case 85:
                return block();
            case 109:
                consumeToken();
                return function(3);
            case 112:
                return ifStatement();
            case 114:
                return switchStatement();
            case 116:
                pn = defaultXmlNamespace();
                break;
            case 117:
                return whileLoop();
            case 118:
                return doLoop();
            case 119:
                return forLoop();
            case 120:
                pn = breakStatement();
                break;
            case 121:
                pn = continueStatement();
                break;
            case 122:
            case 154:
                consumeToken();
                int lineno = this.ts.lineno;
                pn = variables(this.currentToken, this.ts.tokenBeg, true);
                pn.setLineno(lineno);
                break;
            case 123:
                if (this.inUseStrictDirective) {
                    reportError("msg.no.with.strict");
                }
                return withStatement();
            case 153:
                pn = letStatement();
                if (!(pn instanceof VariableDeclaration) || peekToken() != 82) {
                    return pn;
                }
                break;
            case 160:
                consumeToken();
                pn = new KeywordLiteral(this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg, tt);
                pn.setLineno(this.ts.lineno);
                break;
            default:
                int lineno2 = this.ts.lineno;
                pn = new ExpressionStatement(expr(), !insideFunction());
                pn.setLineno(lineno2);
                break;
        }
        autoInsertSemicolon(pn);
        return pn;
    }

    private void autoInsertSemicolon(AstNode pn) throws IOException {
        int ttFlagged = peekFlaggedToken();
        int pos = pn.getPosition();
        switch (ttFlagged & CLEAR_TI_MASK) {
            case -1:
            case 0:
            case 86:
                warnMissingSemi(pos, nodeEnd(pn));
                break;
            case 82:
                consumeToken();
                pn.setLength(this.ts.tokenEnd - pos);
                break;
            default:
                if ((ttFlagged & 65536) == 0) {
                    reportError("msg.no.semi.stmt");
                    break;
                } else {
                    warnMissingSemi(pos, nodeEnd(pn));
                    break;
                }
        }
    }

    private IfStatement ifStatement() throws IOException {
        if (this.currentToken != 112) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        int elsePos = -1;
        ConditionData data = condition();
        AstNode ifTrue = statement();
        AstNode ifFalse = null;
        if (matchToken(113)) {
            elsePos = this.ts.tokenBeg - pos;
            ifFalse = statement();
        }
        int end = getNodeEnd(ifFalse != null ? ifFalse : ifTrue);
        IfStatement pn = new IfStatement(pos, end - pos);
        pn.setCondition(data.condition);
        pn.setParens(data.lp - pos, data.rp - pos);
        pn.setThenPart(ifTrue);
        pn.setElsePart(ifFalse);
        pn.setElsePosition(elsePos);
        pn.setLineno(lineno);
        return pn;
    }

    private SwitchStatement switchStatement() throws IOException {
        AstNode caseExpression;
        SwitchCase caseNode;
        int tt;
        if (this.currentToken != 114) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        SwitchStatement pn = new SwitchStatement(pos);
        if (mustMatchToken(87, "msg.no.paren.switch")) {
            pn.setLp(this.ts.tokenBeg - pos);
        }
        pn.setLineno(this.ts.lineno);
        AstNode discriminant = expr();
        pn.setExpression(discriminant);
        enterSwitch(pn);
        try {
            if (mustMatchToken(88, "msg.no.paren.after.switch")) {
                pn.setRp(this.ts.tokenBeg - pos);
            }
            mustMatchToken(85, "msg.no.brace.switch");
            boolean hasDefault = false;
            while (true) {
                int tt2 = nextToken();
                int casePos = this.ts.tokenBeg;
                int caseLineno = this.ts.lineno;
                switch (tt2) {
                    case 86:
                        pn.setLength(this.ts.tokenEnd - pos);
                        break;
                    case 115:
                        caseExpression = expr();
                        mustMatchToken(103, "msg.no.colon.case");
                        caseNode = new SwitchCase(casePos);
                        caseNode.setExpression(caseExpression);
                        caseNode.setLength(this.ts.tokenEnd - pos);
                        caseNode.setLineno(caseLineno);
                        while (true) {
                            tt = peekToken();
                            if (tt != 86 || tt == 115 || tt == 116 || tt == 0) {
                                break;
                            }
                            caseNode.addStatement(statement());
                        }
                        pn.addCase(caseNode);
                        break;
                    case 116:
                        if (hasDefault) {
                            reportError("msg.double.switch.default");
                        }
                        hasDefault = true;
                        caseExpression = null;
                        mustMatchToken(103, "msg.no.colon.case");
                        caseNode = new SwitchCase(casePos);
                        caseNode.setExpression(caseExpression);
                        caseNode.setLength(this.ts.tokenEnd - pos);
                        caseNode.setLineno(caseLineno);
                        while (true) {
                            tt = peekToken();
                            if (tt != 86) {
                                break;
                            }
                            caseNode.addStatement(statement());
                        }
                        pn.addCase(caseNode);
                    default:
                        reportError("msg.bad.switch");
                        break;
                }
            }
            return pn;
        } finally {
            exitSwitch();
        }
    }

    private WhileLoop whileLoop() throws IOException {
        if (this.currentToken != 117) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        WhileLoop pn = new WhileLoop(pos);
        pn.setLineno(this.ts.lineno);
        enterLoop(pn);
        try {
            ConditionData data = condition();
            pn.setCondition(data.condition);
            pn.setParens(data.lp - pos, data.rp - pos);
            AstNode body = statement();
            pn.setLength(getNodeEnd(body) - pos);
            pn.setBody(body);
            exitLoop();
            return pn;
        } catch (Throwable th) {
            exitLoop();
            throw th;
        }
    }

    private DoLoop doLoop() throws IOException {
        if (this.currentToken != 118) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        DoLoop pn = new DoLoop(pos);
        pn.setLineno(this.ts.lineno);
        enterLoop(pn);
        try {
            AstNode body = statement();
            mustMatchToken(117, "msg.no.while.do");
            pn.setWhilePosition(this.ts.tokenBeg - pos);
            ConditionData data = condition();
            pn.setCondition(data.condition);
            pn.setParens(data.lp - pos, data.rp - pos);
            int end = getNodeEnd(body);
            pn.setBody(body);
            exitLoop();
            if (matchToken(82)) {
                end = this.ts.tokenEnd;
            }
            pn.setLength(end - pos);
            return pn;
        } catch (Throwable th) {
            exitLoop();
            throw th;
        }
    }

    private Loop forLoop() throws IOException {
        AstNode cond;
        Loop pn;
        if (this.currentToken != 119) {
            codeBug();
        }
        consumeToken();
        int forPos = this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        boolean isForEach = false;
        boolean isForIn = false;
        int eachPos = -1;
        int inPos = -1;
        int lp = -1;
        int rp = -1;
        AstNode incr = null;
        Scope tempScope = new Scope();
        pushScope(tempScope);
        try {
            if (matchToken(39)) {
                if ("each".equals(this.ts.getString())) {
                    isForEach = true;
                    eachPos = this.ts.tokenBeg - forPos;
                } else {
                    reportError("msg.no.paren.for");
                }
            }
            if (mustMatchToken(87, "msg.no.paren.for")) {
                lp = this.ts.tokenBeg - forPos;
            }
            int tt = peekToken();
            AstNode init = forLoopInit(tt);
            if (matchToken(52)) {
                isForIn = true;
                inPos = this.ts.tokenBeg - forPos;
                cond = expr();
            } else {
                mustMatchToken(82, "msg.no.semi.for");
                if (peekToken() == 82) {
                    cond = new EmptyExpression(this.ts.tokenBeg, 1);
                    cond.setLineno(this.ts.lineno);
                } else {
                    cond = expr();
                }
                mustMatchToken(82, "msg.no.semi.for.cond");
                int tmpPos = this.ts.tokenEnd;
                if (peekToken() == 88) {
                    incr = new EmptyExpression(tmpPos, 1);
                    incr.setLineno(this.ts.lineno);
                } else {
                    incr = expr();
                }
            }
            if (mustMatchToken(88, "msg.no.paren.for.ctrl")) {
                rp = this.ts.tokenBeg - forPos;
            }
            if (isForIn) {
                ForInLoop fis = new ForInLoop(forPos);
                if ((init instanceof VariableDeclaration) && ((VariableDeclaration) init).getVariables().size() > 1) {
                    reportError("msg.mult.index");
                }
                fis.setIterator(init);
                fis.setIteratedObject(cond);
                fis.setInPosition(inPos);
                fis.setIsForEach(isForEach);
                fis.setEachPosition(eachPos);
                pn = fis;
            } else {
                ForLoop fl = new ForLoop(forPos);
                fl.setInitializer(init);
                fl.setCondition(cond);
                fl.setIncrement(incr);
                pn = fl;
            }
            this.currentScope.replaceWith(pn);
            popScope();
            enterLoop(pn);
            try {
                AstNode body = statement();
                pn.setLength(getNodeEnd(body) - forPos);
                pn.setBody(body);
                exitLoop();
                pn.setParens(lp, rp);
                pn.setLineno(lineno);
                return pn;
            } catch (Throwable th) {
                exitLoop();
                throw th;
            }
        } finally {
            if (this.currentScope == tempScope) {
                popScope();
            }
        }
    }

    private AstNode forLoopInit(int tt) throws IOException {
        AstNode init;
        try {
            this.inForInit = true;
            if (tt == 82) {
                init = new EmptyExpression(this.ts.tokenBeg, 1);
                init.setLineno(this.ts.lineno);
            } else if (tt == 122 || tt == 153) {
                consumeToken();
                init = variables(tt, this.ts.tokenBeg, false);
            } else {
                init = expr();
                markDestructuring(init);
            }
            return init;
        } finally {
            this.inForInit = false;
        }
    }

    private TryStatement tryStatement() throws IOException {
        if (this.currentToken != 81) {
            codeBug();
        }
        consumeToken();
        Comment jsdocNode = getAndResetJsDoc();
        int tryPos = this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        int finallyPos = -1;
        if (peekToken() != 85) {
            reportError("msg.no.brace.try");
        }
        AstNode tryBlock = statement();
        int tryEnd = getNodeEnd(tryBlock);
        List<CatchClause> clauses = null;
        boolean sawDefaultCatch = false;
        int peek = peekToken();
        if (peek == 124) {
            while (matchToken(124)) {
                int catchLineNum = this.ts.lineno;
                if (sawDefaultCatch) {
                    reportError("msg.catch.unreachable");
                }
                int catchPos = this.ts.tokenBeg;
                int lp = -1;
                int rp = -1;
                int guardPos = -1;
                if (mustMatchToken(87, "msg.no.paren.catch")) {
                    lp = this.ts.tokenBeg;
                }
                mustMatchToken(39, "msg.bad.catchcond");
                Name varName = createNameNode();
                String varNameString = varName.getIdentifier();
                if (this.inUseStrictDirective && ("eval".equals(varNameString) || "arguments".equals(varNameString))) {
                    reportError("msg.bad.id.strict", varNameString);
                }
                AstNode catchCond = null;
                if (matchToken(112)) {
                    guardPos = this.ts.tokenBeg;
                    catchCond = expr();
                } else {
                    sawDefaultCatch = true;
                }
                if (mustMatchToken(88, "msg.bad.catchcond")) {
                    rp = this.ts.tokenBeg;
                }
                mustMatchToken(85, "msg.no.brace.catchblock");
                Block catchBlock = (Block) statements();
                tryEnd = getNodeEnd(catchBlock);
                CatchClause catchNode = new CatchClause(catchPos);
                catchNode.setVarName(varName);
                catchNode.setCatchCondition(catchCond);
                catchNode.setBody(catchBlock);
                if (guardPos != -1) {
                    catchNode.setIfPosition(guardPos - catchPos);
                }
                catchNode.setParens(lp, rp);
                catchNode.setLineno(catchLineNum);
                if (mustMatchToken(86, "msg.no.brace.after.body")) {
                    tryEnd = this.ts.tokenEnd;
                }
                catchNode.setLength(tryEnd - catchPos);
                if (clauses == null) {
                    clauses = new ArrayList<>();
                }
                clauses.add(catchNode);
            }
        } else if (peek != 125) {
            mustMatchToken(125, "msg.try.no.catchfinally");
        }
        AstNode finallyBlock = null;
        if (matchToken(125)) {
            finallyPos = this.ts.tokenBeg;
            finallyBlock = statement();
            tryEnd = getNodeEnd(finallyBlock);
        }
        TryStatement pn = new TryStatement(tryPos, tryEnd - tryPos);
        pn.setTryBlock(tryBlock);
        pn.setCatchClauses(clauses);
        pn.setFinallyBlock(finallyBlock);
        if (finallyPos != -1) {
            pn.setFinallyPosition(finallyPos - tryPos);
        }
        pn.setLineno(lineno);
        if (jsdocNode != null) {
            pn.setJsDocNode(jsdocNode);
        }
        return pn;
    }

    private ThrowStatement throwStatement() throws IOException {
        if (this.currentToken != 50) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        if (peekTokenOrEOL() == 1) {
            reportError("msg.bad.throw.eol");
        }
        AstNode expr = expr();
        ThrowStatement pn = new ThrowStatement(pos, getNodeEnd(expr), expr);
        pn.setLineno(lineno);
        return pn;
    }

    private LabeledStatement matchJumpLabelName() throws IOException {
        LabeledStatement label = null;
        if (peekTokenOrEOL() == 39) {
            consumeToken();
            if (this.labelSet != null) {
                label = this.labelSet.get(this.ts.getString());
            }
            if (label == null) {
                reportError("msg.undef.label");
            }
        }
        return label;
    }

    private BreakStatement breakStatement() throws IOException {
        if (this.currentToken != 120) {
            codeBug();
        }
        consumeToken();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        int end = this.ts.tokenEnd;
        Name breakLabel = null;
        if (peekTokenOrEOL() == 39) {
            breakLabel = createNameNode();
            end = getNodeEnd(breakLabel);
        }
        LabeledStatement labels = matchJumpLabelName();
        Jump breakTarget = labels == null ? null : labels.getFirstLabel();
        if (breakTarget == null && breakLabel == null) {
            if (this.loopAndSwitchSet == null || this.loopAndSwitchSet.size() == 0) {
                if (breakLabel == null) {
                    reportError("msg.bad.break", pos, end - pos);
                }
            } else {
                breakTarget = this.loopAndSwitchSet.get(this.loopAndSwitchSet.size() - 1);
            }
        }
        BreakStatement pn = new BreakStatement(pos, end - pos);
        pn.setBreakLabel(breakLabel);
        if (breakTarget != null) {
            pn.setBreakTarget(breakTarget);
        }
        pn.setLineno(lineno);
        return pn;
    }

    private ContinueStatement continueStatement() throws IOException {
        if (this.currentToken != 121) {
            codeBug();
        }
        consumeToken();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        int end = this.ts.tokenEnd;
        Name label = null;
        if (peekTokenOrEOL() == 39) {
            label = createNameNode();
            end = getNodeEnd(label);
        }
        LabeledStatement labels = matchJumpLabelName();
        Loop target = null;
        if (labels == null && label == null) {
            if (this.loopSet == null || this.loopSet.size() == 0) {
                reportError("msg.continue.outside");
            } else {
                target = this.loopSet.get(this.loopSet.size() - 1);
            }
        } else {
            if (labels == null || !(labels.getStatement() instanceof Loop)) {
                reportError("msg.continue.nonloop", pos, end - pos);
            }
            target = labels == null ? null : (Loop) labels.getStatement();
        }
        ContinueStatement pn = new ContinueStatement(pos, end - pos);
        if (target != null) {
            pn.setTarget(target);
        }
        pn.setLabel(label);
        pn.setLineno(lineno);
        return pn;
    }

    private WithStatement withStatement() throws IOException {
        if (this.currentToken != 123) {
            codeBug();
        }
        consumeToken();
        Comment withComment = getAndResetJsDoc();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        int lp = -1;
        int rp = -1;
        if (mustMatchToken(87, "msg.no.paren.with")) {
            lp = this.ts.tokenBeg;
        }
        AstNode obj = expr();
        if (mustMatchToken(88, "msg.no.paren.after.with")) {
            rp = this.ts.tokenBeg;
        }
        AstNode body = statement();
        WithStatement pn = new WithStatement(pos, getNodeEnd(body) - pos);
        pn.setJsDocNode(withComment);
        pn.setExpression(obj);
        pn.setStatement(body);
        pn.setParens(lp, rp);
        pn.setLineno(lineno);
        return pn;
    }

    private AstNode letStatement() throws IOException {
        AstNode pn;
        if (this.currentToken != 153) {
            codeBug();
        }
        consumeToken();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        if (peekToken() == 87) {
            pn = let(true, pos);
        } else {
            pn = variables(153, pos, true);
        }
        pn.setLineno(lineno);
        return pn;
    }

    private static final boolean nowAllSet(int before, int after, int mask) {
        return (before & mask) != mask && (after & mask) == mask;
    }

    private AstNode returnOrYield(int tt, boolean exprContext) throws IOException {
        AstNode ret;
        if (!insideFunction()) {
            reportError(tt == 4 ? "msg.bad.return" : "msg.bad.yield");
        }
        consumeToken();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        int end = this.ts.tokenEnd;
        AstNode e = null;
        switch (peekTokenOrEOL()) {
            case -1:
            case 0:
            case 1:
            case 72:
            case 82:
            case 84:
            case 86:
            case 88:
                break;
            default:
                e = expr();
                end = getNodeEnd(e);
                break;
        }
        int before = this.endFlags;
        if (tt == 4) {
            this.endFlags |= e == null ? 2 : 4;
            ret = new ReturnStatement(pos, end - pos, e);
            if (nowAllSet(before, this.endFlags, 6)) {
                addStrictWarning("msg.return.inconsistent", "", pos, end - pos);
            }
        } else {
            if (!insideFunction()) {
                reportError("msg.bad.yield");
            }
            this.endFlags |= 8;
            ret = new Yield(pos, end - pos, e);
            setRequiresActivation();
            setIsGenerator();
            if (!exprContext) {
                ret = new ExpressionStatement(ret);
            }
        }
        if (insideFunction() && nowAllSet(before, this.endFlags, 12)) {
            Name name = ((FunctionNode) this.currentScriptOrFn).getFunctionName();
            if (name == null || name.length() == 0) {
                addError("msg.anon.generator.returns", "");
            } else {
                addError("msg.generator.returns", name.getIdentifier());
            }
        }
        ret.setLineno(lineno);
        return ret;
    }

    private AstNode block() throws IOException {
        if (this.currentToken != 85) {
            codeBug();
        }
        consumeToken();
        int pos = this.ts.tokenBeg;
        Scope block = new Scope(pos);
        block.setLineno(this.ts.lineno);
        pushScope(block);
        try {
            statements(block);
            mustMatchToken(86, "msg.no.brace.block");
            block.setLength(this.ts.tokenEnd - pos);
            popScope();
            return block;
        } catch (Throwable th) {
            popScope();
            throw th;
        }
    }

    private AstNode defaultXmlNamespace() throws IOException {
        if (this.currentToken != 116) {
            codeBug();
        }
        consumeToken();
        mustHaveXML();
        setRequiresActivation();
        int lineno = this.ts.lineno;
        int pos = this.ts.tokenBeg;
        if (!matchToken(39) || !"xml".equals(this.ts.getString())) {
            reportError("msg.bad.namespace");
        }
        if (!matchToken(39) || !"namespace".equals(this.ts.getString())) {
            reportError("msg.bad.namespace");
        }
        if (!matchToken(90)) {
            reportError("msg.bad.namespace");
        }
        AstNode e = expr();
        UnaryExpression dxmln = new UnaryExpression(pos, getNodeEnd(e) - pos);
        dxmln.setOperator(74);
        dxmln.setOperand(e);
        dxmln.setLineno(lineno);
        ExpressionStatement es = new ExpressionStatement((AstNode) dxmln, true);
        return es;
    }

    private void recordLabel(Label label, LabeledStatement bundle) throws IOException {
        if (peekToken() != 103) {
            codeBug();
        }
        consumeToken();
        String name = label.getName();
        if (this.labelSet == null) {
            this.labelSet = new HashMap();
        } else {
            LabeledStatement ls = this.labelSet.get(name);
            if (ls != null) {
                if (this.compilerEnv.isIdeMode()) {
                    Label dup = ls.getLabelByName(name);
                    reportError("msg.dup.label", dup.getAbsolutePosition(), dup.getLength());
                }
                reportError("msg.dup.label", label.getPosition(), label.getLength());
            }
        }
        bundle.addLabel(label);
        this.labelSet.put(name, bundle);
    }

    private AstNode nameOrLabel() throws IOException {
        if (this.currentToken != 39) {
            throw codeBug();
        }
        int pos = this.ts.tokenBeg;
        this.currentFlaggedToken |= TI_CHECK_LABEL;
        AstNode expr = expr();
        if (expr.getType() != 130) {
            AstNode n = new ExpressionStatement(expr, !insideFunction());
            n.lineno = expr.lineno;
            return n;
        }
        LabeledStatement bundle = new LabeledStatement(pos);
        recordLabel((Label) expr, bundle);
        bundle.setLineno(this.ts.lineno);
        AstNode stmt = null;
        while (true) {
            if (peekToken() == 39) {
                this.currentFlaggedToken |= TI_CHECK_LABEL;
                AstNode expr2 = expr();
                if (expr2.getType() != 130) {
                    stmt = new ExpressionStatement(expr2, !insideFunction());
                    autoInsertSemicolon(stmt);
                } else {
                    recordLabel((Label) expr2, bundle);
                }
            }
        }
        try {
            this.currentLabel = bundle;
            if (stmt == null) {
                stmt = statementHelper();
            }
            bundle.setLength(stmt.getParent() == null ? getNodeEnd(stmt) - pos : getNodeEnd(stmt));
            bundle.setStatement(stmt);
            return bundle;
        } finally {
            this.currentLabel = null;
            for (Label lb : bundle.getLabels()) {
                this.labelSet.remove(lb.getName());
            }
        }
    }

    private VariableDeclaration variables(int declType, int pos, boolean isStatement) throws IOException {
        int end;
        VariableDeclaration pn = new VariableDeclaration(pos);
        pn.setType(declType);
        pn.setLineno(this.ts.lineno);
        Comment varjsdocNode = getAndResetJsDoc();
        if (varjsdocNode != null) {
            pn.setJsDocNode(varjsdocNode);
        }
        do {
            AstNode destructuring = null;
            Name name = null;
            int tt = peekToken();
            int kidPos = this.ts.tokenBeg;
            end = this.ts.tokenEnd;
            if (tt == 83 || tt == 85) {
                destructuring = destructuringPrimaryExpr();
                end = getNodeEnd(destructuring);
                if (!(destructuring instanceof DestructuringForm)) {
                    reportError("msg.bad.assign.left", kidPos, end - kidPos);
                }
                markDestructuring(destructuring);
            } else {
                mustMatchToken(39, "msg.bad.var");
                name = createNameNode();
                name.setLineno(this.ts.getLineno());
                if (this.inUseStrictDirective) {
                    String id = this.ts.getString();
                    if ("eval".equals(id) || "arguments".equals(this.ts.getString())) {
                        reportError("msg.bad.id.strict", id);
                    }
                }
                defineSymbol(declType, this.ts.getString(), this.inForInit);
            }
            int lineno = this.ts.lineno;
            Comment jsdocNode = getAndResetJsDoc();
            AstNode init = null;
            if (matchToken(90)) {
                init = assignExpr();
                end = getNodeEnd(init);
            }
            VariableInitializer vi = new VariableInitializer(kidPos, end - kidPos);
            if (destructuring != null) {
                if (init == null && !this.inForInit) {
                    reportError("msg.destruct.assign.no.init");
                }
                vi.setTarget(destructuring);
            } else {
                vi.setTarget(name);
            }
            vi.setInitializer(init);
            vi.setType(declType);
            vi.setJsDocNode(jsdocNode);
            vi.setLineno(lineno);
            pn.addVariable(vi);
        } while (matchToken(89));
        pn.setLength(end - pos);
        pn.setIsStatement(isStatement);
        return pn;
    }

    private AstNode let(boolean isStatement, int pos) throws IOException {
        LetNode pn = new LetNode(pos);
        pn.setLineno(this.ts.lineno);
        if (mustMatchToken(87, "msg.no.paren.after.let")) {
            pn.setLp(this.ts.tokenBeg - pos);
        }
        pushScope(pn);
        try {
            VariableDeclaration vars = variables(153, this.ts.tokenBeg, isStatement);
            pn.setVariables(vars);
            if (mustMatchToken(88, "msg.no.paren.let")) {
                pn.setRp(this.ts.tokenBeg - pos);
            }
            if (isStatement && peekToken() == 85) {
                consumeToken();
                int beg = this.ts.tokenBeg;
                AstNode stmt = statements();
                mustMatchToken(86, "msg.no.curly.let");
                stmt.setLength(this.ts.tokenEnd - beg);
                pn.setLength(this.ts.tokenEnd - pos);
                pn.setBody(stmt);
                pn.setType(153);
            } else {
                AstNode expr = expr();
                pn.setLength(getNodeEnd(expr) - pos);
                pn.setBody(expr);
                if (isStatement) {
                    ExpressionStatement es = new ExpressionStatement(pn, !insideFunction());
                    es.setLineno(pn.getLineno());
                    popScope();
                    return es;
                }
            }
            popScope();
            return pn;
        } catch (Throwable th) {
            popScope();
            throw th;
        }
    }

    void defineSymbol(int declType, String name) {
        defineSymbol(declType, name, false);
    }

    void defineSymbol(int declType, String name, boolean ignoreNotInBlock) {
        if (name == null) {
            if (this.compilerEnv.isIdeMode()) {
                return;
            } else {
                codeBug();
            }
        }
        Scope definingScope = this.currentScope.getDefiningScope(name);
        Symbol symbol = definingScope != null ? definingScope.getSymbol(name) : null;
        int symDeclType = symbol != null ? symbol.getDeclType() : -1;
        if (symbol != null && (symDeclType == 154 || declType == 154 || (definingScope == this.currentScope && symDeclType == 153))) {
            addError(symDeclType == 154 ? "msg.const.redecl" : symDeclType == 153 ? "msg.let.redecl" : symDeclType == 122 ? "msg.var.redecl" : symDeclType == 109 ? "msg.fn.redecl" : "msg.parm.redecl", name);
            return;
        }
        switch (declType) {
            case 87:
                if (symbol != null) {
                    addWarning("msg.dup.parms", name);
                }
                this.currentScriptOrFn.putSymbol(new Symbol(declType, name));
                return;
            case 109:
            case 122:
            case 154:
                if (symbol != null) {
                    if (symDeclType == 122) {
                        addStrictWarning("msg.var.redecl", name);
                        return;
                    } else {
                        if (symDeclType == 87) {
                            addStrictWarning("msg.var.hides.arg", name);
                            return;
                        }
                        return;
                    }
                }
                this.currentScriptOrFn.putSymbol(new Symbol(declType, name));
                return;
            case 153:
                if (!ignoreNotInBlock && (this.currentScope.getType() == 112 || (this.currentScope instanceof Loop))) {
                    addError("msg.let.decl.not.in.block");
                    return;
                } else {
                    this.currentScope.putSymbol(new Symbol(declType, name));
                    return;
                }
            default:
                throw codeBug();
        }
    }

    private AstNode expr() throws IOException {
        AstNode pn = assignExpr();
        int pos = pn.getPosition();
        while (matchToken(89)) {
            int opPos = this.ts.tokenBeg;
            if (this.compilerEnv.isStrictMode() && !pn.hasSideEffects()) {
                addStrictWarning("msg.no.side.effects", "", pos, nodeEnd(pn) - pos);
            }
            if (peekToken() == 72) {
                reportError("msg.yield.parenthesized");
            }
            pn = new InfixExpression(89, pn, assignExpr(), opPos);
        }
        return pn;
    }

    private AstNode assignExpr() throws IOException {
        int tt = peekToken();
        if (tt == 72) {
            return returnOrYield(tt, true);
        }
        AstNode pn = condExpr();
        int tt2 = peekToken();
        if (90 <= tt2 && tt2 <= 101) {
            consumeToken();
            Comment jsdocNode = getAndResetJsDoc();
            markDestructuring(pn);
            int opPos = this.ts.tokenBeg;
            pn = new Assignment(tt2, pn, assignExpr(), opPos);
            if (jsdocNode != null) {
                pn.setJsDocNode(jsdocNode);
            }
        } else if (tt2 == 82 && this.currentJsDocComment != null) {
            pn.setJsDocNode(getAndResetJsDoc());
        }
        return pn;
    }

    private AstNode condExpr() throws IOException {
        AstNode pn = orExpr();
        if (matchToken(102)) {
            int line = this.ts.lineno;
            int qmarkPos = this.ts.tokenBeg;
            int colonPos = -1;
            boolean wasInForInit = this.inForInit;
            this.inForInit = false;
            try {
                AstNode ifTrue = assignExpr();
                this.inForInit = wasInForInit;
                if (mustMatchToken(103, "msg.no.colon.cond")) {
                    colonPos = this.ts.tokenBeg;
                }
                AstNode ifFalse = assignExpr();
                int beg = pn.getPosition();
                int len = getNodeEnd(ifFalse) - beg;
                ConditionalExpression ce = new ConditionalExpression(beg, len);
                ce.setLineno(line);
                ce.setTestExpression(pn);
                ce.setTrueExpression(ifTrue);
                ce.setFalseExpression(ifFalse);
                ce.setQuestionMarkPosition(qmarkPos - beg);
                ce.setColonPosition(colonPos - beg);
                pn = ce;
            } catch (Throwable th) {
                this.inForInit = wasInForInit;
                throw th;
            }
        }
        return pn;
    }

    private AstNode orExpr() throws IOException {
        AstNode pn = andExpr();
        if (matchToken(104)) {
            int opPos = this.ts.tokenBeg;
            pn = new InfixExpression(104, pn, orExpr(), opPos);
        }
        return pn;
    }

    private AstNode andExpr() throws IOException {
        AstNode pn = bitOrExpr();
        if (matchToken(105)) {
            int opPos = this.ts.tokenBeg;
            pn = new InfixExpression(105, pn, andExpr(), opPos);
        }
        return pn;
    }

    private AstNode bitOrExpr() throws IOException {
        AstNode bitXorExpr = bitXorExpr();
        while (true) {
            AstNode pn = bitXorExpr;
            if (matchToken(9)) {
                int opPos = this.ts.tokenBeg;
                bitXorExpr = new InfixExpression(9, pn, bitXorExpr(), opPos);
            } else {
                return pn;
            }
        }
    }

    private AstNode bitXorExpr() throws IOException {
        AstNode bitAndExpr = bitAndExpr();
        while (true) {
            AstNode pn = bitAndExpr;
            if (matchToken(10)) {
                int opPos = this.ts.tokenBeg;
                bitAndExpr = new InfixExpression(10, pn, bitAndExpr(), opPos);
            } else {
                return pn;
            }
        }
    }

    private AstNode bitAndExpr() throws IOException {
        AstNode eqExpr = eqExpr();
        while (true) {
            AstNode pn = eqExpr;
            if (matchToken(11)) {
                int opPos = this.ts.tokenBeg;
                eqExpr = new InfixExpression(11, pn, eqExpr(), opPos);
            } else {
                return pn;
            }
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    private org.mozilla.javascript.ast.AstNode eqExpr() throws java.io.IOException {
        /*
            r7 = this;
            r0 = r7
            org.mozilla.javascript.ast.AstNode r0 = r0.relExpr()
            r8 = r0
        L5:
            r0 = r7
            int r0 = r0.peekToken()
            r9 = r0
            r0 = r7
            org.mozilla.javascript.TokenStream r0 = r0.ts
            int r0 = r0.tokenBeg
            r10 = r0
            r0 = r9
            switch(r0) {
                case 12: goto L3c;
                case 13: goto L3c;
                case 46: goto L3c;
                case 47: goto L3c;
                default: goto L79;
            }
        L3c:
            r0 = r7
            r0.consumeToken()
            r0 = r9
            r11 = r0
            r0 = r7
            org.mozilla.javascript.CompilerEnvirons r0 = r0.compilerEnv
            int r0 = r0.getLanguageVersion()
            r1 = 120(0x78, float:1.68E-43)
            if (r0 != r1) goto L66
            r0 = r9
            r1 = 12
            if (r0 != r1) goto L5c
            r0 = 46
            r11 = r0
            goto L66
        L5c:
            r0 = r9
            r1 = 13
            if (r0 != r1) goto L66
            r0 = 47
            r11 = r0
        L66:
            org.mozilla.javascript.ast.InfixExpression r0 = new org.mozilla.javascript.ast.InfixExpression
            r1 = r0
            r2 = r11
            r3 = r8
            r4 = r7
            org.mozilla.javascript.ast.AstNode r4 = r4.relExpr()
            r5 = r10
            r1.<init>(r2, r3, r4, r5)
            r8 = r0
            goto L5
        L79:
            goto L7c
        L7c:
            r0 = r8
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.Parser.eqExpr():org.mozilla.javascript.ast.AstNode");
    }

    private AstNode relExpr() throws IOException {
        AstNode pn;
        AstNode shiftExpr = shiftExpr();
        while (true) {
            pn = shiftExpr;
            int tt = peekToken();
            int opPos = this.ts.tokenBeg;
            switch (tt) {
                case 14:
                case 15:
                case 16:
                case 17:
                case 53:
                    break;
                case 52:
                    if (!this.inForInit) {
                        break;
                    } else {
                        break;
                    }
            }
            consumeToken();
            shiftExpr = new InfixExpression(tt, pn, shiftExpr(), opPos);
        }
        return pn;
    }

    private AstNode shiftExpr() throws IOException {
        AstNode addExpr = addExpr();
        while (true) {
            AstNode pn = addExpr;
            int tt = peekToken();
            int opPos = this.ts.tokenBeg;
            switch (tt) {
                case 18:
                case 19:
                case 20:
                    consumeToken();
                    addExpr = new InfixExpression(tt, pn, addExpr(), opPos);
                default:
                    return pn;
            }
        }
    }

    private AstNode addExpr() throws IOException {
        AstNode mulExpr = mulExpr();
        while (true) {
            AstNode pn = mulExpr;
            int tt = peekToken();
            int opPos = this.ts.tokenBeg;
            if (tt == 21 || tt == 22) {
                consumeToken();
                mulExpr = new InfixExpression(tt, pn, mulExpr(), opPos);
            } else {
                return pn;
            }
        }
    }

    private AstNode mulExpr() throws IOException {
        AstNode unaryExpr = unaryExpr();
        while (true) {
            AstNode pn = unaryExpr;
            int tt = peekToken();
            int opPos = this.ts.tokenBeg;
            switch (tt) {
                case 23:
                case 24:
                case 25:
                    consumeToken();
                    unaryExpr = new InfixExpression(tt, pn, unaryExpr(), opPos);
                default:
                    return pn;
            }
        }
    }

    private AstNode unaryExpr() throws IOException {
        int tt = peekToken();
        int line = this.ts.lineno;
        switch (tt) {
            case -1:
                consumeToken();
                return makeErrorNode();
            case 14:
                if (this.compilerEnv.isXmlAvailable()) {
                    consumeToken();
                    return memberExprTail(true, xmlInitializer());
                }
                break;
            case 21:
                consumeToken();
                AstNode node = new UnaryExpression(28, this.ts.tokenBeg, unaryExpr());
                node.setLineno(line);
                return node;
            case 22:
                consumeToken();
                AstNode node2 = new UnaryExpression(29, this.ts.tokenBeg, unaryExpr());
                node2.setLineno(line);
                return node2;
            case 26:
            case 27:
            case 32:
            case 126:
                consumeToken();
                AstNode node3 = new UnaryExpression(tt, this.ts.tokenBeg, unaryExpr());
                node3.setLineno(line);
                return node3;
            case 31:
                consumeToken();
                AstNode node4 = new UnaryExpression(tt, this.ts.tokenBeg, unaryExpr());
                node4.setLineno(line);
                return node4;
            case 106:
            case 107:
                consumeToken();
                UnaryExpression expr = new UnaryExpression(tt, this.ts.tokenBeg, memberExpr(true));
                expr.setLineno(line);
                checkBadIncDec(expr);
                return expr;
        }
        AstNode pn = memberExpr(true);
        int tt2 = peekTokenOrEOL();
        if (tt2 != 106 && tt2 != 107) {
            return pn;
        }
        consumeToken();
        UnaryExpression uexpr = new UnaryExpression(tt2, this.ts.tokenBeg, pn, true);
        uexpr.setLineno(line);
        checkBadIncDec(uexpr);
        return uexpr;
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.makeEndlessLoop(LoopRegionMaker.java:281)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:64)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.IfRegionMaker.process(IfRegionMaker.java:95)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:106)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    private org.mozilla.javascript.ast.AstNode xmlInitializer() throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 294
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.mozilla.javascript.Parser.xmlInitializer():org.mozilla.javascript.ast.AstNode");
    }

    private List<AstNode> argumentList() throws IOException {
        if (matchToken(88)) {
            return null;
        }
        List<AstNode> result = new ArrayList<>();
        boolean wasInForInit = this.inForInit;
        this.inForInit = false;
        do {
            try {
                if (peekToken() == 72) {
                    reportError("msg.yield.parenthesized");
                }
                AstNode en = assignExpr();
                if (peekToken() == 119) {
                    try {
                        result.add(generatorExpression(en, 0, true));
                    } catch (IOException e) {
                    }
                } else {
                    result.add(en);
                }
            } finally {
                this.inForInit = wasInForInit;
            }
        } while (matchToken(89));
        mustMatchToken(88, "msg.no.paren.arg");
        return result;
    }

    private AstNode memberExpr(boolean allowCallSyntax) throws IOException {
        AstNode pn;
        int tt = peekToken();
        int lineno = this.ts.lineno;
        if (tt != 30) {
            pn = primaryExpr();
        } else {
            consumeToken();
            int pos = this.ts.tokenBeg;
            NewExpression nx = new NewExpression(pos);
            AstNode target = memberExpr(false);
            int end = getNodeEnd(target);
            nx.setTarget(target);
            if (matchToken(87)) {
                int lp = this.ts.tokenBeg;
                List<AstNode> args = argumentList();
                if (args != null && args.size() > 65536) {
                    reportError("msg.too.many.constructor.args");
                }
                int rp = this.ts.tokenBeg;
                end = this.ts.tokenEnd;
                if (args != null) {
                    nx.setArguments(args);
                }
                nx.setParens(lp - pos, rp - pos);
            }
            if (matchToken(85)) {
                ObjectLiteral initializer = objectLiteral();
                end = getNodeEnd(initializer);
                nx.setInitializer(initializer);
            }
            nx.setLength(end - pos);
            pn = nx;
        }
        pn.setLineno(lineno);
        AstNode tail = memberExprTail(allowCallSyntax, pn);
        return tail;
    }

    private AstNode memberExprTail(boolean allowCallSyntax, AstNode pn) throws IOException {
        if (pn == null) {
            codeBug();
        }
        int pos = pn.getPosition();
        while (true) {
            int tt = peekToken();
            switch (tt) {
                case 83:
                    consumeToken();
                    int lb = this.ts.tokenBeg;
                    int rb = -1;
                    int lineno = this.ts.lineno;
                    AstNode expr = expr();
                    int end = getNodeEnd(expr);
                    if (mustMatchToken(84, "msg.no.bracket.index")) {
                        rb = this.ts.tokenBeg;
                        end = this.ts.tokenEnd;
                    }
                    ElementGet g = new ElementGet(pos, end - pos);
                    g.setTarget(pn);
                    g.setElement(expr);
                    g.setParens(lb, rb);
                    g.setLineno(lineno);
                    pn = g;
                    break;
                case 87:
                    if (!allowCallSyntax) {
                        break;
                    } else {
                        int lineno2 = this.ts.lineno;
                        consumeToken();
                        checkCallRequiresActivation(pn);
                        FunctionCall f = new FunctionCall(pos);
                        f.setTarget(pn);
                        f.setLineno(lineno2);
                        f.setLp(this.ts.tokenBeg - pos);
                        List<AstNode> args = argumentList();
                        if (args != null && args.size() > 65536) {
                            reportError("msg.too.many.function.args");
                        }
                        f.setArguments(args);
                        f.setRp(this.ts.tokenBeg - pos);
                        f.setLength(this.ts.tokenEnd - pos);
                        pn = f;
                        break;
                    }
                    break;
                case 108:
                case 143:
                    int lineno3 = this.ts.lineno;
                    pn = propertyAccess(tt, pn);
                    pn.setLineno(lineno3);
                    break;
                case 146:
                    consumeToken();
                    int opPos = this.ts.tokenBeg;
                    int rp = -1;
                    int lineno4 = this.ts.lineno;
                    mustHaveXML();
                    setRequiresActivation();
                    AstNode filter = expr();
                    int end2 = getNodeEnd(filter);
                    if (mustMatchToken(88, "msg.no.paren")) {
                        rp = this.ts.tokenBeg;
                        end2 = this.ts.tokenEnd;
                    }
                    XmlDotQuery q = new XmlDotQuery(pos, end2 - pos);
                    q.setLeft(pn);
                    q.setRight(filter);
                    q.setOperatorPosition(opPos);
                    q.setRp(rp - pos);
                    q.setLineno(lineno4);
                    pn = q;
                    break;
            }
        }
        return pn;
    }

    private AstNode propertyAccess(int tt, AstNode pn) throws IOException {
        String name;
        AstNode ref;
        if (pn == null) {
            codeBug();
        }
        int memberTypeFlags = 0;
        int lineno = this.ts.lineno;
        int dotPos = this.ts.tokenBeg;
        consumeToken();
        if (tt == 143) {
            mustHaveXML();
            memberTypeFlags = 4;
        }
        if (!this.compilerEnv.isXmlAvailable()) {
            int maybeName = nextToken();
            if (maybeName != 39 && (!this.compilerEnv.isReservedKeywordAsIdentifier() || !TokenStream.isKeyword(this.ts.getString()))) {
                reportError("msg.no.name.after.dot");
            }
            PropertyGet pg = new PropertyGet(pn, createNameNode(true, 33), dotPos);
            pg.setLineno(lineno);
            return pg;
        }
        int token = nextToken();
        switch (token) {
            case 23:
                saveNameTokenData(this.ts.tokenBeg, "*", this.ts.lineno);
                ref = propertyName(-1, "*", memberTypeFlags);
                break;
            case 39:
                ref = propertyName(-1, this.ts.getString(), memberTypeFlags);
                break;
            case 50:
                saveNameTokenData(this.ts.tokenBeg, "throw", this.ts.lineno);
                ref = propertyName(-1, "throw", memberTypeFlags);
                break;
            case 147:
                ref = attributeAccess();
                break;
            default:
                if (this.compilerEnv.isReservedKeywordAsIdentifier() && (name = Token.keywordToName(token)) != null) {
                    saveNameTokenData(this.ts.tokenBeg, name, this.ts.lineno);
                    ref = propertyName(-1, name, memberTypeFlags);
                    break;
                } else {
                    reportError("msg.no.name.after.dot");
                    return makeErrorNode();
                }
                break;
        }
        boolean xml = ref instanceof XmlRef;
        InfixExpression result = xml ? new XmlMemberGet() : new PropertyGet();
        if (xml && tt == 108) {
            result.setType(108);
        }
        int pos = pn.getPosition();
        result.setPosition(pos);
        result.setLength(getNodeEnd(ref) - pos);
        result.setOperatorPosition(dotPos - pos);
        result.setLineno(pn.getLineno());
        result.setLeft(pn);
        result.setRight(ref);
        return result;
    }

    private AstNode attributeAccess() throws IOException {
        int tt = nextToken();
        int atPos = this.ts.tokenBeg;
        switch (tt) {
            case 23:
                saveNameTokenData(this.ts.tokenBeg, "*", this.ts.lineno);
                return propertyName(atPos, "*", 0);
            case 39:
                return propertyName(atPos, this.ts.getString(), 0);
            case 83:
                return xmlElemRef(atPos, null, -1);
            default:
                reportError("msg.no.name.after.xmlAttr");
                return makeErrorNode();
        }
    }

    private AstNode propertyName(int atPos, String s, int memberTypeFlags) throws IOException {
        int pos = atPos != -1 ? atPos : this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        int colonPos = -1;
        Name name = createNameNode(true, this.currentToken);
        Name ns = null;
        if (matchToken(144)) {
            ns = name;
            colonPos = this.ts.tokenBeg;
            switch (nextToken()) {
                case 23:
                    saveNameTokenData(this.ts.tokenBeg, "*", this.ts.lineno);
                    name = createNameNode(false, -1);
                    break;
                case 39:
                    name = createNameNode();
                    break;
                case 83:
                    return xmlElemRef(atPos, ns, colonPos);
                default:
                    reportError("msg.no.name.after.coloncolon");
                    return makeErrorNode();
            }
        }
        if (ns == null && memberTypeFlags == 0 && atPos == -1) {
            return name;
        }
        XmlPropRef ref = new XmlPropRef(pos, getNodeEnd(name) - pos);
        ref.setAtPos(atPos);
        ref.setNamespace(ns);
        ref.setColonPos(colonPos);
        ref.setPropName(name);
        ref.setLineno(lineno);
        return ref;
    }

    private XmlElemRef xmlElemRef(int atPos, Name namespace, int colonPos) throws IOException {
        int lb = this.ts.tokenBeg;
        int rb = -1;
        int pos = atPos != -1 ? atPos : lb;
        AstNode expr = expr();
        int end = getNodeEnd(expr);
        if (mustMatchToken(84, "msg.no.bracket.index")) {
            rb = this.ts.tokenBeg;
            end = this.ts.tokenEnd;
        }
        XmlElemRef ref = new XmlElemRef(pos, end - pos);
        ref.setNamespace(namespace);
        ref.setColonPos(colonPos);
        ref.setAtPos(atPos);
        ref.setExpression(expr);
        ref.setBrackets(lb, rb);
        return ref;
    }

    private AstNode destructuringPrimaryExpr() throws IOException, ParserException {
        try {
            this.inDestructuringAssignment = true;
            AstNode primaryExpr = primaryExpr();
            this.inDestructuringAssignment = false;
            return primaryExpr;
        } catch (Throwable th) {
            this.inDestructuringAssignment = false;
            throw th;
        }
    }

    private AstNode primaryExpr() throws IOException {
        int ttFlagged = nextFlaggedToken();
        int tt = ttFlagged & CLEAR_TI_MASK;
        switch (tt) {
            case -1:
                break;
            case 0:
                reportError("msg.unexpected.eof");
                break;
            case 24:
            case 100:
                this.ts.readRegExp(tt);
                int pos = this.ts.tokenBeg;
                int end = this.ts.tokenEnd;
                RegExpLiteral re = new RegExpLiteral(pos, end - pos);
                re.setValue(this.ts.getString());
                re.setFlags(this.ts.readAndClearRegExpFlags());
                return re;
            case 39:
                return name(ttFlagged, tt);
            case 40:
                String s = this.ts.getString();
                if (this.inUseStrictDirective && this.ts.isNumberOctal()) {
                    reportError("msg.no.octal.strict");
                }
                if (this.ts.isNumberOctal()) {
                    s = "0" + s;
                }
                if (this.ts.isNumberHex()) {
                    s = "0x" + s;
                }
                return new NumberLiteral(this.ts.tokenBeg, s, this.ts.getNumber());
            case 41:
                return createStringLiteral();
            case 42:
            case 43:
            case 44:
            case 45:
                int pos2 = this.ts.tokenBeg;
                int end2 = this.ts.tokenEnd;
                return new KeywordLiteral(pos2, end2 - pos2, tt);
            case 83:
                return arrayLiteral();
            case 85:
                return objectLiteral();
            case 87:
                return parenExpr();
            case 109:
                return function(2);
            case 127:
                reportError("msg.reserved.id");
                break;
            case 147:
                mustHaveXML();
                return attributeAccess();
            case 153:
                return let(false, this.ts.tokenBeg);
            default:
                reportError("msg.syntax");
                break;
        }
        return makeErrorNode();
    }

    private AstNode parenExpr() throws IOException {
        boolean wasInForInit = this.inForInit;
        this.inForInit = false;
        try {
            Comment jsdocNode = getAndResetJsDoc();
            int lineno = this.ts.lineno;
            int begin = this.ts.tokenBeg;
            AstNode e = expr();
            if (peekToken() == 119) {
                AstNode generatorExpression = generatorExpression(e, begin);
                this.inForInit = wasInForInit;
                return generatorExpression;
            }
            ParenthesizedExpression pn = new ParenthesizedExpression(e);
            if (jsdocNode == null) {
                jsdocNode = getAndResetJsDoc();
            }
            if (jsdocNode != null) {
                pn.setJsDocNode(jsdocNode);
            }
            mustMatchToken(88, "msg.no.paren");
            pn.setLength(this.ts.tokenEnd - pn.getPosition());
            pn.setLineno(lineno);
            this.inForInit = wasInForInit;
            return pn;
        } catch (Throwable th) {
            this.inForInit = wasInForInit;
            throw th;
        }
    }

    private AstNode name(int ttFlagged, int tt) throws IOException {
        String nameString = this.ts.getString();
        int namePos = this.ts.tokenBeg;
        int nameLineno = this.ts.lineno;
        if (0 != (ttFlagged & TI_CHECK_LABEL) && peekToken() == 103) {
            Label label = new Label(namePos, this.ts.tokenEnd - namePos);
            label.setName(nameString);
            label.setLineno(this.ts.lineno);
            return label;
        }
        saveNameTokenData(namePos, nameString, nameLineno);
        if (this.compilerEnv.isXmlAvailable()) {
            return propertyName(-1, nameString, 0);
        }
        return createNameNode(true, 39);
    }

    private AstNode arrayLiteral() throws IOException {
        if (this.currentToken != 83) {
            codeBug();
        }
        int pos = this.ts.tokenBeg;
        int end = this.ts.tokenEnd;
        List<AstNode> elements = new ArrayList<>();
        ArrayLiteral pn = new ArrayLiteral(pos);
        boolean after_lb_or_comma = true;
        int afterComma = -1;
        int skipCount = 0;
        while (true) {
            int tt = peekToken();
            if (tt == 89) {
                consumeToken();
                afterComma = this.ts.tokenEnd;
                if (!after_lb_or_comma) {
                    after_lb_or_comma = true;
                } else {
                    elements.add(new EmptyExpression(this.ts.tokenBeg, 1));
                    skipCount++;
                }
            } else if (tt == 84) {
                consumeToken();
                end = this.ts.tokenEnd;
                pn.setDestructuringLength(elements.size() + (after_lb_or_comma ? 1 : 0));
                pn.setSkipCount(skipCount);
                if (afterComma != -1) {
                    warnTrailingComma(pos, elements, afterComma);
                }
            } else {
                if (tt == 119 && !after_lb_or_comma && elements.size() == 1) {
                    return arrayComprehension(elements.get(0), pos);
                }
                if (tt == 0) {
                    reportError("msg.no.bracket.arg");
                    break;
                }
                if (!after_lb_or_comma) {
                    reportError("msg.no.bracket.arg");
                }
                elements.add(assignExpr());
                after_lb_or_comma = false;
                afterComma = -1;
            }
        }
        for (AstNode e : elements) {
            pn.addElement(e);
        }
        pn.setLength(end - pos);
        return pn;
    }

    private AstNode arrayComprehension(AstNode result, int pos) throws IOException {
        List<ArrayComprehensionLoop> loops = new ArrayList<>();
        while (peekToken() == 119) {
            loops.add(arrayComprehensionLoop());
        }
        int ifPos = -1;
        ConditionData data = null;
        if (peekToken() == 112) {
            consumeToken();
            ifPos = this.ts.tokenBeg - pos;
            data = condition();
        }
        mustMatchToken(84, "msg.no.bracket.arg");
        ArrayComprehension pn = new ArrayComprehension(pos, this.ts.tokenEnd - pos);
        pn.setResult(result);
        pn.setLoops(loops);
        if (data != null) {
            pn.setIfPosition(ifPos);
            pn.setFilter(data.condition);
            pn.setFilterLp(data.lp - pos);
            pn.setFilterRp(data.rp - pos);
        }
        return pn;
    }

    private ArrayComprehensionLoop arrayComprehensionLoop() throws IOException {
        if (nextToken() != 119) {
            codeBug();
        }
        int pos = this.ts.tokenBeg;
        int eachPos = -1;
        int lp = -1;
        int rp = -1;
        int inPos = -1;
        ArrayComprehensionLoop pn = new ArrayComprehensionLoop(pos);
        pushScope(pn);
        try {
            if (matchToken(39)) {
                if (this.ts.getString().equals("each")) {
                    eachPos = this.ts.tokenBeg - pos;
                } else {
                    reportError("msg.no.paren.for");
                }
            }
            if (mustMatchToken(87, "msg.no.paren.for")) {
                lp = this.ts.tokenBeg - pos;
            }
            AstNode iter = null;
            switch (peekToken()) {
                case 39:
                    consumeToken();
                    iter = createNameNode();
                    break;
                case 83:
                case 85:
                    iter = destructuringPrimaryExpr();
                    markDestructuring(iter);
                    break;
                default:
                    reportError("msg.bad.var");
                    break;
            }
            if (iter.getType() == 39) {
                defineSymbol(153, this.ts.getString(), true);
            }
            if (mustMatchToken(52, "msg.in.after.for.name")) {
                inPos = this.ts.tokenBeg - pos;
            }
            AstNode obj = expr();
            if (mustMatchToken(88, "msg.no.paren.for.ctrl")) {
                rp = this.ts.tokenBeg - pos;
            }
            pn.setLength(this.ts.tokenEnd - pos);
            pn.setIterator(iter);
            pn.setIteratedObject(obj);
            pn.setInPosition(inPos);
            pn.setEachPosition(eachPos);
            pn.setIsForEach(eachPos != -1);
            pn.setParens(lp, rp);
            popScope();
            return pn;
        } catch (Throwable th) {
            popScope();
            throw th;
        }
    }

    private AstNode generatorExpression(AstNode result, int pos) throws IOException {
        return generatorExpression(result, pos, false);
    }

    private AstNode generatorExpression(AstNode result, int pos, boolean inFunctionParams) throws IOException {
        List<GeneratorExpressionLoop> loops = new ArrayList<>();
        while (peekToken() == 119) {
            loops.add(generatorExpressionLoop());
        }
        int ifPos = -1;
        ConditionData data = null;
        if (peekToken() == 112) {
            consumeToken();
            ifPos = this.ts.tokenBeg - pos;
            data = condition();
        }
        if (!inFunctionParams) {
            mustMatchToken(88, "msg.no.paren.let");
        }
        GeneratorExpression pn = new GeneratorExpression(pos, this.ts.tokenEnd - pos);
        pn.setResult(result);
        pn.setLoops(loops);
        if (data != null) {
            pn.setIfPosition(ifPos);
            pn.setFilter(data.condition);
            pn.setFilterLp(data.lp - pos);
            pn.setFilterRp(data.rp - pos);
        }
        return pn;
    }

    private GeneratorExpressionLoop generatorExpressionLoop() throws IOException {
        if (nextToken() != 119) {
            codeBug();
        }
        int pos = this.ts.tokenBeg;
        int lp = -1;
        int rp = -1;
        int inPos = -1;
        GeneratorExpressionLoop pn = new GeneratorExpressionLoop(pos);
        pushScope(pn);
        try {
            if (mustMatchToken(87, "msg.no.paren.for")) {
                lp = this.ts.tokenBeg - pos;
            }
            AstNode iter = null;
            switch (peekToken()) {
                case 39:
                    consumeToken();
                    iter = createNameNode();
                    break;
                case 83:
                case 85:
                    iter = destructuringPrimaryExpr();
                    markDestructuring(iter);
                    break;
                default:
                    reportError("msg.bad.var");
                    break;
            }
            if (iter.getType() == 39) {
                defineSymbol(153, this.ts.getString(), true);
            }
            if (mustMatchToken(52, "msg.in.after.for.name")) {
                inPos = this.ts.tokenBeg - pos;
            }
            AstNode obj = expr();
            if (mustMatchToken(88, "msg.no.paren.for.ctrl")) {
                rp = this.ts.tokenBeg - pos;
            }
            pn.setLength(this.ts.tokenEnd - pos);
            pn.setIterator(iter);
            pn.setIteratedObject(obj);
            pn.setInPosition(inPos);
            pn.setParens(lp, rp);
            popScope();
            return pn;
        } catch (Throwable th) {
            popScope();
            throw th;
        }
    }

    private ObjectLiteral objectLiteral() throws IOException {
        String propertyName;
        int pos = this.ts.tokenBeg;
        int lineno = this.ts.lineno;
        int afterComma = -1;
        List<ObjectProperty> elems = new ArrayList<>();
        Set<String> getterNames = null;
        Set<String> setterNames = null;
        if (this.inUseStrictDirective) {
            getterNames = new HashSet<>();
            setterNames = new HashSet<>();
        }
        Comment objJsdocNode = getAndResetJsDoc();
        while (true) {
            int entryKind = 1;
            int tt = peekToken();
            Comment jsdocNode = getAndResetJsDoc();
            if (tt == 86) {
                if (afterComma != -1) {
                    warnTrailingComma(pos, elems, afterComma);
                }
            } else {
                AstNode pname = objliteralProperty();
                if (pname == null) {
                    propertyName = null;
                    reportError("msg.bad.prop");
                } else {
                    propertyName = this.ts.getString();
                    int ppos = this.ts.tokenBeg;
                    consumeToken();
                    int peeked = peekToken();
                    if (peeked != 89 && peeked != 103 && peeked != 86) {
                        if (peeked == 87) {
                            entryKind = 8;
                        } else if (pname.getType() == 39) {
                            if ("get".equals(propertyName)) {
                                entryKind = 2;
                            } else if ("set".equals(propertyName)) {
                                entryKind = 4;
                            }
                        }
                        if (entryKind == 2 || entryKind == 4) {
                            pname = objliteralProperty();
                            if (pname == null) {
                                reportError("msg.bad.prop");
                            }
                            consumeToken();
                        }
                        if (pname == null) {
                            propertyName = null;
                        } else {
                            propertyName = this.ts.getString();
                            ObjectProperty objectProp = methodDefinition(ppos, pname, entryKind);
                            pname.setJsDocNode(jsdocNode);
                            elems.add(objectProp);
                        }
                    } else {
                        pname.setJsDocNode(jsdocNode);
                        elems.add(plainProperty(pname, tt));
                    }
                }
                if (this.inUseStrictDirective && propertyName != null) {
                    switch (entryKind) {
                        case 1:
                        case 8:
                            if (getterNames.contains(propertyName) || setterNames.contains(propertyName)) {
                                addError("msg.dup.obj.lit.prop.strict", propertyName);
                            }
                            getterNames.add(propertyName);
                            setterNames.add(propertyName);
                            break;
                        case 2:
                            if (getterNames.contains(propertyName)) {
                                addError("msg.dup.obj.lit.prop.strict", propertyName);
                            }
                            getterNames.add(propertyName);
                            break;
                        case 4:
                            if (setterNames.contains(propertyName)) {
                                addError("msg.dup.obj.lit.prop.strict", propertyName);
                            }
                            setterNames.add(propertyName);
                            break;
                    }
                }
                getAndResetJsDoc();
                if (matchToken(89)) {
                    afterComma = this.ts.tokenEnd;
                }
            }
        }
        mustMatchToken(86, "msg.no.brace.prop");
        ObjectLiteral pn = new ObjectLiteral(pos, this.ts.tokenEnd - pos);
        if (objJsdocNode != null) {
            pn.setJsDocNode(objJsdocNode);
        }
        pn.setElements(elems);
        pn.setLineno(lineno);
        return pn;
    }

    private AstNode objliteralProperty() throws IOException {
        AstNode pname;
        int tt = peekToken();
        switch (tt) {
            case 39:
                pname = createNameNode();
                break;
            case 40:
                pname = new NumberLiteral(this.ts.tokenBeg, this.ts.getString(), this.ts.getNumber());
                break;
            case 41:
                pname = createStringLiteral();
                break;
            default:
                if (this.compilerEnv.isReservedKeywordAsIdentifier() && TokenStream.isKeyword(this.ts.getString())) {
                    pname = createNameNode();
                    break;
                } else {
                    return null;
                }
                break;
        }
        return pname;
    }

    private ObjectProperty plainProperty(AstNode property, int ptt) throws IOException {
        int tt = peekToken();
        if ((tt == 89 || tt == 86) && ptt == 39 && this.compilerEnv.getLanguageVersion() >= 180) {
            if (!this.inDestructuringAssignment) {
                reportError("msg.bad.object.init");
            }
            AstNode nn = new Name(property.getPosition(), property.getString());
            ObjectProperty pn = new ObjectProperty();
            pn.putProp(26, Boolean.TRUE);
            pn.setLeftAndRight(property, nn);
            return pn;
        }
        mustMatchToken(103, "msg.no.colon.prop");
        ObjectProperty pn2 = new ObjectProperty();
        pn2.setOperatorPosition(this.ts.tokenBeg);
        pn2.setLeftAndRight(property, assignExpr());
        return pn2;
    }

    private ObjectProperty methodDefinition(int pos, AstNode propName, int entryKind) throws IOException {
        FunctionNode fn = function(2);
        Name name = fn.getFunctionName();
        if (name != null && name.length() != 0) {
            reportError("msg.bad.prop");
        }
        ObjectProperty pn = new ObjectProperty(pos);
        switch (entryKind) {
            case 2:
                pn.setIsGetterMethod();
                fn.setFunctionIsGetterMethod();
                break;
            case 4:
                pn.setIsSetterMethod();
                fn.setFunctionIsSetterMethod();
                break;
            case 8:
                pn.setIsNormalMethod();
                fn.setFunctionIsNormalMethod();
                break;
        }
        int end = getNodeEnd(fn);
        pn.setLeft(propName);
        pn.setRight(fn);
        pn.setLength(end - pos);
        return pn;
    }

    private Name createNameNode() {
        return createNameNode(false, 39);
    }

    private Name createNameNode(boolean checkActivation, int token) {
        int beg = this.ts.tokenBeg;
        String s = this.ts.getString();
        int lineno = this.ts.lineno;
        if (!"".equals(this.prevNameTokenString)) {
            beg = this.prevNameTokenStart;
            s = this.prevNameTokenString;
            lineno = this.prevNameTokenLineno;
            this.prevNameTokenStart = 0;
            this.prevNameTokenString = "";
            this.prevNameTokenLineno = 0;
        }
        if (s == null) {
            if (this.compilerEnv.isIdeMode()) {
                s = "";
            } else {
                codeBug();
            }
        }
        Name name = new Name(beg, s);
        name.setLineno(lineno);
        if (checkActivation) {
            checkActivationName(s, token);
        }
        return name;
    }

    private StringLiteral createStringLiteral() {
        int pos = this.ts.tokenBeg;
        int end = this.ts.tokenEnd;
        StringLiteral s = new StringLiteral(pos, end - pos);
        s.setLineno(this.ts.lineno);
        s.setValue(this.ts.getString());
        s.setQuoteCharacter(this.ts.getQuoteChar());
        return s;
    }

    protected void checkActivationName(String name, int token) {
        if (!insideFunction()) {
            return;
        }
        boolean activation = false;
        if ("arguments".equals(name) || (this.compilerEnv.getActivationNames() != null && this.compilerEnv.getActivationNames().contains(name))) {
            activation = true;
        } else if ("length".equals(name) && token == 33 && this.compilerEnv.getLanguageVersion() == 120) {
            activation = true;
        }
        if (activation) {
            setRequiresActivation();
        }
    }

    protected void setRequiresActivation() {
        if (insideFunction()) {
            ((FunctionNode) this.currentScriptOrFn).setRequiresActivation();
        }
    }

    private void checkCallRequiresActivation(AstNode pn) {
        if ((pn.getType() == 39 && "eval".equals(((Name) pn).getIdentifier())) || (pn.getType() == 33 && "eval".equals(((PropertyGet) pn).getProperty().getIdentifier()))) {
            setRequiresActivation();
        }
    }

    protected void setIsGenerator() {
        if (insideFunction()) {
            ((FunctionNode) this.currentScriptOrFn).setIsGenerator();
        }
    }

    private void checkBadIncDec(UnaryExpression expr) {
        AstNode op = removeParens(expr.getOperand());
        int tt = op.getType();
        if (tt != 39 && tt != 33 && tt != 36 && tt != 67 && tt != 38) {
            reportError(expr.getType() == 106 ? "msg.bad.incr" : "msg.bad.decr");
        }
    }

    private ErrorNode makeErrorNode() {
        ErrorNode pn = new ErrorNode(this.ts.tokenBeg, this.ts.tokenEnd - this.ts.tokenBeg);
        pn.setLineno(this.ts.lineno);
        return pn;
    }

    private int nodeEnd(AstNode node) {
        return node.getPosition() + node.getLength();
    }

    private void saveNameTokenData(int pos, String name, int lineno) {
        this.prevNameTokenStart = pos;
        this.prevNameTokenString = name;
        this.prevNameTokenLineno = lineno;
    }

    private int lineBeginningFor(int pos) {
        char c;
        if (this.sourceChars == null) {
            return -1;
        }
        if (pos <= 0) {
            return 0;
        }
        char[] buf = this.sourceChars;
        if (pos >= buf.length) {
            pos = buf.length - 1;
        }
        do {
            pos--;
            if (pos >= 0) {
                c = buf[pos];
            } else {
                return 0;
            }
        } while (!ScriptRuntime.isJSLineTerminator(c));
        return pos + 1;
    }

    private void warnMissingSemi(int pos, int end) {
        if (this.compilerEnv.isStrictMode()) {
            int[] linep = new int[2];
            String line = this.ts.getLine(end, linep);
            int beg = this.compilerEnv.isIdeMode() ? Math.max(pos, end - linep[1]) : pos;
            if (line != null) {
                addStrictWarning("msg.missing.semi", "", beg, end - beg, linep[0], line, linep[1]);
            } else {
                addStrictWarning("msg.missing.semi", "", beg, end - beg);
            }
        }
    }

    private void warnTrailingComma(int pos, List<?> elems, int commaPos) {
        if (this.compilerEnv.getWarnTrailingComma()) {
            if (!elems.isEmpty()) {
                pos = ((AstNode) elems.get(0)).getPosition();
            }
            int pos2 = Math.max(pos, lineBeginningFor(commaPos));
            addWarning("msg.extra.trailing.comma", pos2, commaPos - pos2);
        }
    }

    private String readFully(Reader reader) throws IOException {
        BufferedReader in = new BufferedReader(reader);
        try {
            char[] cbuf = new char[ClassFileWriter.ACC_ABSTRACT];
            StringBuilder sb = new StringBuilder(ClassFileWriter.ACC_ABSTRACT);
            while (true) {
                int bytes_read = in.read(cbuf, 0, ClassFileWriter.ACC_ABSTRACT);
                if (bytes_read != -1) {
                    sb.append(cbuf, 0, bytes_read);
                } else {
                    String sb2 = sb.toString();
                    in.close();
                    return sb2;
                }
            }
        } catch (Throwable th) {
            in.close();
            throw th;
        }
    }

    /* loaded from: rhino-1.7.7.jar:org/mozilla/javascript/Parser$PerFunctionVariables.class */
    protected class PerFunctionVariables {
        private ScriptNode savedCurrentScriptOrFn;
        private Scope savedCurrentScope;
        private int savedEndFlags;
        private boolean savedInForInit;
        private Map<String, LabeledStatement> savedLabelSet;
        private List<Loop> savedLoopSet;
        private List<Jump> savedLoopAndSwitchSet;

        PerFunctionVariables(FunctionNode fnNode) {
            this.savedCurrentScriptOrFn = Parser.this.currentScriptOrFn;
            Parser.this.currentScriptOrFn = fnNode;
            this.savedCurrentScope = Parser.this.currentScope;
            Parser.this.currentScope = fnNode;
            this.savedLabelSet = Parser.this.labelSet;
            Parser.this.labelSet = null;
            this.savedLoopSet = Parser.this.loopSet;
            Parser.this.loopSet = null;
            this.savedLoopAndSwitchSet = Parser.this.loopAndSwitchSet;
            Parser.this.loopAndSwitchSet = null;
            this.savedEndFlags = Parser.this.endFlags;
            Parser.this.endFlags = 0;
            this.savedInForInit = Parser.this.inForInit;
            Parser.this.inForInit = false;
        }

        void restore() {
            Parser.this.currentScriptOrFn = this.savedCurrentScriptOrFn;
            Parser.this.currentScope = this.savedCurrentScope;
            Parser.this.labelSet = this.savedLabelSet;
            Parser.this.loopSet = this.savedLoopSet;
            Parser.this.loopAndSwitchSet = this.savedLoopAndSwitchSet;
            Parser.this.endFlags = this.savedEndFlags;
            Parser.this.inForInit = this.savedInForInit;
        }
    }

    Node createDestructuringAssignment(int type, Node left, Node right) {
        String tempName = this.currentScriptOrFn.getNextTempName();
        Node result = destructuringAssignmentHelper(type, left, right, tempName);
        Node comma = result.getLastChild();
        comma.addChildToBack(createName(tempName));
        return result;
    }

    Node destructuringAssignmentHelper(int variableType, Node left, Node right, String tempName) {
        Scope result = createScopeNode(158, left.getLineno());
        result.addChildToFront(new Node(153, createName(39, tempName, right)));
        try {
            pushScope(result);
            defineSymbol(153, tempName, true);
            popScope();
            Node comma = new Node(89);
            result.addChildToBack(comma);
            List<String> destructuringNames = new ArrayList<>();
            boolean empty = true;
            switch (left.getType()) {
                case 33:
                case 36:
                    switch (variableType) {
                        case 122:
                        case 153:
                        case 154:
                            reportError("msg.bad.assign.left");
                            break;
                    }
                    comma.addChildToBack(simpleAssignment(left, createName(tempName)));
                    break;
                case 65:
                    empty = destructuringArray((ArrayLiteral) left, variableType, tempName, comma, destructuringNames);
                    break;
                case 66:
                    empty = destructuringObject((ObjectLiteral) left, variableType, tempName, comma, destructuringNames);
                    break;
                default:
                    reportError("msg.bad.assign.left");
                    break;
            }
            if (empty) {
                comma.addChildToBack(createNumber(0.0d));
            }
            result.putProp(22, destructuringNames);
            return result;
        } catch (Throwable th) {
            popScope();
            throw th;
        }
    }

    boolean destructuringArray(ArrayLiteral array, int variableType, String tempName, Node parent, List<String> destructuringNames) {
        boolean empty = true;
        int setOp = variableType == 154 ? 155 : 8;
        int index = 0;
        for (AstNode n : array.getElements()) {
            if (n.getType() == 128) {
                index++;
            } else {
                Node rightElem = new Node(36, createName(tempName), createNumber(index));
                if (n.getType() == 39) {
                    String name = n.getString();
                    parent.addChildToBack(new Node(setOp, createName(49, name, null), rightElem));
                    if (variableType != -1) {
                        defineSymbol(variableType, name, true);
                        destructuringNames.add(name);
                    }
                } else {
                    parent.addChildToBack(destructuringAssignmentHelper(variableType, n, rightElem, this.currentScriptOrFn.getNextTempName()));
                }
                index++;
                empty = false;
            }
        }
        return empty;
    }

    boolean destructuringObject(ObjectLiteral node, int variableType, String tempName, Node parent, List<String> destructuringNames) {
        Node rightElem;
        boolean empty = true;
        int setOp = variableType == 154 ? 155 : 8;
        for (ObjectProperty prop : node.getElements()) {
            int lineno = 0;
            if (this.ts != null) {
                lineno = this.ts.lineno;
            }
            AstNode id = prop.getLeft();
            if (id instanceof Name) {
                Node s = Node.newString(((Name) id).getIdentifier());
                rightElem = new Node(33, createName(tempName), s);
            } else if (id instanceof StringLiteral) {
                Node s2 = Node.newString(((StringLiteral) id).getValue());
                rightElem = new Node(33, createName(tempName), s2);
            } else if (id instanceof NumberLiteral) {
                Node s3 = createNumber((int) ((NumberLiteral) id).getNumber());
                rightElem = new Node(36, createName(tempName), s3);
            } else {
                throw codeBug();
            }
            rightElem.setLineno(lineno);
            AstNode value = prop.getRight();
            if (value.getType() == 39) {
                String name = ((Name) value).getIdentifier();
                parent.addChildToBack(new Node(setOp, createName(49, name, null), rightElem));
                if (variableType != -1) {
                    defineSymbol(variableType, name, true);
                    destructuringNames.add(name);
                }
            } else {
                parent.addChildToBack(destructuringAssignmentHelper(variableType, value, rightElem, this.currentScriptOrFn.getNextTempName()));
            }
            empty = false;
        }
        return empty;
    }

    protected Node createName(String name) {
        checkActivationName(name, 39);
        return Node.newString(39, name);
    }

    protected Node createName(int type, String name, Node child) {
        Node result = createName(name);
        result.setType(type);
        if (child != null) {
            result.addChildToBack(child);
        }
        return result;
    }

    protected Node createNumber(double number) {
        return Node.newNumber(number);
    }

    protected Scope createScopeNode(int token, int lineno) {
        Scope scope = new Scope();
        scope.setType(token);
        scope.setLineno(lineno);
        return scope;
    }

    protected Node simpleAssignment(Node left, Node right) {
        Node obj;
        Node id;
        int type;
        int nodeType = left.getType();
        switch (nodeType) {
            case 33:
            case 36:
                if (left instanceof PropertyGet) {
                    obj = ((PropertyGet) left).getTarget();
                    id = ((PropertyGet) left).getProperty();
                } else if (left instanceof ElementGet) {
                    obj = ((ElementGet) left).getTarget();
                    id = ((ElementGet) left).getElement();
                } else {
                    obj = left.getFirstChild();
                    id = left.getLastChild();
                }
                if (nodeType == 33) {
                    type = 35;
                    id.setType(41);
                } else {
                    type = 37;
                }
                return new Node(type, obj, id, right);
            case 39:
                if (this.inUseStrictDirective && "eval".equals(((Name) left).getIdentifier())) {
                    reportError("msg.bad.id.strict", ((Name) left).getIdentifier());
                }
                left.setType(49);
                return new Node(8, left, right);
            case 67:
                Node ref = left.getFirstChild();
                checkMutableReference(ref);
                return new Node(68, ref, right);
            default:
                throw codeBug();
        }
    }

    protected void checkMutableReference(Node n) {
        int memberTypeFlags = n.getIntProp(16, 0);
        if ((memberTypeFlags & 4) != 0) {
            reportError("msg.bad.assign.left");
        }
    }

    protected AstNode removeParens(AstNode node) {
        while (node instanceof ParenthesizedExpression) {
            node = ((ParenthesizedExpression) node).getExpression();
        }
        return node;
    }

    /* JADX WARN: Multi-variable type inference failed */
    void markDestructuring(AstNode astNode) {
        if (astNode instanceof DestructuringForm) {
            ((DestructuringForm) astNode).setIsDestructuring(true);
        } else if (astNode instanceof ParenthesizedExpression) {
            markDestructuring(((ParenthesizedExpression) astNode).getExpression());
        }
    }

    private RuntimeException codeBug() throws RuntimeException {
        throw Kit.codeBug("ts.cursor=" + this.ts.cursor + ", ts.tokenBeg=" + this.ts.tokenBeg + ", currentToken=" + this.currentToken);
    }
}
