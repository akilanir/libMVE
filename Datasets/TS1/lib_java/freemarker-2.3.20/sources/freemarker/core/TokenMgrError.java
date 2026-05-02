package freemarker.core;

import freemarker.template.Template;

/* loaded from: freemarker-2.3.20.jar:freemarker/core/TokenMgrError.class */
public class TokenMgrError extends Error {
    static final int LEXICAL_ERROR = 0;
    static final int STATIC_LEXER_ERROR = 1;
    static final int INVALID_LEXICAL_STATE = 2;
    static final int LOOP_DETECTED = 3;
    int errorCode;
    private String detail;
    private Integer lineNumber;
    private Integer columnNumber;

    protected static final String addEscapes(String str) {
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

    protected static String LexicalError(boolean EOFSeen, int lexState, int errorLine, int errorColumn, String errorAfter, char curChar) {
        return new StringBuffer().append("Lexical error: encountered ").append(EOFSeen ? "<EOF> " : new StringBuffer().append("\"").append(addEscapes(String.valueOf(curChar))).append("\"").append(" (").append((int) curChar).append("), ").toString()).append("after \"").append(addEscapes(errorAfter)).append("\".").toString();
    }

    @Override // java.lang.Throwable
    public String getMessage() {
        return super.getMessage();
    }

    public TokenMgrError() {
    }

    public TokenMgrError(String detail, int reason) {
        super(detail);
        this.detail = detail;
        this.errorCode = reason;
    }

    public TokenMgrError(String detail, int reason, int errorLine, int errorColumn) {
        super(detail);
        this.detail = detail;
        this.errorCode = reason;
        this.lineNumber = new Integer(errorLine);
        this.columnNumber = new Integer(errorColumn);
    }

    public TokenMgrError(boolean EOFSeen, int lexState, int errorLine, int errorColumn, String errorAfter, char curChar, int reason) {
        this(LexicalError(EOFSeen, lexState, errorLine, errorColumn, errorAfter, curChar), reason);
        this.lineNumber = new Integer(errorLine);
        this.columnNumber = new Integer(errorColumn);
    }

    public Integer getLineNumber() {
        return this.lineNumber;
    }

    public Integer getColumnNumber() {
        return this.columnNumber;
    }

    public String getDetail() {
        return this.detail;
    }

    public ParseException toParseException(Template template) {
        return new ParseException(getDetail(), template, getLineNumber() != null ? getLineNumber().intValue() : 0, getColumnNumber() != null ? getColumnNumber().intValue() : 0);
    }
}
