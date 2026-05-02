package javassist.bytecode.annotation;

/* loaded from: javassist-3.18.1-GA.jar:javassist/bytecode/annotation/NoSuchClassError.class */
public class NoSuchClassError extends Error {
    private String className;

    public NoSuchClassError(String className, Error cause) {
        super(cause.toString(), cause);
        this.className = className;
    }

    public String getClassName() {
        return this.className;
    }
}
