package korex.mail.event;

import korex.mail.Store;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/StoreEvent.class */
public class StoreEvent extends MailEvent {
    public static final int ALERT = 1;
    public static final int NOTICE = 2;
    protected int type;
    protected String message;
    private static final long serialVersionUID = 1938704919992515330L;

    public StoreEvent(Store store, int type, String message) {
        super(store);
        this.type = type;
        this.message = message;
    }

    public int getMessageType() {
        return this.type;
    }

    public String getMessage() {
        return this.message;
    }

    @Override // korex.mail.event.MailEvent
    public void dispatch(Object listener) {
        ((StoreListener) listener).notification(this);
    }
}
