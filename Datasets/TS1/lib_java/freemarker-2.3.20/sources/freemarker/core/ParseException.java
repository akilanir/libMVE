package freemarker.core;

import freemarker.template.Template;
import freemarker.template.utility.SecurityUtilities;
import freemarker.template.utility.StringUtil;
import java.io.IOException;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/ParseException.class */
public class ParseException extends IOException implements FMParserConstants {
    public Token currentToken;
    private static volatile Boolean jbossToolsMode;
    private boolean messageAndDescriptionRendered;
    private String message;
    private String description;
    public int columnNumber;
    public int lineNumber;
    public int[][] expectedTokenSequences;
    public String[] tokenImage;
    protected String eol;
    protected boolean specialConstructor;
    private final Throwable cause;
    private String templateName;
    static Class class$freemarker$core$ParseException;

    public ParseException(Token currentTokenVal, int[][] expectedTokenSequencesVal, String[] tokenImageVal) {
        super("");
        this.eol = SecurityUtilities.getSystemProperty("line.separator", "\n");
        this.cause = null;
        this.currentToken = currentTokenVal;
        this.specialConstructor = true;
        this.expectedTokenSequences = expectedTokenSequencesVal;
        this.tokenImage = tokenImageVal;
        this.lineNumber = this.currentToken.next.beginLine;
        this.columnNumber = this.currentToken.next.beginColumn;
    }

    protected ParseException() {
        this.eol = SecurityUtilities.getSystemProperty("line.separator", "\n");
        this.cause = null;
    }

    public ParseException(String description, int lineNumber, int columnNumber) {
        this(description, (Template) null, lineNumber, columnNumber, (Throwable) null);
    }

    public ParseException(String description, Template template, int lineNumber, int columnNumber) {
        this(description, template, lineNumber, columnNumber, (Throwable) null);
    }

    public ParseException(String description, Template template, int lineNumber, int columnNumber, Throwable cause) {
        this(description, template == null ? null : template.getName(), lineNumber, columnNumber, cause);
    }

    public ParseException(String description, Template template, Token tk) {
        this(description, template, tk, (Throwable) null);
    }

    public ParseException(String description, Template template, Token tk, Throwable cause) {
        this(description, template == null ? null : template.getName(), tk.beginLine, tk.beginColumn, cause);
    }

    public ParseException(String description, TemplateObject tobj) {
        this(description, tobj, (Throwable) null);
    }

    public ParseException(String description, TemplateObject tobj, Throwable cause) {
        this(description, tobj.getTemplate() == null ? null : tobj.getTemplate().getName(), tobj.beginLine, tobj.beginColumn, cause);
    }

    private ParseException(String description, String templateName, int lineNumber, int columnNumber, Throwable cause) {
        super(description);
        this.eol = SecurityUtilities.getSystemProperty("line.separator", "\n");
        this.cause = cause;
        this.description = description;
        this.templateName = templateName;
        this.lineNumber = lineNumber;
        this.columnNumber = columnNumber;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
        synchronized (this) {
            this.messageAndDescriptionRendered = false;
            this.message = null;
        }
    }

    @Override // java.lang.Throwable
    public Throwable getCause() {
        return this.cause;
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        String str;
        synchronized (this) {
            if (this.messageAndDescriptionRendered) {
                return this.message;
            }
            renderMessageAndDescription();
            synchronized (this) {
                str = this.message;
            }
            return str;
        }
    }

    private String getDescription() {
        String str;
        synchronized (this) {
            if (this.messageAndDescriptionRendered) {
                return this.description;
            }
            renderMessageAndDescription();
            synchronized (this) {
                str = this.description;
            }
            return str;
        }
    }

    public String getEditorMessage() {
        return getDescription();
    }

    public String getTemplateName() {
        return this.templateName;
    }

    public int getLineNumber() {
        return this.lineNumber;
    }

    public int getColumnNumber() {
        return this.columnNumber;
    }

