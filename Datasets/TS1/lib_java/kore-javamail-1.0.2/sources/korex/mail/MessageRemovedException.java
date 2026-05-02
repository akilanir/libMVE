package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/MessageRemovedException.class */
public class MessageRemovedException extends MessagingException {
    private static final long serialVersionUID = 1951292550679528690L;

    public MessageRemovedException() {
    }

    public MessageRemovedException(String s) {
        super(s);
    }

    public MessageRemovedException(String s, Exception e) {
        super(s, e);
    }
}
