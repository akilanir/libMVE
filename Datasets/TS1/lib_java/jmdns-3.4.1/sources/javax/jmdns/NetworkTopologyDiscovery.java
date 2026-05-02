package javax.jmdns;

import java.net.InetAddress;
import java.net.NetworkInterface;
import java.util.concurrent.atomic.AtomicReference;
import javax.jmdns.impl.NetworkTopologyDiscoveryImpl;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/NetworkTopologyDiscovery.class */
public interface NetworkTopologyDiscovery {
    InetAddress[] getInetAddresses();

    boolean useInetAddress(NetworkInterface networkInterface, InetAddress inetAddress);

    void lockInetAddress(InetAddress inetAddress);

    void unlockInetAddress(InetAddress inetAddress);

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/NetworkTopologyDiscovery$Factory.class */
    public static final class Factory {
        private static volatile NetworkTopologyDiscovery _instance;
        private static final AtomicReference<ClassDelegate> _databaseClassDelegate = new AtomicReference<>();

        /* loaded from: jmdns-3.4.1.jar:javax/jmdns/NetworkTopologyDiscovery$Factory$ClassDelegate.class */
        public interface ClassDelegate {
            NetworkTopologyDiscovery newNetworkTopologyDiscovery();
        }

        private Factory() {
        }

        public static void setClassDelegate(ClassDelegate delegate) {
            _databaseClassDelegate.set(delegate);
        }

        public static ClassDelegate classDelegate() {
            return _databaseClassDelegate.get();
        }

        protected static NetworkTopologyDiscovery newNetworkTopologyDiscovery() {
            NetworkTopologyDiscovery instance = null;
            ClassDelegate delegate = _databaseClassDelegate.get();
            if (delegate != null) {
                instance = delegate.newNetworkTopologyDiscovery();
            }
            return instance != null ? instance : new NetworkTopologyDiscoveryImpl();
        }

        public static NetworkTopologyDiscovery getInstance() {
            if (_instance == null) {
                synchronized (Factory.class) {
                    if (_instance == null) {
                        _instance = newNetworkTopologyDiscovery();
                    }
                }
            }
            return _instance;
        }
    }
}
