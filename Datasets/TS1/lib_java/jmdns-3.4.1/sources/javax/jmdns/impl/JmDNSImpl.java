package javax.jmdns.impl;

import java.io.IOException;
import java.io.Serializable;
import java.net.DatagramPacket;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.MulticastSocket;
import java.net.SocketException;
import java.util.AbstractMap;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.locks.ReentrantLock;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.JmDNS;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceInfo;
import javax.jmdns.ServiceListener;
import javax.jmdns.ServiceTypeListener;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.DNSTaskStarter;
import javax.jmdns.impl.ListenerStatus;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;
import javax.jmdns.impl.constants.DNSState;
import javax.jmdns.impl.tasks.DNSTask;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl.class */
public class JmDNSImpl extends JmDNS implements DNSStatefulObject, DNSTaskStarter {
    private volatile InetAddress _group;
    private volatile MulticastSocket _socket;
    private final List<DNSListener> _listeners;
    private final ConcurrentMap<String, List<ListenerStatus.ServiceListenerStatus>> _serviceListeners;
    private final Set<ListenerStatus.ServiceTypeListenerStatus> _typeListeners;
    private final DNSCache _cache;
    private final ConcurrentMap<String, ServiceInfo> _services;
    private final ConcurrentMap<String, ServiceTypeEntry> _serviceTypes;
    private volatile JmDNS.Delegate _delegate;
    protected Thread _shutdown;
    private HostInfo _localHost;
    private Thread _incomingListener;
    private int _throttle;
    private long _lastThrottleIncrement;
    private DNSIncoming _plannedAnswer;
    private final ConcurrentMap<String, ServiceCollector> _serviceCollectors;
    private final String _name;
    private static Logger logger = Logger.getLogger(JmDNSImpl.class.getName());
    private static final Random _random = new Random();
    private final ExecutorService _executor = Executors.newSingleThreadExecutor();
    private final ReentrantLock _ioLock = new ReentrantLock();
    private final Object _recoverLock = new Object();

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl$Operation.class */
    public enum Operation {
        Remove,
        Update,
        Add,
        RegisterServiceType,
        Noop
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl$ServiceTypeEntry.class */
    public static class ServiceTypeEntry extends AbstractMap<String, String> implements Cloneable {
        private final Set<Map.Entry<String, String>> _entrySet = new HashSet();
        private final String _type;

        /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl$ServiceTypeEntry$SubTypeEntry.class */
        private static class SubTypeEntry implements Map.Entry<String, String>, Serializable, Cloneable {
            private static final long serialVersionUID = 9188503522395855322L;
            private final String _key;
            private final String _value;

            public SubTypeEntry(String subtype) {
                this._value = subtype != null ? subtype : "";
                this._key = this._value.toLowerCase();
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Map.Entry
            public String getKey() {
                return this._key;
            }

            /* JADX WARN: Can't rename method to resolve collision */
            @Override // java.util.Map.Entry
            public String getValue() {
                return this._value;
            }

            @Override // java.util.Map.Entry
            public String setValue(String value) {
                throw new UnsupportedOperationException();
            }

            @Override // java.util.Map.Entry
            public boolean equals(Object entry) {
                return (entry instanceof Map.Entry) && getKey().equals(((Map.Entry) entry).getKey()) && getValue().equals(((Map.Entry) entry).getValue());
            }

            @Override // java.util.Map.Entry
            public int hashCode() {
                return (this._key == null ? 0 : this._key.hashCode()) ^ (this._value == null ? 0 : this._value.hashCode());
            }

            /* renamed from: clone, reason: merged with bridge method [inline-methods] */
            public SubTypeEntry m25clone() {
                return this;
            }

            public String toString() {
                return this._key + "=" + this._value;
            }
        }

        public ServiceTypeEntry(String type) {
            this._type = type;
        }

        public String getType() {
            return this._type;
        }

        @Override // java.util.AbstractMap, java.util.Map
        public Set<Map.Entry<String, String>> entrySet() {
            return this._entrySet;
        }

        public boolean contains(String subtype) {
            return subtype != null && containsKey(subtype.toLowerCase());
        }

        public boolean add(String subtype) {
            if (subtype == null || contains(subtype)) {
                return false;
            }
            this._entrySet.add(new SubTypeEntry(subtype));
            return true;
        }

        public Iterator<String> iterator() {
            return keySet().iterator();
        }

        @Override // java.util.AbstractMap
        public ServiceTypeEntry clone() {
            ServiceTypeEntry entry = new ServiceTypeEntry(getType());
            for (Map.Entry<String, String> subTypeEntry : entrySet()) {
                entry.add(subTypeEntry.getValue());
            }
            return entry;
        }

        @Override // java.util.AbstractMap
        public String toString() {
            StringBuilder aLog = new StringBuilder(200);
            if (isEmpty()) {
                aLog.append("empty");
            } else {
                for (String value : values()) {
                    aLog.append(value);
                    aLog.append(", ");
                }
                aLog.setLength(aLog.length() - 2);
            }
            return aLog.toString();
        }
    }

    public static void main(String[] argv) {
        String version;
        try {
            Properties pomProperties = new Properties();
            pomProperties.load(JmDNSImpl.class.getResourceAsStream("/META-INF/maven/javax.jmdns/jmdns/pom.properties"));
            version = pomProperties.getProperty("version");
        } catch (Exception e) {
            version = "RUNNING.IN.IDE.FULL";
        }
        System.out.println("JmDNS version \"" + version + "\"");
        System.out.println(" ");
        System.out.println("Running on java version \"" + System.getProperty("java.version") + "\" (build " + System.getProperty("java.runtime.version") + ") from " + System.getProperty("java.vendor"));
        System.out.println("Operating environment \"" + System.getProperty("os.name") + "\" version " + System.getProperty("os.version") + " on " + System.getProperty("os.arch"));
        System.out.println("For more information on JmDNS please visit https://sourceforge.net/projects/jmdns/");
    }

