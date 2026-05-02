package javax.jmdns;

import java.io.Closeable;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Map;
import java.util.concurrent.atomic.AtomicReference;
import javax.jmdns.impl.JmmDNSImpl;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/JmmDNS.class */
public interface JmmDNS extends Closeable {
    String[] getNames();

    String[] getHostNames();

    InetAddress[] getInterfaces() throws IOException;

    ServiceInfo[] getServiceInfos(String str, String str2);

    ServiceInfo[] getServiceInfos(String str, String str2, long j);

    ServiceInfo[] getServiceInfos(String str, String str2, boolean z);

    ServiceInfo[] getServiceInfos(String str, String str2, boolean z, long j);

    void requestServiceInfo(String str, String str2);

    void requestServiceInfo(String str, String str2, boolean z);

    void requestServiceInfo(String str, String str2, long j);

    void requestServiceInfo(String str, String str2, boolean z, long j);

    void addServiceTypeListener(ServiceTypeListener serviceTypeListener) throws IOException;

    void removeServiceTypeListener(ServiceTypeListener serviceTypeListener);

    void addServiceListener(String str, ServiceListener serviceListener);

    void removeServiceListener(String str, ServiceListener serviceListener);

    void registerService(ServiceInfo serviceInfo) throws IOException;

    void unregisterService(ServiceInfo serviceInfo);

    void unregisterAllServices();

    void registerServiceType(String str);

    ServiceInfo[] list(String str);

    ServiceInfo[] list(String str, long j);

    Map<String, ServiceInfo[]> listBySubtype(String str);

    Map<String, ServiceInfo[]> listBySubtype(String str, long j);

    void addNetworkTopologyListener(NetworkTopologyListener networkTopologyListener);

    void removeNetworkTopologyListener(NetworkTopologyListener networkTopologyListener);

    NetworkTopologyListener[] networkListeners();

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/JmmDNS$Factory.class */
    public static final class Factory {
        private static volatile JmmDNS _instance;
        private static final AtomicReference<ClassDelegate> _databaseClassDelegate = new AtomicReference<>();

        /* loaded from: jmdns-3.4.1.jar:javax/jmdns/JmmDNS$Factory$ClassDelegate.class */
        public interface ClassDelegate {
            JmmDNS newJmmDNS();
        }

        private Factory() {
        }

        public static void setClassDelegate(ClassDelegate delegate) {
            _databaseClassDelegate.set(delegate);
        }

        public static ClassDelegate classDelegate() {
            return _databaseClassDelegate.get();
        }

        protected static JmmDNS newJmmDNS() {
            JmmDNS dns = null;
            ClassDelegate delegate = _databaseClassDelegate.get();
            if (delegate != null) {
                dns = delegate.newJmmDNS();
            }
            return dns != null ? dns : new JmmDNSImpl();
        }

        public static JmmDNS getInstance() {
            if (_instance == null) {
                synchronized (Factory.class) {
                    if (_instance == null) {
                        _instance = newJmmDNS();
                    }
                }
            }
            return _instance;
        }
    }
}
