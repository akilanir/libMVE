package javax.jmdns;

import java.util.EventListener;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/NetworkTopologyListener.class */
public interface NetworkTopologyListener extends EventListener {
    void inetAddressAdded(NetworkTopologyEvent networkTopologyEvent);

    void inetAddressRemoved(NetworkTopologyEvent networkTopologyEvent);
}
