package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/MessageChangedListener.class */
public interface MessageChangedListener extends EventListener {
    void messageChanged(MessageChangedEvent messageChangedEvent);
}