    public JmDNSImpl(InetAddress address, String name) throws IOException {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("JmDNS instance created");
        }
        this._cache = new DNSCache(100);
        this._listeners = Collections.synchronizedList(new ArrayList());
        this._serviceListeners = new ConcurrentHashMap();
        this._typeListeners = Collections.synchronizedSet(new HashSet());
        this._serviceCollectors = new ConcurrentHashMap();
        this._services = new ConcurrentHashMap(20);
        this._serviceTypes = new ConcurrentHashMap(20);
        this._localHost = HostInfo.newHostInfo(address, this, name);
        this._name = name != null ? name : this._localHost.getName();
        openMulticastSocket(getLocalHost());
        start(getServices().values());
        startReaper();
    }

    private void start(Collection<? extends ServiceInfo> serviceInfos) {
        if (this._incomingListener == null) {
            this._incomingListener = new SocketListener(this);
            this._incomingListener.start();
        }
        startProber();
        for (ServiceInfo info : serviceInfos) {
            try {
                registerService(new ServiceInfoImpl(info));
            } catch (Exception exception) {
                logger.log(Level.WARNING, "start() Registration exception ", (Throwable) exception);
            }
        }
    }

    private void openMulticastSocket(HostInfo hostInfo) throws IOException {
        if (this._group == null) {
            if (hostInfo.getInetAddress() instanceof Inet6Address) {
                this._group = InetAddress.getByName(DNSConstants.MDNS_GROUP_IPV6);
            } else {
                this._group = InetAddress.getByName(DNSConstants.MDNS_GROUP);
            }
        }
        if (this._socket != null) {
            closeMulticastSocket();
        }
        this._socket = new MulticastSocket(DNSConstants.MDNS_PORT);
        if (hostInfo != null && hostInfo.getInterface() != null) {
            try {
                this._socket.setNetworkInterface(hostInfo.getInterface());
            } catch (SocketException e) {
                if (logger.isLoggable(Level.FINE)) {
                    logger.fine("openMulticastSocket() Set network interface exception: " + e.getMessage());
                }
            }
        }
        this._socket.setTimeToLive(255);
        this._socket.joinGroup(this._group);
    }

