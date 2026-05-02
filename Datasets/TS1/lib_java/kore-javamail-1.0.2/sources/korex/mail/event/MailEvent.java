package korex.mail.event;

import java.util.EventObject;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/MailEvent.class */
public abstract class MailEvent extends EventObject {
    private static final long serialVersionUID = 1846275636325456631L;

    public abstract void dispatch(Object obj);

    public MailEvent(Object source) {
        super(source);
    }
}
