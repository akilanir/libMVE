package javax.jmdns;

import java.io.Closeable;
import java.io.IOException;
import java.net.InetAddress;
import java.util.Collection;
import java.util.Map;
import javax.jmdns.impl.JmDNSImpl;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/JmDNS.class */
public abstract class JmDNS implements Closeable {
    public static final String VERSION = "3.4.1";

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/JmDNS$Delegate.class */
    public interface Delegate {
        void cannotRecoverFromIOError(JmDNS jmDNS, Collection<ServiceInfo> collection);
    }

    public abstract String getName();

    public abstract String getHostName();

    public abstract InetAddress getInterface() throws IOException;

    public abstract ServiceInfo getServiceInfo(String str, String str2);

    public abstract ServiceInfo getServiceInfo(String str, String str2, long j);

    public abstract ServiceInfo getServiceInfo(String str, String str2, boolean z);

    public abstract ServiceInfo getServiceInfo(String str, String str2, boolean z, long j);

    public abstract void requestServiceInfo(String str, String str2);

    public abstract void requestServiceInfo(String str, String str2, boolean z);

    public abstract void requestServiceInfo(String str, String str2, long j);

    public abstract void requestServiceInfo(String str, String str2, boolean z, long j);

    public abstract void addServiceTypeListener(ServiceTypeListener serviceTypeListener) throws IOException;

    public abstract void removeServiceTypeListener(ServiceTypeListener serviceTypeListener);

    public abstract void addServiceListener(String str, ServiceListener serviceListener);

    public abstract void removeServiceListener(String str, ServiceListener serviceListener);

    public abstract void registerService(ServiceInfo serviceInfo) throws IOException;

    public abstract void unregisterService(ServiceInfo serviceInfo);

    public abstract void unregisterAllServices();

    public abstract boolean registerServiceType(String str);

    @Deprecated
    public abstract void printServices();

    public abstract ServiceInfo[] list(String str);

    public abstract ServiceInfo[] list(String str, long j);

    public abstract Map<String, ServiceInfo[]> listBySubtype(String str);

    public abstract Map<String, ServiceInfo[]> listBySubtype(String str, long j);

    public abstract Delegate getDelegate();

    public abstract Delegate setDelegate(Delegate delegate);

    public static JmDNS create() throws IOException {
        return new JmDNSImpl(null, null);
    }

    public static JmDNS create(InetAddress addr) throws IOException {
        return new JmDNSImpl(addr, null);
    }

    public static JmDNS create(String name) throws IOException {
        return new JmDNSImpl(null, name);
    }

    public static JmDNS create(InetAddress addr, String name) throws IOException {
        return new JmDNSImpl(addr, name);
    }
}
