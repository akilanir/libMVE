package javassist.tools.reflect;

/* loaded from: javassist-3.18.1-GA.jar:javassist/tools/reflect/CannotCreateException.class */
public class CannotCreateException extends Exception {
    public CannotCreateException(String s) {
        super(s);
    }

    public CannotCreateException(Exception e) {
        super("by " + e.toString());
    }
}
