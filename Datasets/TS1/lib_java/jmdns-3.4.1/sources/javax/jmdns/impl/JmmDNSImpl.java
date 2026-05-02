package javax.jmdns.impl;

import java.io.IOException;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.JmDNS;
import javax.jmdns.JmmDNS;
import javax.jmdns.NetworkTopologyDiscovery;
import javax.jmdns.NetworkTopologyEvent;
import javax.jmdns.NetworkTopologyListener;
import javax.jmdns.ServiceInfo;
import javax.jmdns.ServiceListener;
import javax.jmdns.ServiceTypeListener;
import javax.jmdns.impl.ServiceInfoImpl;
import javax.jmdns.impl.constants.DNSConstants;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmmDNSImpl.class */
public class JmmDNSImpl implements JmmDNS, NetworkTopologyListener, ServiceInfoImpl.Delegate {
    private static Logger logger = Logger.getLogger(JmmDNSImpl.class.getName());
    private final Set<NetworkTopologyListener> _networkListeners = Collections.synchronizedSet(new HashSet());
    private final ConcurrentMap<InetAddress, JmDNS> _knownMDNS = new ConcurrentHashMap();
    private final ConcurrentMap<String, ServiceInfo> _services = new ConcurrentHashMap(20);
    private final ExecutorService _ListenerExecutor = Executors.newSingleThreadExecutor();
    private final ExecutorService _jmDNSExecutor = Executors.newCachedThreadPool();
    private final Timer _timer = new Timer("Multihommed mDNS.Timer", true);

