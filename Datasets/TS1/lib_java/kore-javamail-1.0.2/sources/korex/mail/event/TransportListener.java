package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/TransportListener.class */
public interface TransportListener extends EventListener {
    void messageDelivered(TransportEvent transportEvent);

    void messageNotDelivered(TransportEvent transportEvent);

    void messagePartiallyDelivered(TransportEvent transportEvent);
}
