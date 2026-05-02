package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/IllegalWriteException.class */
public class IllegalWriteException extends MessagingException {
    private static final long serialVersionUID = 3974370223328268013L;

    public IllegalWriteException() {
    }

    public IllegalWriteException(String s) {
        super(s);
    }

    public IllegalWriteException(String s, Exception e) {
        super(s, e);
    }
}