    private void closeMulticastSocket() {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("closeMulticastSocket()");
        }
        if (this._socket != null) {
            try {
                try {
                    this._socket.leaveGroup(this._group);
                } catch (SocketException e) {
                }
                this._socket.close();
                while (this._incomingListener != null && this._incomingListener.isAlive()) {
                    synchronized (this) {
                        try {
                            if (this._incomingListener != null && this._incomingListener.isAlive()) {
                                if (logger.isLoggable(Level.FINER)) {
                                    logger.finer("closeMulticastSocket(): waiting for jmDNS monitor");
                                }
                                wait(1000L);
                            }
                        } catch (InterruptedException e2) {
                        }
                    }
                }
                this._incomingListener = null;
            } catch (Exception exception) {
                logger.log(Level.WARNING, "closeMulticastSocket() Close socket exception ", (Throwable) exception);
            }
            this._socket = null;
        }
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean advanceState(DNSTask task) {
        return this._localHost.advanceState(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean revertState() {
        return this._localHost.revertState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean cancelState() {
        return this._localHost.cancelState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean closeState() {
        return this._localHost.closeState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean recoverState() {
        return this._localHost.recoverState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public JmDNSImpl getDns() {
        return this;
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public void associateWithTask(DNSTask task, DNSState state) {
        this._localHost.associateWithTask(task, state);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public void removeAssociationWithTask(DNSTask task) {
        this._localHost.removeAssociationWithTask(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAssociatedWithTask(DNSTask task, DNSState state) {
        return this._localHost.isAssociatedWithTask(task, state);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isProbing() {
        return this._localHost.isProbing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAnnouncing() {
        return this._localHost.isAnnouncing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAnnounced() {
        return this._localHost.isAnnounced();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isCanceling() {
        return this._localHost.isCanceling();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isCanceled() {
        return this._localHost.isCanceled();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isClosing() {
        return this._localHost.isClosing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isClosed() {
        return this._localHost.isClosed();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean waitForAnnounced(long timeout) {
        return this._localHost.waitForAnnounced(timeout);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean waitForCanceled(long timeout) {
        return this._localHost.waitForCanceled(timeout);
    }

    public DNSCache getCache() {
        return this._cache;
    }

    @Override // javax.jmdns.JmDNS
    public String getName() {
        return this._name;
    }

    @Override // javax.jmdns.JmDNS
    public String getHostName() {
        return this._localHost.getName();
    }

    public HostInfo getLocalHost() {
        return this._localHost;
    }

    @Override // javax.jmdns.JmDNS
    public InetAddress getInterface() throws IOException {
        return this._socket.getInterface();
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo getServiceInfo(String type, String name) {
        return getServiceInfo(type, name, false, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo getServiceInfo(String type, String name, long timeout) {
        return getServiceInfo(type, name, false, timeout);
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo getServiceInfo(String type, String name, boolean persistent) {
        return getServiceInfo(type, name, persistent, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo getServiceInfo(String type, String name, boolean persistent, long timeout) {
        ServiceInfoImpl info = resolveServiceInfo(type, name, "", persistent);
        waitForInfoData(info, timeout);
        if (info.hasData()) {
            return info;
        }
        return null;
    }

    ServiceInfoImpl resolveServiceInfo(String type, String name, String subtype, boolean persistent) {
        cleanCache();
        String loType = type.toLowerCase();
        registerServiceType(type);
        if (this._serviceCollectors.putIfAbsent(loType, new ServiceCollector(type)) == null) {
            addServiceListener(loType, this._serviceCollectors.get(loType), true);
        }
        ServiceInfoImpl info = getServiceInfoFromCache(type, name, subtype, persistent);
        startServiceInfoResolver(info);
        return info;
    }

    ServiceInfoImpl getServiceInfoFromCache(String type, String name, String subtype, boolean persistent) {
        ServiceInfo cachedTextInfo;
        ServiceInfo cachedAddressInfo;
        ServiceInfo cachedAddressInfo2;
        ServiceInfo cachedServiceEntryInfo;
        ServiceInfoImpl info = new ServiceInfoImpl(type, name, subtype, 0, 0, 0, persistent, (byte[]) null);
        DNSEntry pointerEntry = getCache().getDNSEntry(new DNSRecord.Pointer(type, DNSRecordClass.CLASS_ANY, false, 0, info.getQualifiedName()));
        if (pointerEntry instanceof DNSRecord) {
            ServiceInfoImpl cachedInfo = (ServiceInfoImpl) ((DNSRecord) pointerEntry).getServiceInfo(persistent);
            if (cachedInfo != null) {
                Map<ServiceInfo.Fields, String> map = cachedInfo.getQualifiedNameMap();
                byte[] srvBytes = null;
                String server = "";
                DNSEntry serviceEntry = getCache().getDNSEntry(info.getQualifiedName(), DNSRecordType.TYPE_SRV, DNSRecordClass.CLASS_ANY);
                if ((serviceEntry instanceof DNSRecord) && (cachedServiceEntryInfo = ((DNSRecord) serviceEntry).getServiceInfo(persistent)) != null) {
                    cachedInfo = new ServiceInfoImpl(map, cachedServiceEntryInfo.getPort(), cachedServiceEntryInfo.getWeight(), cachedServiceEntryInfo.getPriority(), persistent, (byte[]) null);
                    srvBytes = cachedServiceEntryInfo.getTextBytes();
                    server = cachedServiceEntryInfo.getServer();
                }
                DNSEntry addressEntry = getCache().getDNSEntry(server, DNSRecordType.TYPE_A, DNSRecordClass.CLASS_ANY);
                if ((addressEntry instanceof DNSRecord) && (cachedAddressInfo2 = ((DNSRecord) addressEntry).getServiceInfo(persistent)) != null) {
                    Inet4Address[] arr$ = cachedAddressInfo2.getInet4Addresses();
                    for (Inet4Address address : arr$) {
                        cachedInfo.addAddress(address);
                    }
                    cachedInfo._setText(cachedAddressInfo2.getTextBytes());
                }
                DNSEntry addressEntry2 = getCache().getDNSEntry(server, DNSRecordType.TYPE_AAAA, DNSRecordClass.CLASS_ANY);
                if ((addressEntry2 instanceof DNSRecord) && (cachedAddressInfo = ((DNSRecord) addressEntry2).getServiceInfo(persistent)) != null) {
                    Inet6Address[] arr$2 = cachedAddressInfo.getInet6Addresses();
                    for (Inet6Address address2 : arr$2) {
                        cachedInfo.addAddress(address2);
                    }
                    cachedInfo._setText(cachedAddressInfo.getTextBytes());
                }
                DNSEntry textEntry = getCache().getDNSEntry(cachedInfo.getQualifiedName(), DNSRecordType.TYPE_TXT, DNSRecordClass.CLASS_ANY);
                if ((textEntry instanceof DNSRecord) && (cachedTextInfo = ((DNSRecord) textEntry).getServiceInfo(persistent)) != null) {
                    cachedInfo._setText(cachedTextInfo.getTextBytes());
                }
                if (cachedInfo.getTextBytes().length == 0) {
                    cachedInfo._setText(srvBytes);
                }
                if (cachedInfo.hasData()) {
                    info = cachedInfo;
                }
            }
        }
        return info;
    }

    private void waitForInfoData(ServiceInfo info, long timeout) {
        synchronized (info) {
            long loops = timeout / 200;
            if (loops < 1) {
                loops = 1;
            }
            for (int i = 0; i < loops && !info.hasData(); i++) {
                try {
                    info.wait(200L);
                } catch (InterruptedException e) {
                }
            }
        }
    }

    @Override // javax.jmdns.JmDNS
    public void requestServiceInfo(String type, String name) {
        requestServiceInfo(type, name, false, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public void requestServiceInfo(String type, String name, boolean persistent) {
        requestServiceInfo(type, name, persistent, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public void requestServiceInfo(String type, String name, long timeout) {
        requestServiceInfo(type, name, false, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public void requestServiceInfo(String type, String name, boolean persistent, long timeout) {
        ServiceInfoImpl info = resolveServiceInfo(type, name, "", persistent);
        waitForInfoData(info, timeout);
    }

    void handleServiceResolved(final ServiceEvent event) {
        List<ListenerStatus.ServiceListenerStatus> listCopy;
        List<ListenerStatus.ServiceListenerStatus> list = this._serviceListeners.get(event.getType().toLowerCase());
        if (list != null && !list.isEmpty() && event.getInfo() != null && event.getInfo().hasData()) {
            synchronized (list) {
                listCopy = new ArrayList<>(list);
            }
            for (final ListenerStatus.ServiceListenerStatus listener : listCopy) {
                this._executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmDNSImpl.1
                    @Override // java.lang.Runnable
                    public void run() {
                        listener.serviceResolved(event);
                    }
                });
            }
        }
    }

    @Override // javax.jmdns.JmDNS
    public void addServiceTypeListener(ServiceTypeListener listener) throws IOException {
        ListenerStatus.ServiceTypeListenerStatus status = new ListenerStatus.ServiceTypeListenerStatus(listener, false);
        this._typeListeners.add(status);
        for (String type : this._serviceTypes.keySet()) {
            status.serviceTypeAdded(new ServiceEventImpl(this, type, "", null));
        }
        startTypeResolver();
    }

    @Override // javax.jmdns.JmDNS
    public void removeServiceTypeListener(ServiceTypeListener listener) {
        ListenerStatus.ServiceTypeListenerStatus status = new ListenerStatus.ServiceTypeListenerStatus(listener, false);
        this._typeListeners.remove(status);
    }

    @Override // javax.jmdns.JmDNS
    public void addServiceListener(String type, ServiceListener listener) {
        addServiceListener(type, listener, false);
    }

    private void addServiceListener(String type, ServiceListener listener, boolean synch) {
        ListenerStatus.ServiceListenerStatus status = new ListenerStatus.ServiceListenerStatus(listener, synch);
        String loType = type.toLowerCase();
        List<ListenerStatus.ServiceListenerStatus> list = this._serviceListeners.get(loType);
        if (list == null) {
            if (this._serviceListeners.putIfAbsent(loType, new LinkedList()) == null && this._serviceCollectors.putIfAbsent(loType, new ServiceCollector(type)) == null) {
                addServiceListener(loType, this._serviceCollectors.get(loType), true);
            }
            list = this._serviceListeners.get(loType);
        }
        if (list != null) {
            synchronized (list) {
                if (!list.contains(listener)) {
                    list.add(status);
                }
            }
        }
        List<ServiceEvent> serviceEvents = new ArrayList<>();
        Collection<DNSEntry> dnsEntryLits = getCache().allValues();
        for (DNSEntry entry : dnsEntryLits) {
            DNSRecord record = (DNSRecord) entry;
            if (record.getRecordType() == DNSRecordType.TYPE_SRV && record.getKey().endsWith(loType)) {
                serviceEvents.add(new ServiceEventImpl(this, record.getType(), toUnqualifiedName(record.getType(), record.getName()), record.getServiceInfo()));
            }
        }
        for (ServiceEvent serviceEvent : serviceEvents) {
            status.serviceAdded(serviceEvent);
        }
        startServiceResolver(type);
    }

    @Override // javax.jmdns.JmDNS
    public void removeServiceListener(String type, ServiceListener listener) {
        String loType = type.toLowerCase();
        List<ListenerStatus.ServiceListenerStatus> list = this._serviceListeners.get(loType);
        if (list != null) {
            synchronized (list) {
                ListenerStatus.ServiceListenerStatus status = new ListenerStatus.ServiceListenerStatus(listener, false);
                list.remove(status);
                if (list.isEmpty()) {
                    this._serviceListeners.remove(loType, list);
                }
            }
        }
    }

    @Override // javax.jmdns.JmDNS
    public void registerService(ServiceInfo infoAbstract) throws IOException {
        if (isClosing() || isClosed()) {
            throw new IllegalStateException("This DNS is closed.");
        }
        ServiceInfoImpl info = (ServiceInfoImpl) infoAbstract;
        if (info.getDns() != null) {
            if (info.getDns() != this) {
                throw new IllegalStateException("A service information can only be registered with a single instamce of JmDNS.");
            }
            if (this._services.get(info.getKey()) != null) {
                throw new IllegalStateException("A service information can only be registered once.");
            }
        }
        info.setDns(this);
        registerServiceType(info.getTypeWithSubtype());
        info.recoverState();
        info.setServer(this._localHost.getName());
        info.addAddress(this._localHost.getInet4Address());
        info.addAddress(this._localHost.getInet6Address());
        waitForAnnounced(DNSConstants.SERVICE_INFO_TIMEOUT);
        makeServiceNameUnique(info);
        while (this._services.putIfAbsent(info.getKey(), info) != null) {
            makeServiceNameUnique(info);
        }
        startProber();
        info.waitForAnnounced(DNSConstants.SERVICE_INFO_TIMEOUT);
        if (logger.isLoggable(Level.FINE)) {
            logger.fine("registerService() JmDNS registered service as " + info);
        }
    }

    @Override // javax.jmdns.JmDNS
    public void unregisterService(ServiceInfo infoAbstract) {
        ServiceInfoImpl info = (ServiceInfoImpl) this._services.get(infoAbstract.getKey());
        if (info != null) {
            info.cancelState();
            startCanceler();
            info.waitForCanceled(DNSConstants.CLOSE_TIMEOUT);
            this._services.remove(info.getKey(), info);
            if (logger.isLoggable(Level.FINE)) {
                logger.fine("unregisterService() JmDNS unregistered service as " + info);
                return;
            }
            return;
        }
        logger.warning("Removing unregistered service info: " + infoAbstract.getKey());
    }

    @Override // javax.jmdns.JmDNS
    public void unregisterAllServices() {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("unregisterAllServices()");
        }
        Iterator i$ = this._services.keySet().iterator();
        while (i$.hasNext()) {
            ServiceInfoImpl info = (ServiceInfoImpl) this._services.get(i$.next());
            if (info != null) {
                if (logger.isLoggable(Level.FINER)) {
                    logger.finer("Cancelling service info: " + info);
                }
                info.cancelState();
            }
        }
        startCanceler();
        for (String name : this._services.keySet()) {
            ServiceInfoImpl info2 = (ServiceInfoImpl) this._services.get(name);
            if (info2 != null) {
                if (logger.isLoggable(Level.FINER)) {
                    logger.finer("Wait for service info cancel: " + info2);
                }
                info2.waitForCanceled(DNSConstants.CLOSE_TIMEOUT);
                this._services.remove(name, info2);
            }
        }
    }

    @Override // javax.jmdns.JmDNS
    public boolean registerServiceType(String type) {
        ServiceTypeEntry subtypes;
        boolean typeAdded = false;
        Map<ServiceInfo.Fields, String> map = ServiceInfoImpl.decodeQualifiedNameMapForType(type);
        String domain = map.get(ServiceInfo.Fields.Domain);
        String protocol = map.get(ServiceInfo.Fields.Protocol);
        String application = map.get(ServiceInfo.Fields.Application);
        String subtype = map.get(ServiceInfo.Fields.Subtype);
        String name = (application.length() > 0 ? "_" + application + "." : "") + (protocol.length() > 0 ? "_" + protocol + "." : "") + domain + ".";
        String loname = name.toLowerCase();
        if (logger.isLoggable(Level.FINE)) {
            logger.fine(getName() + ".registering service type: " + type + " as: " + name + (subtype.length() > 0 ? " subtype: " + subtype : ""));
        }
        if (!this._serviceTypes.containsKey(loname) && !application.toLowerCase().equals("dns-sd") && !domain.toLowerCase().endsWith("in-addr.arpa") && !domain.toLowerCase().endsWith("ip6.arpa")) {
            typeAdded = this._serviceTypes.putIfAbsent(loname, new ServiceTypeEntry(name)) == null;
            if (typeAdded) {
                ListenerStatus.ServiceTypeListenerStatus[] list = (ListenerStatus.ServiceTypeListenerStatus[]) this._typeListeners.toArray(new ListenerStatus.ServiceTypeListenerStatus[this._typeListeners.size()]);
                final ServiceEvent event = new ServiceEventImpl(this, name, "", null);
                for (final ListenerStatus.ServiceTypeListenerStatus status : list) {
                    this._executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmDNSImpl.2
                        @Override // java.lang.Runnable
                        public void run() {
                            status.serviceTypeAdded(event);
                        }
                    });
                }
            }
        }
        if (subtype.length() > 0 && (subtypes = this._serviceTypes.get(loname)) != null && !subtypes.contains(subtype)) {
            synchronized (subtypes) {
                if (!subtypes.contains(subtype)) {
                    typeAdded = true;
                    subtypes.add(subtype);
                    ListenerStatus.ServiceTypeListenerStatus[] list2 = (ListenerStatus.ServiceTypeListenerStatus[]) this._typeListeners.toArray(new ListenerStatus.ServiceTypeListenerStatus[this._typeListeners.size()]);
                    final ServiceEvent event2 = new ServiceEventImpl(this, "_" + subtype + "._sub." + name, "", null);
                    for (final ListenerStatus.ServiceTypeListenerStatus status2 : list2) {
                        this._executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmDNSImpl.3
                            @Override // java.lang.Runnable
                            public void run() {
                                status2.subTypeForServiceTypeAdded(event2);
                            }
                        });
                    }
                }
            }
        }
        return typeAdded;
    }

    private boolean makeServiceNameUnique(ServiceInfoImpl info) {
        boolean collision;
        ServiceInfo selfService;
        String originalQualifiedName = info.getKey();
        long now = System.currentTimeMillis();
        do {
            collision = false;
            for (DNSEntry dnsEntry : getCache().getDNSEntryList(info.getKey())) {
                if (DNSRecordType.TYPE_SRV.equals(dnsEntry.getRecordType()) && !dnsEntry.isExpired(now)) {
                    DNSRecord.Service s = (DNSRecord.Service) dnsEntry;
                    if (s.getPort() != info.getPort() || !s.getServer().equals(this._localHost.getName())) {
                        if (logger.isLoggable(Level.FINER)) {
                            logger.finer("makeServiceNameUnique() JmDNS.makeServiceNameUnique srv collision:" + dnsEntry + " s.server=" + s.getServer() + " " + this._localHost.getName() + " equals:" + s.getServer().equals(this._localHost.getName()));
                        }
                        info.setName(incrementName(info.getName()));
                        collision = true;
                        selfService = this._services.get(info.getKey());
                        if (selfService != null && selfService != info) {
                            info.setName(incrementName(info.getName()));
                            collision = true;
                        }
                    }
                }
            }
            selfService = this._services.get(info.getKey());
            if (selfService != null) {
                info.setName(incrementName(info.getName()));
                collision = true;
            }
        } while (collision);
        return !originalQualifiedName.equals(info.getKey());
    }

    String incrementName(String name) {
        String aName;
        try {
            int l = name.lastIndexOf(40);
            int r = name.lastIndexOf(41);
            aName = (l < 0 || l >= r) ? name + " (2)" : name.substring(0, l) + "(" + (Integer.parseInt(name.substring(l + 1, r)) + 1) + ")";
        } catch (NumberFormatException e) {
            aName = name + " (2)";
        }
        return aName;
    }

    public void addListener(DNSListener listener, DNSQuestion question) {
        long now = System.currentTimeMillis();
        this._listeners.add(listener);
        if (question != null) {
            for (DNSEntry dnsEntry : getCache().getDNSEntryList(question.getName().toLowerCase())) {
                if (question.answeredBy(dnsEntry) && !dnsEntry.isExpired(now)) {
                    listener.updateRecord(getCache(), now, dnsEntry);
                }
            }
        }
    }

    public void removeListener(DNSListener listener) {
        this._listeners.remove(listener);
    }

    public void renewServiceCollector(DNSRecord record) {
        ServiceInfo info = record.getServiceInfo();
        if (this._serviceCollectors.containsKey(info.getType().toLowerCase())) {
            startServiceResolver(info.getType());
        }
    }

    public void updateRecord(long now, DNSRecord rec, Operation operation) {
        List<DNSListener> listenerList;
        List<ListenerStatus.ServiceListenerStatus> serviceListenerList;
        synchronized (this._listeners) {
            listenerList = new ArrayList<>(this._listeners);
        }
        Iterator i$ = listenerList.iterator();
        while (i$.hasNext()) {
            i$.next().updateRecord(getCache(), now, rec);
        }
        if (DNSRecordType.TYPE_PTR.equals(rec.getRecordType())) {
            ServiceEvent event = rec.getServiceEvent(this);
            if (event.getInfo() == null || !event.getInfo().hasData()) {
                ServiceInfo info = getServiceInfoFromCache(event.getType(), event.getName(), "", false);
                if (info.hasData()) {
                    event = new ServiceEventImpl(this, event.getType(), event.getName(), info);
                }
            }
            List<ListenerStatus.ServiceListenerStatus> list = this._serviceListeners.get(event.getType().toLowerCase());
            if (list != null) {
                synchronized (list) {
                    serviceListenerList = new ArrayList<>(list);
                }
            } else {
                serviceListenerList = Collections.emptyList();
            }
            if (logger.isLoggable(Level.FINEST)) {
                logger.finest(getName() + ".updating record for event: " + event + " list " + serviceListenerList + " operation: " + operation);
            }
            if (!serviceListenerList.isEmpty()) {
                final ServiceEvent localEvent = event;
                switch (operation) {
                    case Add:
                        for (final ListenerStatus.ServiceListenerStatus listener : serviceListenerList) {
                            if (listener.isSynchronous()) {
                                listener.serviceAdded(localEvent);
                            } else {
                                this._executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmDNSImpl.4
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        listener.serviceAdded(localEvent);
                                    }
                                });
                            }
                        }
                        return;
                    case Remove:
                        for (final ListenerStatus.ServiceListenerStatus listener2 : serviceListenerList) {
                            if (listener2.isSynchronous()) {
                                listener2.serviceRemoved(localEvent);
                            } else {
                                this._executor.submit(new Runnable() { // from class: javax.jmdns.impl.JmDNSImpl.5
                                    @Override // java.lang.Runnable
                                    public void run() {
                                        listener2.serviceRemoved(localEvent);
                                    }
                                });
                            }
                        }
                        return;
                    default:
                        return;
                }
            }
        }
    }

    void handleRecord(DNSRecord record, long now) {
        DNSRecord newRecord = record;
        Operation cacheOperation = Operation.Noop;
        boolean expired = newRecord.isExpired(now);
        if (logger.isLoggable(Level.FINE)) {
            logger.fine(getName() + " handle response: " + newRecord);
        }
        if (!newRecord.isServicesDiscoveryMetaQuery() && !newRecord.isDomainDiscoveryQuery()) {
            boolean unique = newRecord.isUnique();
            DNSRecord cachedRecord = (DNSRecord) getCache().getDNSEntry(newRecord);
            if (logger.isLoggable(Level.FINE)) {
                logger.fine(getName() + " handle response cached record: " + cachedRecord);
            }
            if (unique) {
                for (DNSEntry entry : getCache().getDNSEntryList(newRecord.getKey())) {
                    if (newRecord.getRecordType().equals(entry.getRecordType()) && newRecord.getRecordClass().equals(entry.getRecordClass()) && entry != cachedRecord) {
                        ((DNSRecord) entry).setWillExpireSoon(now);
                    }
                }
            }
            if (cachedRecord != null) {
                if (expired) {
                    if (newRecord.getTTL() == 0) {
                        cacheOperation = Operation.Noop;
                        cachedRecord.setWillExpireSoon(now);
                    } else {
                        cacheOperation = Operation.Remove;
                        getCache().removeDNSEntry(cachedRecord);
                    }
                } else if (!newRecord.sameValue(cachedRecord) || (!newRecord.sameSubtype(cachedRecord) && newRecord.getSubtype().length() > 0)) {
                    if (newRecord.isSingleValued()) {
                        cacheOperation = Operation.Update;
                        getCache().replaceDNSEntry(newRecord, cachedRecord);
                    } else {
                        cacheOperation = Operation.Add;
                        getCache().addDNSEntry(newRecord);
                    }
                } else {
                    cachedRecord.resetTTL(newRecord);
                    newRecord = cachedRecord;
                }
            } else if (!expired) {
                cacheOperation = Operation.Add;
                getCache().addDNSEntry(newRecord);
            }
        }
        if (newRecord.getRecordType() == DNSRecordType.TYPE_PTR) {
            if (newRecord.isServicesDiscoveryMetaQuery()) {
                if (!expired) {
                    registerServiceType(((DNSRecord.Pointer) newRecord).getAlias());
                    return;
                }
                return;
            } else {
                boolean typeAdded = false | registerServiceType(newRecord.getName());
                if (typeAdded && cacheOperation == Operation.Noop) {
                    cacheOperation = Operation.RegisterServiceType;
                }
            }
        }
        if (cacheOperation != Operation.Noop) {
            updateRecord(now, newRecord, cacheOperation);
        }
    }

    void handleResponse(DNSIncoming msg) throws IOException {
        long now = System.currentTimeMillis();
        boolean hostConflictDetected = false;
        boolean serviceConflictDetected = false;
        for (DNSRecord newRecord : msg.getAllAnswers()) {
            handleRecord(newRecord, now);
            if (DNSRecordType.TYPE_A.equals(newRecord.getRecordType()) || DNSRecordType.TYPE_AAAA.equals(newRecord.getRecordType())) {
                hostConflictDetected |= newRecord.handleResponse(this);
            } else {
                serviceConflictDetected |= newRecord.handleResponse(this);
            }
        }
        if (hostConflictDetected || serviceConflictDetected) {
            startProber();
        }
    }

    void handleQuery(DNSIncoming in, InetAddress addr, int port) throws IOException {
        if (logger.isLoggable(Level.FINE)) {
            logger.fine(getName() + ".handle query: " + in);
        }
        boolean conflictDetected = false;
        long expirationTime = System.currentTimeMillis() + 120;
        for (DNSRecord answer : in.getAllAnswers()) {
            conflictDetected |= answer.handleQuery(this, expirationTime);
        }
        ioLock();
        try {
            if (this._plannedAnswer != null) {
                this._plannedAnswer.append(in);
            } else {
                DNSIncoming plannedAnswer = in.m8clone();
                if (in.isTruncated()) {
                    this._plannedAnswer = plannedAnswer;
                }
                startResponder(plannedAnswer, port);
            }
            long now = System.currentTimeMillis();
            for (DNSRecord answer2 : in.getAnswers()) {
                handleRecord(answer2, now);
            }
            if (conflictDetected) {
                startProber();
            }
        } finally {
            ioUnlock();
        }
    }

    public void respondToQuery(DNSIncoming in) {
        ioLock();
        try {
            if (this._plannedAnswer == in) {
                this._plannedAnswer = null;
            }
        } finally {
            ioUnlock();
        }
    }

    public DNSOutgoing addAnswer(DNSIncoming in, InetAddress addr, int port, DNSOutgoing out, DNSRecord rec) throws IOException {
        DNSOutgoing newOut = out;
        if (newOut == null) {
            newOut = new DNSOutgoing(33792, false, in.getSenderUDPPayload());
        }
        try {
            newOut.addAnswer(in, rec);
        } catch (IOException e) {
            newOut.setFlags(newOut.getFlags() | DNSConstants.FLAGS_TC);
            newOut.setId(in.getId());
            send(newOut);
            newOut = new DNSOutgoing(33792, false, in.getSenderUDPPayload());
            newOut.addAnswer(in, rec);
        }
        return newOut;
    }

    public void send(DNSOutgoing out) throws IOException {
        if (!out.isEmpty()) {
            byte[] message = out.data();
            DatagramPacket packet = new DatagramPacket(message, message.length, this._group, DNSConstants.MDNS_PORT);
            if (logger.isLoggable(Level.FINEST)) {
                try {
                    DNSIncoming msg = new DNSIncoming(packet);
                    if (logger.isLoggable(Level.FINEST)) {
                        logger.finest("send(" + getName() + ") JmDNS out:" + msg.print(true));
                    }
                } catch (IOException e) {
                    logger.throwing(getClass().toString(), "send(" + getName() + ") - JmDNS can not parse what it sends!!!", e);
                }
            }
            MulticastSocket ms = this._socket;
            if (ms != null && !ms.isClosed()) {
                ms.send(packet);
            }
        }
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void purgeTimer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).purgeTimer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void purgeStateTimer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).purgeStateTimer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void cancelTimer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).cancelTimer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void cancelStateTimer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).cancelStateTimer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startProber() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startProber();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startAnnouncer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startAnnouncer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startRenewer() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startRenewer();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startCanceler() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startCanceler();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startReaper() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startReaper();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startServiceInfoResolver(ServiceInfoImpl info) {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startServiceInfoResolver(info);
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startTypeResolver() {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startTypeResolver();
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startServiceResolver(String type) {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startServiceResolver(type);
    }

    @Override // javax.jmdns.impl.DNSTaskStarter
    public void startResponder(DNSIncoming in, int port) {
        DNSTaskStarter.Factory.getInstance().getStarter(getDns()).startResponder(in, port);
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl$Shutdown.class */
    protected class Shutdown implements Runnable {
        protected Shutdown() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                JmDNSImpl.this._shutdown = null;
                JmDNSImpl.this.close();
            } catch (Throwable exception) {
                System.err.println("Error while shuting down. " + exception);
            }
        }
    }

    public void recover() {
        logger.finer(getName() + "recover()");
        if (isClosing() || isClosed() || isCanceling() || isCanceled()) {
            return;
        }
        synchronized (this._recoverLock) {
            if (cancelState()) {
                logger.finer(getName() + "recover() thread " + Thread.currentThread().getName());
                Thread recover = new Thread(getName() + ".recover()") { // from class: javax.jmdns.impl.JmDNSImpl.6
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        JmDNSImpl.this.__recover();
                    }
                };
                recover.start();
            }
        }
    }

    void __recover() {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer(getName() + "recover() Cleanning up");
        }
        logger.warning("RECOVERING");
        purgeTimer();
        Collection<ServiceInfo> oldServiceInfos = new ArrayList<>(getServices().values());
        unregisterAllServices();
        disposeServiceCollectors();
        waitForCanceled(DNSConstants.CLOSE_TIMEOUT);
        purgeStateTimer();
        closeMulticastSocket();
        getCache().clear();
        if (logger.isLoggable(Level.FINER)) {
            logger.finer(getName() + "recover() All is clean");
        }
        if (isCanceled()) {
            for (ServiceInfo info : oldServiceInfos) {
                ((ServiceInfoImpl) info).recoverState();
            }
            recoverState();
            try {
                openMulticastSocket(getLocalHost());
                start(oldServiceInfos);
            } catch (Exception exception) {
                logger.log(Level.WARNING, getName() + "recover() Start services exception ", (Throwable) exception);
            }
            logger.log(Level.WARNING, getName() + "recover() We are back!");
            return;
        }
        logger.log(Level.WARNING, getName() + "recover() Could not recover we are Down!");
        if (getDelegate() != null) {
            getDelegate().cannotRecoverFromIOError(getDns(), oldServiceInfos);
        }
    }

    public void cleanCache() {
        long now = System.currentTimeMillis();
        for (DNSEntry entry : getCache().allValues()) {
            try {
                DNSRecord record = (DNSRecord) entry;
                if (record.isExpired(now)) {
                    updateRecord(now, record, Operation.Remove);
                    getCache().removeDNSEntry(record);
                } else if (record.isStale(now)) {
                    renewServiceCollector(record);
                }
            } catch (Exception exception) {
                logger.log(Level.SEVERE, getName() + ".Error while reaping records: " + entry, (Throwable) exception);
                logger.severe(toString());
            }
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        if (isClosing()) {
            return;
        }
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("Cancelling JmDNS: " + this);
        }
        if (closeState()) {
            logger.finer("Canceling the timer");
            cancelTimer();
            unregisterAllServices();
            disposeServiceCollectors();
            if (logger.isLoggable(Level.FINER)) {
                logger.finer("Wait for JmDNS cancel: " + this);
            }
            waitForCanceled(DNSConstants.CLOSE_TIMEOUT);
            logger.finer("Canceling the state timer");
            cancelStateTimer();
            this._executor.shutdown();
            closeMulticastSocket();
            if (this._shutdown != null) {
                Runtime.getRuntime().removeShutdownHook(this._shutdown);
            }
            if (logger.isLoggable(Level.FINER)) {
                logger.finer("JmDNS closed.");
            }
        }
        advanceState(null);
    }

    @Override // javax.jmdns.JmDNS
    @Deprecated
    public void printServices() {
        System.err.println(toString());
    }

    public String toString() {
        StringBuilder aLog = new StringBuilder(2048);
        aLog.append("\t---- Local Host -----");
        aLog.append("\n\t");
        aLog.append(this._localHost);
        aLog.append("\n\t---- Services -----");
        for (String key : this._services.keySet()) {
            aLog.append("\n\t\tService: ");
            aLog.append(key);
            aLog.append(": ");
            aLog.append(this._services.get(key));
        }
        aLog.append("\n");
        aLog.append("\t---- Types ----");
        Iterator i$ = this._serviceTypes.keySet().iterator();
        while (i$.hasNext()) {
            ServiceTypeEntry subtypes = this._serviceTypes.get(i$.next());
            aLog.append("\n\t\tType: ");
            aLog.append(subtypes.getType());
            aLog.append(": ");
            aLog.append(subtypes.isEmpty() ? "no subtypes" : subtypes);
        }
        aLog.append("\n");
        aLog.append(this._cache.toString());
        aLog.append("\n");
        aLog.append("\t---- Service Collectors ----");
        for (String key2 : this._serviceCollectors.keySet()) {
            aLog.append("\n\t\tService Collector: ");
            aLog.append(key2);
            aLog.append(": ");
            aLog.append(this._serviceCollectors.get(key2));
        }
        aLog.append("\n");
        aLog.append("\t---- Service Listeners ----");
        for (String key3 : this._serviceListeners.keySet()) {
            aLog.append("\n\t\tService Listener: ");
            aLog.append(key3);
            aLog.append(": ");
            aLog.append(this._serviceListeners.get(key3));
        }
        return aLog.toString();
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo[] list(String type) {
        return list(type, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public ServiceInfo[] list(String type, long timeout) {
        cleanCache();
        String loType = type.toLowerCase();
        if (isCanceling() || isCanceled()) {
            return new ServiceInfo[0];
        }
        ServiceCollector collector = this._serviceCollectors.get(loType);
        if (collector == null) {
            boolean newCollectorCreated = this._serviceCollectors.putIfAbsent(loType, new ServiceCollector(type)) == null;
            collector = this._serviceCollectors.get(loType);
            if (newCollectorCreated) {
                addServiceListener(type, collector, true);
            }
        }
        if (logger.isLoggable(Level.FINER)) {
            logger.finer(getName() + ".collector: " + collector);
        }
        return collector != null ? collector.list(timeout) : new ServiceInfo[0];
    }

    @Override // javax.jmdns.JmDNS
    public Map<String, ServiceInfo[]> listBySubtype(String type) {
        return listBySubtype(type, DNSConstants.SERVICE_INFO_TIMEOUT);
    }

    @Override // javax.jmdns.JmDNS
    public Map<String, ServiceInfo[]> listBySubtype(String type, long timeout) {
        Map<String, List<ServiceInfo>> map = new HashMap<>(5);
        ServiceInfo[] arr$ = list(type, timeout);
        for (ServiceInfo info : arr$) {
            String subtype = info.getSubtype().toLowerCase();
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

    private void disposeServiceCollectors() {
        if (logger.isLoggable(Level.FINER)) {
            logger.finer("disposeServiceCollectors()");
        }
        for (String type : this._serviceCollectors.keySet()) {
            ServiceCollector collector = this._serviceCollectors.get(type);
            if (collector != null) {
                removeServiceListener(type, collector);
                this._serviceCollectors.remove(type, collector);
            }
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/JmDNSImpl$ServiceCollector.class */
    private static class ServiceCollector implements ServiceListener {
        private final String _type;
        private final ConcurrentMap<String, ServiceInfo> _infos = new ConcurrentHashMap();
        private final ConcurrentMap<String, ServiceEvent> _events = new ConcurrentHashMap();
        private volatile boolean _needToWaitForInfos = true;

        public ServiceCollector(String type) {
            this._type = type;
        }

        @Override // javax.jmdns.ServiceListener
        public void serviceAdded(ServiceEvent event) {
            synchronized (this) {
                ServiceInfo info = event.getInfo();
                if (info != null && info.hasData()) {
                    this._infos.put(event.getName(), info);
                } else {
                    String subtype = info != null ? info.getSubtype() : "";
                    ServiceInfo info2 = ((JmDNSImpl) event.getDNS()).resolveServiceInfo(event.getType(), event.getName(), subtype, true);
                    if (info2 != null) {
                        this._infos.put(event.getName(), info2);
                    } else {
                        this._events.put(event.getName(), event);
                    }
                }
            }
        }

        @Override // javax.jmdns.ServiceListener
        public void serviceRemoved(ServiceEvent event) {
            synchronized (this) {
                this._infos.remove(event.getName());
                this._events.remove(event.getName());
            }
        }

        @Override // javax.jmdns.ServiceListener
        public void serviceResolved(ServiceEvent event) {
            synchronized (this) {
                this._infos.put(event.getName(), event.getInfo());
                this._events.remove(event.getName());
            }
        }

        public ServiceInfo[] list(long timeout) {
            if (this._infos.isEmpty() || !this._events.isEmpty() || this._needToWaitForInfos) {
                long loops = timeout / 200;
                if (loops < 1) {
                    loops = 1;
                }
                for (int i = 0; i < loops; i++) {
                    try {
                        Thread.sleep(200L);
                    } catch (InterruptedException e) {
                    }
                    if (this._events.isEmpty() && !this._infos.isEmpty() && !this._needToWaitForInfos) {
                        break;
                    }
                }
            }
            this._needToWaitForInfos = false;
            return (ServiceInfo[]) this._infos.values().toArray(new ServiceInfo[this._infos.size()]);
        }

        public String toString() {
            StringBuffer aLog = new StringBuffer();
            aLog.append("\n\tType: ");
            aLog.append(this._type);
            if (this._infos.isEmpty()) {
                aLog.append("\n\tNo services collected.");
            } else {
                aLog.append("\n\tServices");
                for (String key : this._infos.keySet()) {
                    aLog.append("\n\t\tService: ");
                    aLog.append(key);
                    aLog.append(": ");
                    aLog.append(this._infos.get(key));
                }
            }
            if (this._events.isEmpty()) {
                aLog.append("\n\tNo event queued.");
            } else {
                aLog.append("\n\tEvents");
                for (String key2 : this._events.keySet()) {
                    aLog.append("\n\t\tEvent: ");
                    aLog.append(key2);
                    aLog.append(": ");
                    aLog.append(this._events.get(key2));
                }
            }
            return aLog.toString();
        }
    }

    static String toUnqualifiedName(String type, String qualifiedName) {
        String loType = type.toLowerCase();
        String loQualifiedName = qualifiedName.toLowerCase();
        if (loQualifiedName.endsWith(loType) && !loQualifiedName.equals(loType)) {
            return qualifiedName.substring(0, (qualifiedName.length() - type.length()) - 1);
        }
        return qualifiedName;
    }

    public Map<String, ServiceInfo> getServices() {
        return this._services;
    }

    public void setLastThrottleIncrement(long lastThrottleIncrement) {
        this._lastThrottleIncrement = lastThrottleIncrement;
    }

    public long getLastThrottleIncrement() {
        return this._lastThrottleIncrement;
    }

    public void setThrottle(int throttle) {
        this._throttle = throttle;
    }

    public int getThrottle() {
        return this._throttle;
    }

    public static Random getRandom() {
        return _random;
    }

    public void ioLock() {
        this._ioLock.lock();
    }

    public void ioUnlock() {
        this._ioLock.unlock();
    }

    public void setPlannedAnswer(DNSIncoming plannedAnswer) {
        this._plannedAnswer = plannedAnswer;
    }

    public DNSIncoming getPlannedAnswer() {
        return this._plannedAnswer;
    }

    void setLocalHost(HostInfo localHost) {
        this._localHost = localHost;
    }

    public Map<String, ServiceTypeEntry> getServiceTypes() {
        return this._serviceTypes;
    }

    public MulticastSocket getSocket() {
        return this._socket;
    }

    public InetAddress getGroup() {
        return this._group;
    }

    @Override // javax.jmdns.JmDNS
    public JmDNS.Delegate getDelegate() {
        return this._delegate;
    }

    @Override // javax.jmdns.JmDNS
    public JmDNS.Delegate setDelegate(JmDNS.Delegate delegate) {
        JmDNS.Delegate previous = this._delegate;
        this._delegate = delegate;
        return previous;
    }
}
