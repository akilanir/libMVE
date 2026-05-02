package ch.qos.logback.core.pattern.parser;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/pattern/parser/Token.class */
class Token {
    static final int PERCENT = 37;
    static final int RIGHT_PARENTHESIS = 41;
    static final int MINUS = 45;
    static final int DOT = 46;
    static final int CURLY_LEFT = 123;
    static final int CURLY_RIGHT = 125;
    static final int LITERAL = 1000;
    static final int FORMAT_MODIFIER = 1002;
    static final int SIMPLE_KEYWORD = 1004;
    static final int OPTION = 1006;
    static final int EOF = Integer.MAX_VALUE;
    private final int type;
    private final Object value;
    static Token EOF_TOKEN = new Token(Integer.MAX_VALUE, "EOF");
    static Token RIGHT_PARENTHESIS_TOKEN = new Token(41);
    static final int COMPOSITE_KEYWORD = 1005;
    static Token BARE_COMPOSITE_KEYWORD_TOKEN = new Token(COMPOSITE_KEYWORD, "BARE");
    static Token PERCENT_TOKEN = new Token(37);

    public Token(int i) {
        this(i, null);
    }

    public Token(int i, Object obj) {
        this.type = i;
        this.value = obj;
    }

    public int getType() {
        return this.type;
    }

    public Object getValue() {
        return this.value;
    }

    public String toString() {
        String str;
        switch (this.type) {
            case 37:
                str = "%";
                break;
            case 41:
                str = "RIGHT_PARENTHESIS";
                break;
            case 1000:
                str = "LITERAL";
                break;
            case FORMAT_MODIFIER /* 1002 */:
                str = "FormatModifier";
                break;
            case SIMPLE_KEYWORD /* 1004 */:
                str = "SIMPLE_KEYWORD";
                break;
            case COMPOSITE_KEYWORD /* 1005 */:
                str = "COMPOSITE_KEYWORD";
                break;
            case OPTION /* 1006 */:
                str = "OPTION";
                break;
            default:
                str = "UNKNOWN";
                break;
        }
        return this.value == null ? "Token(" + str + ")" : "Token(" + str + ", \"" + this.value + "\")";
    }

    public int hashCode() {
        return (29 * this.type) + (this.value != null ? this.value.hashCode() : 0);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Token)) {
            return false;
        }
        Token token = (Token) obj;
        if (this.type != token.type) {
            return false;
        }
        return this.value != null ? this.value.equals(token.value) : token.value == null;
    }
}
