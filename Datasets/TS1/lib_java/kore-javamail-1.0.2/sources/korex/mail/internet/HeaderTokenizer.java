package korex.mail.internet;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/HeaderTokenizer.class */
public class HeaderTokenizer {
    private String string;
    private boolean skipComments;
    private String delimiters;
    private int currentPos;
    private int maxPos;
    private int nextPos;
    private int peekPos;
    public static final String RFC822 = "()<>@,;:\\\"\t .[]";
    public static final String MIME = "()<>@,;:\\\"\t []/?=";
    private static final Token EOFToken = new Token(-4, null);

    /* loaded from: kore-javamail-1.0.2.jar:korex/mail/internet/HeaderTokenizer$Token.class */
    public static class Token {
        private int type;
        private String value;
        public static final int ATOM = -1;
        public static final int QUOTEDSTRING = -2;
        public static final int COMMENT = -3;
        public static final int EOF = -4;

        public Token(int type, String value) {
            this.type = type;
            this.value = value;
        }

        public int getType() {
            return this.type;
        }

        public String getValue() {
            return this.value;
        }
    }

    public HeaderTokenizer(String header, String delimiters, boolean skipComments) {
        this.string = header == null ? "" : header;
        this.skipComments = skipComments;
        this.delimiters = delimiters;
        this.peekPos = 0;
        this.nextPos = 0;
        this.currentPos = 0;
        this.maxPos = this.string.length();
    }

    public HeaderTokenizer(String header, String delimiters) {
        this(header, delimiters, true);
    }

    public HeaderTokenizer(String header) {
        this(header, RFC822);
    }

    public Token next() throws ParseException {
        return next((char) 0, false);
    }

    public Token next(char endOfAtom) throws ParseException {
        return next(endOfAtom, false);
    }

    public Token next(char endOfAtom, boolean keepEscapes) throws ParseException {
        this.currentPos = this.nextPos;
        Token tk = getNext(endOfAtom, keepEscapes);
        int i = this.currentPos;
        this.peekPos = i;
        this.nextPos = i;
        return tk;
    }

    public Token peek() throws ParseException {
        this.currentPos = this.peekPos;
        Token tk = getNext((char) 0, false);
        this.peekPos = this.currentPos;
        return tk;
    }

    public String getRemainder() {
        if (this.nextPos >= this.string.length()) {
            return null;
        }
        return this.string.substring(this.nextPos);
    }

    private Token getNext(char endOfAtom, boolean keepEscapes) throws ParseException {
        String s;
        if (this.currentPos >= this.maxPos) {
            return EOFToken;
        }
        if (skipWhiteSpace() == -4) {
            return EOFToken;
        }
        boolean filter = false;
        char charAt = this.string.charAt(this.currentPos);
        while (true) {
            char c = charAt;
            if (c == '(') {
                int start = this.currentPos + 1;
                this.currentPos = start;
                int nesting = 1;
                while (nesting > 0 && this.currentPos < this.maxPos) {
                    char c2 = this.string.charAt(this.currentPos);
                    if (c2 == '\\') {
                        this.currentPos++;
                        filter = true;
                    } else if (c2 == '\r') {
                        filter = true;
                    } else if (c2 == '(') {
                        nesting++;
                    } else if (c2 == ')') {
                        nesting--;
                    }
                    this.currentPos++;
                }
                if (nesting != 0) {
                    throw new ParseException("Unbalanced comments");
                }
                if (!this.skipComments) {
                    if (filter) {
                        s = filterToken(this.string, start, this.currentPos - 1, keepEscapes);
                    } else {
                        s = this.string.substring(start, this.currentPos - 1);
                    }
                    return new Token(-3, s);
                }
                if (skipWhiteSpace() == -4) {
                    return EOFToken;
                }
                charAt = this.string.charAt(this.currentPos);
            } else {
                if (c == '\"') {
                    this.currentPos++;
                    return collectString('\"', keepEscapes);
                }
                if (c < ' ' || c >= 127 || this.delimiters.indexOf(c) >= 0) {
                    if (endOfAtom > 0 && c != endOfAtom) {
                        return collectString(endOfAtom, keepEscapes);
                    }
                    this.currentPos++;
                    char[] ch = {c};
                    return new Token(c, new String(ch));
                }
                int start2 = this.currentPos;
                while (this.currentPos < this.maxPos) {
                    char c3 = this.string.charAt(this.currentPos);
                    if (c3 >= ' ' && c3 < 127 && c3 != '(' && c3 != ' ' && c3 != '\"' && this.delimiters.indexOf(c3) < 0) {
                        this.currentPos++;
                    } else {
                        if (endOfAtom > 0 && c3 != endOfAtom) {
                            this.currentPos = start2;
                            return collectString(endOfAtom, keepEscapes);
                        }
                        return new Token(-1, this.string.substring(start2, this.currentPos));
                    }
                }
                return new Token(-1, this.string.substring(start2, this.currentPos));
            }
        }
    }

    private Token collectString(char eos, boolean keepEscapes) throws ParseException {
        String s;
        String s2;
        boolean filter = false;
        int start = this.currentPos;
        while (this.currentPos < this.maxPos) {
            char c = this.string.charAt(this.currentPos);
            if (c == '\\') {
                this.currentPos++;
                filter = true;
            } else if (c == '\r') {
                filter = true;
            } else if (c == eos) {
                this.currentPos++;
                if (filter) {
                    s2 = filterToken(this.string, start, this.currentPos - 1, keepEscapes);
                } else {
                    s2 = this.string.substring(start, this.currentPos - 1);
                }
                if (c != '\"') {
                    s2 = trimWhiteSpace(s2);
                    this.currentPos--;
                }
                return new Token(-2, s2);
            }
            this.currentPos++;
        }
        if (eos == '\"') {
            throw new ParseException("Unbalanced quoted string");
        }
        if (filter) {
            s = filterToken(this.string, start, this.currentPos, keepEscapes);
        } else {
            s = this.string.substring(start, this.currentPos);
        }
        return new Token(-2, trimWhiteSpace(s));
    }

    private int skipWhiteSpace() {
        while (this.currentPos < this.maxPos) {
            char c = this.string.charAt(this.currentPos);
            if (c == ' ' || c == '\t' || c == '\r' || c == '\n') {
                this.currentPos++;
            } else {
                return this.currentPos;
            }
        }
        return -4;
    }

    private static String trimWhiteSpace(String s) {
        char c;
        int i = s.length() - 1;
        while (i >= 0 && ((c = s.charAt(i)) == ' ' || c == '\t' || c == '\r' || c == '\n')) {
            i--;
        }
        if (i <= 0) {
            return "";
        }
        return s.substring(0, i + 1);
    }

    private static String filterToken(String s, int start, int end, boolean keepEscapes) {
        StringBuffer sb = new StringBuffer();
        boolean gotEscape = false;
        boolean gotCR = false;
        for (int i = start; i < end; i++) {
            char c = s.charAt(i);
            if (c == '\n' && gotCR) {
                gotCR = false;
            } else {
                gotCR = false;
                if (!gotEscape) {
                    if (c == '\\') {
                        gotEscape = true;
                    } else if (c == '\r') {
                        gotCR = true;
                    } else {
                        sb.append(c);
                    }
                } else {
                    if (keepEscapes) {
                        sb.append('\\');
                    }
                    sb.append(c);
                    gotEscape = false;
                }
            }
        }
        return sb.toString();
    }
}