    private void renderMessageAndDescription() {
        String prefix;
        String desc = getOrRenderDescription();
        if (!isInJBossToolsMode()) {
            prefix = new StringBuffer().append("Parsing error ").append(MessageUtil.formatLocationForSimpleParsingError(this.templateName, this.lineNumber, this.columnNumber)).append(":\n").toString();
        } else {
            prefix = new StringBuffer().append("[col. ").append(this.columnNumber).append("] ").toString();
        }
        String msg = new StringBuffer().append(prefix).append(desc).toString();
        String desc2 = msg.substring(prefix.length());
        synchronized (this) {
            this.message = msg;
            this.description = desc2;
            this.messageAndDescriptionRendered = true;
        }
    }

    private boolean isInJBossToolsMode() {
        Class cls;
        if (jbossToolsMode == null) {
            try {
                if (class$freemarker$core$ParseException == null) {
                    cls = class$("freemarker.core.ParseException");
                    class$freemarker$core$ParseException = cls;
                } else {
                    cls = class$freemarker$core$ParseException;
                }
                jbossToolsMode = cls.getClassLoader().toString().indexOf("[org.jboss.ide.eclipse.freemarker:") != -1 ? Boolean.TRUE : Boolean.FALSE;
            } catch (Throwable th) {
                jbossToolsMode = Boolean.FALSE;
            }
        }
        return jbossToolsMode.booleanValue();
    }

    static Class class$(String x0) {
        try {
            return Class.forName(x0);
        } catch (ClassNotFoundException x1) {
            throw new NoClassDefFoundError(x1.getMessage());
        }
    }

    private String getOrRenderDescription() {
        String tokenErrDesc;
        String tokenErrDesc2;
        synchronized (this) {
            if (this.description != null) {
                return this.description;
            }
            if (this.currentToken != null) {
                tokenErrDesc = getCustomTokenErrorDescription();
                if (tokenErrDesc == null) {
                    StringBuffer expected = new StringBuffer();
                    int maxSize = 0;
                    for (int i = 0; i < this.expectedTokenSequences.length; i++) {
                        if (i != 0) {
                            expected.append(this.eol);
                        }
                        expected.append("    ");
                        if (maxSize < this.expectedTokenSequences[i].length) {
                            maxSize = this.expectedTokenSequences[i].length;
                        }
                        for (int j = 0; j < this.expectedTokenSequences[i].length; j++) {
                            if (j != 0) {
                                expected.append(' ');
                            }
                            expected.append(this.tokenImage[this.expectedTokenSequences[i][j]]);
                        }
                    }
                    String tokenErrDesc3 = "Encountered \"";
                    Token tok = this.currentToken.next;
                    int i2 = 0;
                    while (true) {
                        if (i2 >= maxSize) {
                            break;
                        }
                        if (i2 != 0) {
                            tokenErrDesc3 = new StringBuffer().append(tokenErrDesc3).append(" ").toString();
                        }
                        if (tok.kind == 0) {
                            tokenErrDesc3 = new StringBuffer().append(tokenErrDesc3).append(this.tokenImage[0]).toString();
                            break;
                        }
                        tokenErrDesc3 = new StringBuffer().append(tokenErrDesc3).append(add_escapes(tok.image)).toString();
                        tok = tok.next;
                        i2++;
                    }
                    String tokenErrDesc4 = new StringBuffer().append(tokenErrDesc3).append("\", but ").toString();
                    if (this.expectedTokenSequences.length == 1) {
                        tokenErrDesc2 = new StringBuffer().append(tokenErrDesc4).append("was expecting:").append(this.eol).toString();
                    } else {
                        tokenErrDesc2 = new StringBuffer().append(tokenErrDesc4).append("was expecting one of:").append(this.eol).toString();
                    }
                    tokenErrDesc = new StringBuffer().append(tokenErrDesc2).append((Object) expected).toString();
                }
            } else {
                tokenErrDesc = null;
            }
            return tokenErrDesc;
        }
    }

