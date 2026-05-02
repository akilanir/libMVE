package javax.jmdns.impl;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceInfo;
import javax.jmdns.impl.DNSOutgoing;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord.class */
public abstract class DNSRecord extends DNSEntry {
    private int _ttl;
    private long _created;
    private InetAddress _source;
    private static Logger logger = Logger.getLogger(DNSRecord.class.getName());
    public static final byte[] EMPTY_TXT = {0};

    abstract boolean sameValue(DNSRecord dNSRecord);

    abstract boolean handleQuery(JmDNSImpl jmDNSImpl, long j);

    abstract boolean handleResponse(JmDNSImpl jmDNSImpl);

    abstract DNSOutgoing addAnswer(JmDNSImpl jmDNSImpl, DNSIncoming dNSIncoming, InetAddress inetAddress, int i, DNSOutgoing dNSOutgoing) throws IOException;

    abstract void write(DNSOutgoing.MessageOutputStream messageOutputStream);

    public abstract boolean isSingleValued();

    public abstract ServiceInfo getServiceInfo(boolean z);

    public abstract ServiceEvent getServiceEvent(JmDNSImpl jmDNSImpl);

    DNSRecord(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique, int ttl) {
        super(name, type, recordClass, unique);
        this._ttl = ttl;
        this._created = System.currentTimeMillis();
    }

    @Override // javax.jmdns.impl.DNSEntry
    public boolean equals(Object other) {
        return (other instanceof DNSRecord) && super.equals(other) && sameValue((DNSRecord) other);
    }

    boolean sameType(DNSRecord other) {
        return getRecordType() == other.getRecordType();
    }

    boolean suppressedBy(DNSIncoming msg) {
        try {
            for (DNSRecord answer : msg.getAllAnswers()) {
                if (suppressedBy(answer)) {
                    return true;
                }
            }
            return false;
        } catch (ArrayIndexOutOfBoundsException e) {
            logger.log(Level.WARNING, "suppressedBy() message " + msg + " exception ", (Throwable) e);
            return false;
        }
    }

    boolean suppressedBy(DNSRecord other) {
        if (equals(other) && other._ttl > this._ttl / 2) {
            return true;
        }
        return false;
    }

    long getExpirationTime(int percent) {
        return this._created + (percent * this._ttl * 10);
    }

    int getRemainingTTL(long now) {
        return (int) Math.max(0L, (getExpirationTime(100) - now) / 1000);
    }

    @Override // javax.jmdns.impl.DNSEntry
    public boolean isExpired(long now) {
        return getExpirationTime(100) <= now;
    }

    @Override // javax.jmdns.impl.DNSEntry
    public boolean isStale(long now) {
        return getExpirationTime(50) <= now;
    }

    void resetTTL(DNSRecord other) {
        this._created = other._created;
        this._ttl = other._ttl;
    }