    public JmmDNSImpl() {
        new NetworkChecker(this, NetworkTopologyDiscovery.Factory.getInstance()).start(this._timer);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("Cancelling JmmDNS: " + this);
        }
        this._timer.cancel();
        this._ListenerExecutor.shutdown();
        ExecutorService executor = Executors.newCachedThreadPool();
        for (final JmDNS mDNS : this._knownMDNS.values()) {
            executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        mDNS.close();
                    } catch (IOException e) {
                    }
                }
            });
        }
        executor.shutdown();
        try {
            executor.awaitTermination(DNSConstants.CLOSE_TIMEOUT, TimeUnit.MILLISECONDS);
        } catch (InterruptedException exception) {
            logger.log(Level.WARNING, "Exception ", (Throwable) exception);
        }
        this._knownMDNS.clear();
    }

    @Override // javax.jmdns.JmmDNS
    public String[] getNames() {
        Set<String> result = new HashSet<>();
        for (JmDNS mDNS : this._knownMDNS.values()) {
            result.add(mDNS.getName());
        }
        return (String[]) result.toArray(new String[result.size()]);
    }

    @Override // javax.jmdns.JmmDNS
    public String[] getHostNames() {
        Set<String> result = new HashSet<>();
        for (JmDNS mDNS : this._knownMDNS.values()) {
            result.add(mDNS.getHostName());
        }
        return (String[]) result.toArray(new String[result.size()]);
    }

    @Override // javax.jmdns.JmmDNS
    public InetAddress[] getInterfaces() throws IOException {
        Set<InetAddress> result = new HashSet<>();
        for (JmDNS mDNS : this._knownMDNS.values()) {
            result.add(mDNS.getInterface());
        }
        return (InetAddress[]) result.toArray(new InetAddress[result.size()]);
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] getServiceInfos(String type, String name) {
        return getServiceInfos(type, name, false, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] getServiceInfos(String type, String name, long timeout) {
        return getServiceInfos(type, name, false, timeout);
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] getServiceInfos(String type, String name, boolean persistent) {
        return getServiceInfos(type, name, persistent, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] getServiceInfos(final String type, final String name, final boolean persistent, final long timeout) {
        final Set<ServiceInfo> result = Collections.synchronizedSet(new HashSet(this._knownMDNS.size()));
        ExecutorService executor = Executors.newCachedThreadPool();
        for (final JmDNS mDNS : this._knownMDNS.values()) {
            executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.2
                @Override // java.lang.Runnable
                public void run() {
                    result.add(mDNS.getServiceInfo(type, name, persistent, timeout));
                }
            });
        }
        executor.shutdown();
        try {
            executor.awaitTermination(timeout, TimeUnit.MILLISECONDS);
        } catch (InterruptedException exception) {
            logger.log(Level.WARNING, "Exception ", (Throwable) exception);
        }
        return (ServiceInfo[]) result.toArray(new ServiceInfo[result.size()]);
    }

    @Override // javax.jmdns.JmmDNS
    public void requestServiceInfo(String type, String name) {
        requestServiceInfo(type, name, false, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public void requestServiceInfo(String type, String name, boolean persistent) {
        requestServiceInfo(type, name, persistent, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public void requestServiceInfo(String type, String name, long timeout) {
        requestServiceInfo(type, name, false, timeout);
    }

    @Override // javax.jmdns.JmmDNS
    public void requestServiceInfo(final String type, final String name, final boolean persistent, final long timeout) {
        for (final JmDNS mDNS : this._knownMDNS.values()) {
            this._jmDNSExecutor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.3
                @Override // java.lang.Runnable
                public void run() {
                    mDNS.requestServiceInfo(type, name, persistent, timeout);
                }
            });
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void addServiceTypeListener(ServiceTypeListener listener) throws IOException {
        for (JmDNS mDNS : this._knownMDNS.values()) {
            mDNS.addServiceTypeListener(listener);
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void removeServiceTypeListener(ServiceTypeListener listener) {
        for (JmDNS mDNS : this._knownMDNS.values()) {
            mDNS.removeServiceTypeListener(listener);
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void addServiceListener(String type, ServiceListener listener) {
        for (JmDNS mDNS : this._knownMDNS.values()) {
            mDNS.addServiceListener(type, listener);
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void removeServiceListener(String type, ServiceListener listener) {
        for (JmDNS mDNS : this._knownMDNS.values()) {
            mDNS.removeServiceListener(type, listener);
        }
    }

    @Override // javax.jmdns.impl.ServiceInfoImpl.Delegate
    public void textValueUpdated(ServiceInfo target, byte[] value) {
        synchronized (this._services) {
            for (JmDNS mDNS : this._knownMDNS.values()) {
                ServiceInfo info = ((JmDNSImpl) mDNS).getServices().get(target.getQualifiedName());
                if (info != null) {
                    info.setText(value);
                } else {
                    logger.warning("We have a mDNS that does not know about the service info being updated.");
                }
            }
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void registerService(ServiceInfo info) throws IOException {
        synchronized (this._services) {
            for (JmDNS mDNS : this._knownMDNS.values()) {
                mDNS.registerService(info.mo4clone());
            }
            ((ServiceInfoImpl) info).setDelegate(this);
            this._services.put(info.getQualifiedName(), info);
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void unregisterService(ServiceInfo info) {
        synchronized (this._services) {
            for (JmDNS mDNS : this._knownMDNS.values()) {
                mDNS.unregisterService(info);
            }
            ((ServiceInfoImpl) info).setDelegate(null);
            this._services.remove(info.getQualifiedName());
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void unregisterAllServices() {
        synchronized (this._services) {
            for (JmDNS mDNS : this._knownMDNS.values()) {
                mDNS.unregisterAllServices();
            }
            this._services.clear();
        }
    }

    @Override // javax.jmdns.JmmDNS
    public void registerServiceType(String type) {
        for (JmDNS mDNS : this._knownMDNS.values()) {
            mDNS.registerServiceType(type);
        }
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] list(String type) {
        return list(type, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public ServiceInfo[] list(final String type, final long timeout) {
        final Set<ServiceInfo> result = Collections.synchronizedSet(new HashSet(this._knownMDNS.size() * 5));
        ExecutorService executor = Executors.newCachedThreadPool();
        for (final JmDNS mDNS : this._knownMDNS.values()) {
            executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.4
                @Override // java.lang.Runnable
                public void run() {
                    result.addAll(Arrays.asList(mDNS.list(type, timeout)));
                }
            });
        }
        executor.shutdown();
        try {
            executor.awaitTermination(timeout, TimeUnit.MILLISECONDS);
        } catch (InterruptedException exception) {
            logger.log(Level.WARNING, "Exception ", (Throwable) exception);
        }
        return (ServiceInfo[]) result.toArray(new ServiceInfo[result.size()]);
    }

    @Override // javax.jmdns.JmmDNS
    public Map<String, ServiceInfo[]> listBySubtype(String type) {
        return listBySubtype(type, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmmDNS
    public Map<String, ServiceInfo[]> listBySubtype(String type, long timeout) {
        Map<String, List<ServiceInfo>> map = new HashMap<>(5);
        ServiceInfo[] arr$ = list(type, timeout);
        for (ServiceInfo info : arr$) {
            String subtype = info.getSubtype();
            if (!map.containsKey(subtype)) {
                map.put(subtype, new ArrayList<>(10));
            }
            map.get(subtype).add(info);
        }
        HashMap hashMap = new HashMap(map.size());
        for (String subtype2 : map.keySet()) {
            List<ServiceInfo> infoForSubType = map.get(subtype2);
            hashMap.put(subtype2, infoForSubType.toArray(new ServiceInfo[infoForSubType.size()]));
        }
        return hashMap;
    }

    @Override // javax.jmdns.JmmDNS
    public void addNetworkTopologyListener(NetworkTopologyListener listener) {
        this._networkListeners.add(listener);
    }

    @Override // javax.jmdns.JmmDNS
    public void removeNetworkTopologyListener(NetworkTopologyListener listener) {
        this._networkListeners.remove(listener);
    }

    @Override // javax.jmdns.JmmDNS
    public NetworkTopologyListener[] networkListeners() {
        return (NetworkTopologyListener[]) this._networkListeners.toArray(new NetworkTopologyListener[this._networkListeners.size()]);
    }

    @Override // javax.jmdns.NetworkTopologyListener
    public void inetAddressAdded(NetworkTopologyEvent event) {
        InetAddress address = event.getInetAddress();
        try {
            synchronized (this) {
                if (!this._knownMDNS.containsKey(address)) {
                    this._knownMDNS.put(address, JmDNS.create(address));
                    final NetworkTopologyEvent jmdnsEvent = new NetworkTopologyEventImpl(this._knownMDNS.get(address), address);
                    NetworkTopologyListener[] arr$ = networkListeners();
                    for (final NetworkTopologyListener listener : arr$) {
                        this._ListenerExecutor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.5
                            @Override // java.lang.Runnable
                            public void run() {
                                listener.inetAddressAdded(jmdnsEvent);
                            }
                        });
                    }
                }
            }
        } catch (Exception e) {
            logger.warning("Unexpected unhandled exception: " + e);
        }
    }

    @Override // javax.jmdns.NetworkTopologyListener
    public void inetAddressRemoved(NetworkTopologyEvent event) {
        InetAddress address = event.getInetAddress();
        try {
            synchronized (this) {
                if (this._knownMDNS.containsKey(address)) {
                    JmDNS mDNS = this._knownMDNS.remove(address);
                    mDNS.close();
                    final NetworkTopologyEvent jmdnsEvent = new NetworkTopologyEventImpl(mDNS, address);
                    NetworkTopologyListener[] arr$ = networkListeners();
                    for (final NetworkTopologyListener listener : arr$) {
                        this._ListenerExecutor.submit(new Runnable() { // from class: javax.jmdns.impl.JmmDNSImpl.6
                            @Override // java.lang.Runnable
                            public void run() {
                                listener.inetAddressRemoved(jmdnsEvent);
                            }
                        });
                    }
                }
            }
        } catch (Exception e) {
            logger.warning("Unexpected unhandled exception: " + e);
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmmDNSImpl$NetworkChecker.class */
    static class NetworkChecker extends TimerTask {
        private static Logger logger1 = Logger.getLogger(NetworkChecker.class.getName());
        private final NetworkTopologyListener _mmDNS;
        private final NetworkTopologyDiscovery _topology;
        private Set<InetAddress> _knownAddresses = Collections.synchronizedSet(new HashSet());

        public NetworkChecker(NetworkTopologyListener mmDNS, NetworkTopologyDiscovery topology) {
            this._mmDNS = mmDNS;
            this._topology = topology;
        }

        public void start(Timer timer) {
            timer.schedule(this, 0L, 10000L);
        }

        @Override // java.util.TimerTask, java.lang.Runnable
        public void run() {
            try {
                InetAddress[] curentAddresses = this._topology.getInetAddresses();
                Set<InetAddress> current = new HashSet<>(curentAddresses.length);
                for (InetAddress address : curentAddresses) {
                    current.add(address);
                    if (!this._knownAddresses.contains(address)) {
                        NetworkTopologyEvent event = new NetworkTopologyEventImpl(this._mmDNS, address);
                        this._mmDNS.inetAddressAdded(event);
                    }
                }
                for (InetAddress address2 : this._knownAddresses) {
                    if (!current.contains(address2)) {
                        NetworkTopologyEvent event2 = new NetworkTopologyEventImpl(this._mmDNS, address2);
                        this._mmDNS.inetAddressRemoved(event2);
                    }
                }
                this._knownAddresses = current;
            } catch (Exception e) {
                logger1.warning("Unexpected unhandled exception: " + e);
            }
        }
    }
}
