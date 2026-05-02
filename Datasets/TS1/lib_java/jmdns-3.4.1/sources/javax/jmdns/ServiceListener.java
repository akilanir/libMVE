package javax.jmdns;

import java.util.EventListener;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/ServiceListener.class */
public interface ServiceListener extends EventListener {
    void serviceAdded(ServiceEvent serviceEvent);

    void serviceRemoved(ServiceEvent serviceEvent);

    void serviceResolved(ServiceEvent serviceEvent);
}
