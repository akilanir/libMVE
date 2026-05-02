package brut.common;

/* loaded from: apktool-lib-1.4.4-3.jar:brut/common/BrutException.class */
public class BrutException extends Exception {
    public BrutException(Throwable th) {
        super(th);
    }

    public BrutException(String str, Throwable th) {
        super(str, th);
    }

    public BrutException(String str) {
        super(str);
    }

    public BrutException() {
    }
}
