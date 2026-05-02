package ch.qos.logback.core.subst;

/* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Token.class */
public class Token {
    public static final Token START_TOKEN = new Token(Type.START, null);
    public static final Token CURLY_LEFT_TOKEN = new Token(Type.CURLY_LEFT, null);
    public static final Token CURLY_RIGHT_TOKEN = new Token(Type.CURLY_RIGHT, null);
    public static final Token DEFAULT_SEP_TOKEN = new Token(Type.DEFAULT, null);
    Type type;
    String payload;

    /* loaded from: logback-android-core-1.1.1-3.jar:ch/qos/logback/core/subst/Token$Type.class */
    public enum Type {
        LITERAL,
        START,
        CURLY_LEFT,
        CURLY_RIGHT,
        DEFAULT
    }

    public Token(Type type, String str) {
        this.type = type;
        this.payload = str;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        Token token = (Token) obj;
        if (this.type != token.type) {
            return false;
        }
        return this.payload != null ? this.payload.equals(token.payload) : token.payload == null;
    }

    public int hashCode() {
        return (31 * (this.type != null ? this.type.hashCode() : 0)) + (this.payload != null ? this.payload.hashCode() : 0);
    }

    public String toString() {
        String str = "Token{type=" + this.type;
        if (this.payload != null) {
            str = str + ", payload='" + this.payload + '\'';
        }
        return str + '}';
    }
}
