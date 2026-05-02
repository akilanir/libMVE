package javassist.compiler;

/* loaded from: javassist-3.18.1-GA.jar:javassist/compiler/SyntaxError.class */
public class SyntaxError extends CompileError {
    public SyntaxError(Lex lexer) {
        super("syntax error near \"" + lexer.getTextAround() + "\"", lexer);
    }
}