    void setWillExpireSoon(long now) {
        this._created = now;
        this._ttl = 1;
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$IPv4Address.class */
    public static class IPv4Address extends Address {
        IPv4Address(String name, DNSRecordClass recordClass, boolean unique, int ttl, InetAddress addr) {
            super(name, DNSRecordType.TYPE_A, recordClass, unique, ttl, addr);
        }

        IPv4Address(String name, DNSRecordClass recordClass, boolean unique, int ttl, byte[] rawAddress) {
            super(name, DNSRecordType.TYPE_A, recordClass, unique, ttl, rawAddress);
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            if (this._addr != null) {
                byte[] buffer = this._addr.getAddress();
                if (!(this._addr instanceof Inet4Address)) {
                    buffer = new byte[4];
                    System.arraycopy(buffer, 12, buffer, 0, 4);
                }
                int length = buffer.length;
                out.writeBytes(buffer, 0, length);
            }
        }

        @Override // javax.jmdns.impl.DNSRecord.Address, javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            ServiceInfoImpl info = (ServiceInfoImpl) super.getServiceInfo(persistent);
            info.addAddress((Inet4Address) this._addr);
            return info;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$IPv6Address.class */
    public static class IPv6Address extends Address {
        IPv6Address(String name, DNSRecordClass recordClass, boolean unique, int ttl, InetAddress addr) {
            super(name, DNSRecordType.TYPE_AAAA, recordClass, unique, ttl, addr);
        }

        IPv6Address(String name, DNSRecordClass recordClass, boolean unique, int ttl, byte[] rawAddress) {
            super(name, DNSRecordType.TYPE_AAAA, recordClass, unique, ttl, rawAddress);
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            if (this._addr != null) {
                byte[] buffer = this._addr.getAddress();
                if (this._addr instanceof Inet4Address) {
                    buffer = new byte[16];
                    for (int i = 0; i < 16; i++) {
                        if (i < 11) {
                            buffer[i] = buffer[i - 12];
                        } else {
                            buffer[i] = 0;
                        }
                    }
                }
                int length = buffer.length;
                out.writeBytes(buffer, 0, length);
            }
        }

        @Override // javax.jmdns.impl.DNSRecord.Address, javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            ServiceInfoImpl info = (ServiceInfoImpl) super.getServiceInfo(persistent);
            info.addAddress((Inet6Address) this._addr);
            return info;
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$Address.class */
    public static abstract class Address extends DNSRecord {
        private static Logger logger1 = Logger.getLogger(Address.class.getName());
        InetAddress _addr;

        protected Address(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique, int ttl, InetAddress addr) {
            super(name, type, recordClass, unique, ttl);
            this._addr = addr;
        }

        protected Address(String name, DNSRecordType type, DNSRecordClass recordClass, boolean unique, int ttl, byte[] rawAddress) {
            super(name, type, recordClass, unique, ttl);
            try {
                this._addr = InetAddress.getByAddress(rawAddress);
            } catch (UnknownHostException exception) {
                logger1.log(Level.WARNING, "Address() exception ", (Throwable) exception);
            }
        }

        boolean same(DNSRecord other) {
            return (other instanceof Address) && sameName(other) && sameValue(other);
        }

        boolean sameName(DNSRecord other) {
            return getName().equalsIgnoreCase(other.getName());
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean sameValue(DNSRecord other) {
            if (!(other instanceof Address)) {
                return false;
            }
            Address address = (Address) other;
            if (getAddress() == null && address.getAddress() != null) {
                return false;
            }
            return getAddress().equals(address.getAddress());
        }

        @Override // javax.jmdns.impl.DNSRecord
        public boolean isSingleValued() {
            return false;
        }

        InetAddress getAddress() {
            return this._addr;
        }

        @Override // javax.jmdns.impl.DNSEntry
        protected void toByteArray(DataOutputStream dout) throws IOException {
            super.toByteArray(dout);
            byte[] buffer = getAddress().getAddress();
            for (byte b : buffer) {
                dout.writeByte(b);
            }
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleQuery(JmDNSImpl dns, long expirationTime) {
            if (dns.getLocalHost().conflictWithRecord(this)) {
                Address localAddress = dns.getLocalHost().getDNSAddressRecord(getRecordType(), isUnique(), DNSConstants.DNS_TTL);
                int comparison = compareTo(localAddress);
                if (comparison == 0) {
                    logger1.finer("handleQuery() Ignoring an identical address query");
                    return false;
                }
                logger1.finer("handleQuery() Conflicting query detected.");
                if (dns.isProbing() && comparison > 0) {
                    dns.getLocalHost().incrementHostName();
                    dns.getCache().clear();
                    for (ServiceInfo serviceInfo : dns.getServices().values()) {
                        ServiceInfoImpl info = (ServiceInfoImpl) serviceInfo;
                        info.revertState();
                    }
                }
                dns.revertState();
                return true;
            }
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleResponse(JmDNSImpl dns) {
            if (dns.getLocalHost().conflictWithRecord(this)) {
                logger1.finer("handleResponse() Denial detected");
                if (dns.isProbing()) {
                    dns.getLocalHost().incrementHostName();
                    dns.getCache().clear();
                    for (ServiceInfo serviceInfo : dns.getServices().values()) {
                        ServiceInfoImpl info = (ServiceInfoImpl) serviceInfo;
                        info.revertState();
                    }
                }
                dns.revertState();
                return true;
            }
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        DNSOutgoing addAnswer(JmDNSImpl dns, DNSIncoming in, InetAddress addr, int port, DNSOutgoing out) throws IOException {
            return out;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            ServiceInfoImpl info = new ServiceInfoImpl(getQualifiedNameMap(), 0, 0, 0, persistent, (byte[]) null);
            return info;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceEvent getServiceEvent(JmDNSImpl dns) {
            ServiceInfo info = getServiceInfo(false);
            ((ServiceInfoImpl) info).setDns(dns);
            return new ServiceEventImpl(dns, info.getType(), info.getName(), info);
        }

        @Override // javax.jmdns.impl.DNSRecord, javax.jmdns.impl.DNSEntry
        protected void toString(StringBuilder aLog) {
            super.toString(aLog);
            aLog.append(" address: '" + (getAddress() != null ? getAddress().getHostAddress() : "null") + "'");
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$Pointer.class */
    public static class Pointer extends DNSRecord {
        private final String _alias;

        public Pointer(String name, DNSRecordClass recordClass, boolean unique, int ttl, String alias) {
            super(name, DNSRecordType.TYPE_PTR, recordClass, unique, ttl);
            this._alias = alias;
        }

        @Override // javax.jmdns.impl.DNSEntry
        public boolean isSameEntry(DNSEntry entry) {
            return super.isSameEntry(entry) && (entry instanceof Pointer) && sameValue((Pointer) entry);
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            out.writeName(this._alias);
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean sameValue(DNSRecord other) {
            if (!(other instanceof Pointer)) {
                return false;
            }
            Pointer pointer = (Pointer) other;
            if (this._alias == null && pointer._alias != null) {
                return false;
            }
            return this._alias.equals(pointer._alias);
        }

        @Override // javax.jmdns.impl.DNSRecord
        public boolean isSingleValued() {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleQuery(JmDNSImpl dns, long expirationTime) {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleResponse(JmDNSImpl dns) {
            return false;
        }

        String getAlias() {
            return this._alias;
        }

        @Override // javax.jmdns.impl.DNSRecord
        DNSOutgoing addAnswer(JmDNSImpl dns, DNSIncoming in, InetAddress addr, int port, DNSOutgoing out) throws IOException {
            return out;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            if (isServicesDiscoveryMetaQuery()) {
                return new ServiceInfoImpl(ServiceInfoImpl.decodeQualifiedNameMapForType(getAlias()), 0, 0, 0, persistent, (byte[]) null);
            }
            if (isReverseLookup()) {
                return new ServiceInfoImpl(getQualifiedNameMap(), 0, 0, 0, persistent, (byte[]) null);
            }
            if (isDomainDiscoveryQuery()) {
                return new ServiceInfoImpl(getQualifiedNameMap(), 0, 0, 0, persistent, (byte[]) null);
            }
            Map<ServiceInfo.Fields, String> map = ServiceInfoImpl.decodeQualifiedNameMapForType(getAlias());
            map.put(ServiceInfo.Fields.Subtype, getQualifiedNameMap().get(ServiceInfo.Fields.Subtype));
            return new ServiceInfoImpl(map, 0, 0, 0, persistent, getAlias());
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceEvent getServiceEvent(JmDNSImpl dns) {
            ServiceInfo info = getServiceInfo(false);
            ((ServiceInfoImpl) info).setDns(dns);
            String domainName = info.getType();
            String serviceName = JmDNSImpl.toUnqualifiedName(domainName, getAlias());
            return new ServiceEventImpl(dns, domainName, serviceName, info);
        }

        @Override // javax.jmdns.impl.DNSRecord, javax.jmdns.impl.DNSEntry
        protected void toString(StringBuilder aLog) {
            super.toString(aLog);
            aLog.append(" alias: '" + (this._alias != null ? this._alias.toString() : "null") + "'");
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$Text.class */
    public static class Text extends DNSRecord {
        private final byte[] _text;

        public Text(String name, DNSRecordClass recordClass, boolean unique, int ttl, byte[] text) {
            super(name, DNSRecordType.TYPE_TXT, recordClass, unique, ttl);
            this._text = (text == null || text.length <= 0) ? EMPTY_TXT : text;
        }

        byte[] getText() {
            return this._text;
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            out.writeBytes(this._text, 0, this._text.length);
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean sameValue(DNSRecord other) {
            if (!(other instanceof Text)) {
                return false;
            }
            Text txt = (Text) other;
            if ((this._text == null && txt._text != null) || txt._text.length != this._text.length) {
                return false;
            }
            int i = this._text.length;
            do {
                int i2 = i;
                i--;
                if (i2 <= 0) {
                    return true;
                }
            } while (txt._text[i] == this._text[i]);
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public boolean isSingleValued() {
            return true;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleQuery(JmDNSImpl dns, long expirationTime) {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleResponse(JmDNSImpl dns) {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        DNSOutgoing addAnswer(JmDNSImpl dns, DNSIncoming in, InetAddress addr, int port, DNSOutgoing out) throws IOException {
            return out;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            return new ServiceInfoImpl(getQualifiedNameMap(), 0, 0, 0, persistent, this._text);
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceEvent getServiceEvent(JmDNSImpl dns) {
            ServiceInfo info = getServiceInfo(false);
            ((ServiceInfoImpl) info).setDns(dns);
            return new ServiceEventImpl(dns, info.getType(), info.getName(), info);
        }

        @Override // javax.jmdns.impl.DNSRecord, javax.jmdns.impl.DNSEntry
        protected void toString(StringBuilder aLog) {
            super.toString(aLog);
            aLog.append(" text: '" + (this._text.length > 20 ? new String(this._text, 0, 17) + "..." : new String(this._text)) + "'");
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$Service.class */
    public static class Service extends DNSRecord {
        private static Logger logger1 = Logger.getLogger(Service.class.getName());
        private final int _priority;
        private final int _weight;
        private final int _port;
        private final String _server;

        public Service(String name, DNSRecordClass recordClass, boolean unique, int ttl, int priority, int weight, int port, String server) {
            super(name, DNSRecordType.TYPE_SRV, recordClass, unique, ttl);
            this._priority = priority;
            this._weight = weight;
            this._port = port;
            this._server = server;
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            out.writeShort(this._priority);
            out.writeShort(this._weight);
            out.writeShort(this._port);
            if (DNSIncoming.USE_DOMAIN_NAME_FORMAT_FOR_SRV_TARGET) {
                out.writeName(this._server);
            } else {
                out.writeUTF(this._server, 0, this._server.length());
                out.writeByte(0);
            }
        }

        @Override // javax.jmdns.impl.DNSEntry
        protected void toByteArray(DataOutputStream dout) throws IOException {
            super.toByteArray(dout);
            dout.writeShort(this._priority);
            dout.writeShort(this._weight);
            dout.writeShort(this._port);
            try {
                dout.write(this._server.getBytes("UTF-8"));
            } catch (UnsupportedEncodingException e) {
            }
        }

        String getServer() {
            return this._server;
        }

        public int getPriority() {
            return this._priority;
        }

        public int getWeight() {
            return this._weight;
        }

        public int getPort() {
            return this._port;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean sameValue(DNSRecord other) {
            if (!(other instanceof Service)) {
                return false;
            }
            Service s = (Service) other;
            return this._priority == s._priority && this._weight == s._weight && this._port == s._port && this._server.equals(s._server);
        }

        @Override // javax.jmdns.impl.DNSRecord
        public boolean isSingleValued() {
            return true;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleQuery(JmDNSImpl dns, long expirationTime) {
            ServiceInfoImpl info = (ServiceInfoImpl) dns.getServices().get(getKey());
            if (info == null) {
                return false;
            }
            if (!info.isAnnouncing() && !info.isAnnounced()) {
                return false;
            }
            if (this._port != info.getPort() || !this._server.equalsIgnoreCase(dns.getLocalHost().getName())) {
                logger1.finer("handleQuery() Conflicting probe detected from: " + getRecordSource());
                Service localService = new Service(info.getQualifiedName(), DNSRecordClass.CLASS_IN, true, DNSConstants.DNS_TTL, info.getPriority(), info.getWeight(), info.getPort(), dns.getLocalHost().getName());
                try {
                    if (dns.getInterface().equals(getRecordSource())) {
                        logger1.warning("Got conflicting probe from ourselves\nincoming: " + toString() + "\nlocal   : " + localService.toString());
                    }
                } catch (IOException e) {
                    logger1.log(Level.WARNING, "IOException", (Throwable) e);
                }
                int comparison = compareTo(localService);
                if (comparison == 0) {
                    logger1.finer("handleQuery() Ignoring a identical service query");
                    return false;
                }
                if (info.isProbing() && comparison > 0) {
                    String oldName = info.getQualifiedName().toLowerCase();
                    info.setName(dns.incrementName(info.getName()));
                    dns.getServices().remove(oldName);
                    dns.getServices().put(info.getQualifiedName().toLowerCase(), info);
                    logger1.finer("handleQuery() Lost tie break: new unique name chosen:" + info.getName());
                    info.revertState();
                    return true;
                }
                return false;
            }
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleResponse(JmDNSImpl dns) {
            ServiceInfoImpl info = (ServiceInfoImpl) dns.getServices().get(getKey());
            if (info == null) {
                return false;
            }
            if (this._port != info.getPort() || !this._server.equalsIgnoreCase(dns.getLocalHost().getName())) {
                logger1.finer("handleResponse() Denial detected");
                if (info.isProbing()) {
                    String oldName = info.getQualifiedName().toLowerCase();
                    info.setName(dns.incrementName(info.getName()));
                    dns.getServices().remove(oldName);
                    dns.getServices().put(info.getQualifiedName().toLowerCase(), info);
                    logger1.finer("handleResponse() New unique name chose:" + info.getName());
                }
                info.revertState();
                return true;
            }
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        DNSOutgoing addAnswer(JmDNSImpl dns, DNSIncoming in, InetAddress addr, int port, DNSOutgoing out) throws IOException {
            ServiceInfoImpl info = (ServiceInfoImpl) dns.getServices().get(getKey());
            if (info != null) {
                if ((this._port == info.getPort()) != this._server.equals(dns.getLocalHost().getName())) {
                    return dns.addAnswer(in, addr, port, out, new Service(info.getQualifiedName(), DNSRecordClass.CLASS_IN, true, DNSConstants.DNS_TTL, info.getPriority(), info.getWeight(), info.getPort(), dns.getLocalHost().getName()));
                }
            }
            return out;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            return new ServiceInfoImpl(getQualifiedNameMap(), this._port, this._weight, this._priority, persistent, this._server);
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceEvent getServiceEvent(JmDNSImpl dns) {
            ServiceInfo info = getServiceInfo(false);
            ((ServiceInfoImpl) info).setDns(dns);
            return new ServiceEventImpl(dns, info.getType(), info.getName(), info);
        }

        @Override // javax.jmdns.impl.DNSRecord, javax.jmdns.impl.DNSEntry
        protected void toString(StringBuilder aLog) {
            super.toString(aLog);
            aLog.append(" server: '" + this._server + ":" + this._port + "'");
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/DNSRecord$HostInformation.class */
    public static class HostInformation extends DNSRecord {
        String _os;
        String _cpu;

        public HostInformation(String name, DNSRecordClass recordClass, boolean unique, int ttl, String cpu, String os) {
            super(name, DNSRecordType.TYPE_HINFO, recordClass, unique, ttl);
            this._cpu = cpu;
            this._os = os;
        }

        @Override // javax.jmdns.impl.DNSRecord
        DNSOutgoing addAnswer(JmDNSImpl dns, DNSIncoming in, InetAddress addr, int port, DNSOutgoing out) throws IOException {
            return out;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleQuery(JmDNSImpl dns, long expirationTime) {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean handleResponse(JmDNSImpl dns) {
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        boolean sameValue(DNSRecord other) {
            if (!(other instanceof HostInformation)) {
                return false;
            }
            HostInformation hinfo = (HostInformation) other;
            if (this._cpu != null || hinfo._cpu == null) {
                return (this._os != null || hinfo._os == null) && this._cpu.equals(hinfo._cpu) && this._os.equals(hinfo._os);
            }
            return false;
        }

        @Override // javax.jmdns.impl.DNSRecord
        public boolean isSingleValued() {
            return true;
        }

        @Override // javax.jmdns.impl.DNSRecord
        void write(DNSOutgoing.MessageOutputStream out) {
            String hostInfo = this._cpu + " " + this._os;
            out.writeUTF(hostInfo, 0, hostInfo.length());
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceInfo getServiceInfo(boolean persistent) {
            Map<String, String> hinfo = new HashMap<>(2);
            hinfo.put("cpu", this._cpu);
            hinfo.put("os", this._os);
            return new ServiceInfoImpl(getQualifiedNameMap(), 0, 0, 0, persistent, hinfo);
        }

        @Override // javax.jmdns.impl.DNSRecord
        public ServiceEvent getServiceEvent(JmDNSImpl dns) {
            ServiceInfo info = getServiceInfo(false);
            ((ServiceInfoImpl) info).setDns(dns);
            return new ServiceEventImpl(dns, info.getType(), info.getName(), info);
        }

        @Override // javax.jmdns.impl.DNSRecord, javax.jmdns.impl.DNSEntry
        protected void toString(StringBuilder aLog) {
            super.toString(aLog);
            aLog.append(" cpu: '" + this._cpu + "' os: '" + this._os + "'");
        }
    }

    public ServiceInfo getServiceInfo() {
        return getServiceInfo(false);
    }

    public void setRecordSource(InetAddress source) {
        this._source = source;
    }

    public InetAddress getRecordSource() {
        return this._source;
    }

    @Override // javax.jmdns.impl.DNSEntry
    protected void toString(StringBuilder aLog) {
        super.toString(aLog);
        aLog.append(" ttl: '" + getRemainingTTL(System.currentTimeMillis()) + "/" + this._ttl + "'");
    }

    public void setTTL(int ttl) {
        this._ttl = ttl;
    }

    public int getTTL() {
        return this._ttl;
    }
}
