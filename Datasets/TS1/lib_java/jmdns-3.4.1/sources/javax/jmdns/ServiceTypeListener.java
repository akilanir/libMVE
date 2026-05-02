package javax.jmdns;

import java.util.EventListener;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/ServiceTypeListener.class */
public interface ServiceTypeListener extends EventListener {
    void serviceTypeAdded(ServiceEvent serviceEvent);

    void subTypeForServiceTypeAdded(ServiceEvent serviceEvent);
}
