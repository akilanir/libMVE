package korex.mail;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/StoreClosedException.class */
public class StoreClosedException extends MessagingException {
    private transient Store store;
    private static final long serialVersionUID = -3145392336120082655L;

    public StoreClosedException(Store store) {
        this(store, null);
    }

    public StoreClosedException(Store store, String message) {
        super(message);
        this.store = store;
    }

    public StoreClosedException(Store store, String message, Exception e) {
        super(message, e);
        this.store = store;
    }

    public Store getStore() {
        return this.store;
    }
}
