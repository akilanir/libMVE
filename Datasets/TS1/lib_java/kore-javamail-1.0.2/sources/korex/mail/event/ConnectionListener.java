package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/ConnectionListener.class */
public interface ConnectionListener extends EventListener {
    void opened(ConnectionEvent connectionEvent);

    void disconnected(ConnectionEvent connectionEvent);

    void closed(ConnectionEvent connectionEvent);
}
