package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/MessageCountListener.class */
public interface MessageCountListener extends EventListener {
    void messagesAdded(MessageCountEvent messageCountEvent);

    void messagesRemoved(MessageCountEvent messageCountEvent);
}