    private String getCustomTokenErrorDescription() {
        String name;
        Token nextToken = this.currentToken.next;
        int kind = nextToken.kind;
        if (kind == 0) {
            for (int i = 0; i < this.expectedTokenSequences.length; i++) {
                int[] sequence = this.expectedTokenSequences[i];
                switch (sequence[0]) {
                    case FMParserConstants.END_IF /* 31 */:
                        name = "#if";
                        break;
                    case 32:
                        name = "#list";
                        break;
                    case FMParserConstants.END_ATTEMPT /* 34 */:
                        name = "#attempt";
                        break;
                    case FMParserConstants.END_FOREACH /* 35 */:
                        name = "#foreach";
                        break;
                    case FMParserConstants.END_LOCAL /* 36 */:
                        name = "#local";
                        break;
                    case FMParserConstants.END_GLOBAL /* 37 */:
                        name = "#global";
                        break;
                    case FMParserConstants.END_ASSIGN /* 38 */:
                        name = "#assign";
                        break;
                    case FMParserConstants.END_FUNCTION /* 39 */:
                    case FMParserConstants.END_MACRO /* 40 */:
                        name = "#macro or #function";
                        break;
                    case FMParserConstants.END_COMPRESS /* 41 */:
                        name = "#compress";
                        break;
                    case FMParserConstants.END_TRANSFORM /* 42 */:
                        name = "#transform";
                        break;
                    case FMParserConstants.END_SWITCH /* 43 */:
                        name = "#switch";
                        break;
                    case FMParserConstants.END_ESCAPE /* 60 */:
                        name = "#escape";
                        break;
                    case FMParserConstants.END_NOESCAPE /* 62 */:
                        name = "#noescape";
                        break;
                    case 64:
                        name = "@...";
                        break;
                    case FMParserConstants.CLOSE_BRACKET /* 112 */:
                        name = "[";
                        break;
                    case FMParserConstants.CLOSE_PAREN /* 114 */:
                        name = "(";
                        break;
                    case FMParserConstants.CLOSE_BRACE /* 116 */:
                        name = "{";
                        break;
                    default:
                        name = null;
                        break;
                }
                if (name != null) {
                    if (!name.startsWith("#") && !name.startsWith("@")) {
                        name = StringUtil.jQuote(name);
                    }
                    return new StringBuffer().append("Unclosed ").append(name).append(" when the end of the file was reached.").toString();
                }
            }
            return "Unexpected end of file reached.";
        }
        if (kind == 31 || kind == 9 || kind == 44) {
            return new StringBuffer().append("Unexpected directive, ").append(StringUtil.jQuote(nextToken)).append(". Check whether you have a valid #if-#elseif-#else structure.").toString();
        }
        return null;
    }

    protected String add_escapes(String str) {
        StringBuffer retval = new StringBuffer();
        for (int i = 0; i < str.length(); i++) {
            switch (str.charAt(i)) {
                case 0:
                    break;
                case '\b':
                    retval.append("\\b");
                    break;
                case FMParserConstants.ELSE_IF /* 9 */:
                    retval.append("\\t");
                    break;
                case FMParserConstants.LIST /* 10 */:
                    retval.append("\\n");
                    break;
                case FMParserConstants.SWITCH /* 12 */:
                    retval.append("\\f");
                    break;
                case FMParserConstants.CASE /* 13 */:
                    retval.append("\\r");
                    break;
                case FMParserConstants.END_ATTEMPT /* 34 */:
                    retval.append("\\\"");
                    break;
                case FMParserConstants.END_FUNCTION /* 39 */:
                    retval.append("\\'");
                    break;
                case FMParserConstants.DOUBLE_EQUALS /* 92 */:
                    retval.append("\\\\");
                    break;
                default:
                    char ch = str.charAt(i);
                    if (ch < ' ' || ch > '~') {
                        String s = new StringBuffer().append("0000").append(Integer.toString(ch, 16)).toString();
                        retval.append(new StringBuffer().append("\\u").append(s.substring(s.length() - 4, s.length())).toString());
                        break;
                    } else {
                        retval.append(ch);
                        break;
                    }
                    break;
            }
        }
        return retval.toString();
    }
}
