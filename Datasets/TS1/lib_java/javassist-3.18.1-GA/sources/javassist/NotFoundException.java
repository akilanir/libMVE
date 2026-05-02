package javassist;

/* loaded from: javassist-3.18.1-GA.jar:javassist/NotFoundException.class */
public class NotFoundException extends Exception {
    public NotFoundException(String msg) {
        super(msg);
    }

    public NotFoundException(String msg, Exception e) {
        super(msg + " because of " + e.toString());
    }
}
