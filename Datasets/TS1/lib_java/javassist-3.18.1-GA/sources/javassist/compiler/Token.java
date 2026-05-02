package javassist.compiler;

/* compiled from: Lex.java */
/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/Token.class */
class Token {
    public Token next = null;
    public int tokenId;
    public long longValue;
    public double doubleValue;
    public String textValue;

    Token() {
    }
}
