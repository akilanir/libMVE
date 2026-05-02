package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/NoSuchProviderException.class */
public class NoSuchProviderException extends MessagingException {
    private static final long serialVersionUID = 8058319293154708827L;

    public NoSuchProviderException() {
    }

    public NoSuchProviderException(String message) {
        super(message);
    }

    public NoSuchProviderException(String message, Exception e) {
        super(message, e);
    }
}
