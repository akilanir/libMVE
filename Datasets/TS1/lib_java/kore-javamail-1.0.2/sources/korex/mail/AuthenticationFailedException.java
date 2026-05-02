package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/AuthenticationFailedException.class */
public class AuthenticationFailedException extends MessagingException {
    private static final long serialVersionUID = 492080754054436511L;

    public AuthenticationFailedException() {
    }

    public AuthenticationFailedException(String message) {
        super(message);
    }

    public AuthenticationFailedException(String message, Exception e) {
        super(message, e);
    }
}
