package korex.mail.event;

import java.util.EventListener;

/* loaded from: kore-javamail-1.0.2.jar:korex/mail/event/StoreListener.class */
public interface StoreListener extends EventListener {
    void notification(StoreEvent storeEvent);
}
