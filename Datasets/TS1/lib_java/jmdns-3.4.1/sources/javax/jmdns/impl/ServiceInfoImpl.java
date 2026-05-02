package javax.jmdns.impl;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.logging.Logger;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceInfo;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.DNSStatefulObject;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;
import javax.jmdns.impl.constants.DNSState;
import javax.jmdns.impl.tasks.DNSTask;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ServiceInfoImpl.class */
public class ServiceInfoImpl extends ServiceInfo implements DNSListener, DNSStatefulObject {
    private static Logger logger = Logger.getLogger(ServiceInfoImpl.class.getName());
    private String _domain;
    private String _protocol;
    private String _application;
    private String _name;
    private String _subtype;
    private String _server;
    private int _port;
    private int _weight;
    private int _priority;
    private byte[] _text;
    private Map<String, byte[]> _props;
    private final Set<Inet4Address> _ipv4Addresses;
    private final Set<Inet6Address> _ipv6Addresses;
    private transient String _key;
    private boolean _persistent;
    private boolean _needTextAnnouncing;
    private final ServiceInfoState _state;
    private Delegate _delegate;

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ServiceInfoImpl$Delegate.class */
    public interface Delegate {
        void textValueUpdated(ServiceInfo serviceInfo, byte[] bArr);
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ServiceInfoImpl$ServiceInfoState.class */
    private static final class ServiceInfoState extends DNSStatefulObject.DefaultImplementation {
        private static final long serialVersionUID = 1104131034952196820L;
        private final ServiceInfoImpl _info;

        public ServiceInfoState(ServiceInfoImpl info) {
            this._info = info;
        }

        @Override // javax.jmdns.impl.DNSStatefulObject.DefaultImplementation
        protected void setTask(DNSTask task) {
            super.setTask(task);
            if (this._task == null && this._info.needTextAnnouncing()) {
                lock();
                try {
                    if (this._task == null && this._info.needTextAnnouncing()) {
                        if (this._state.isAnnounced()) {
                            setState(DNSState.ANNOUNCING_1);
                            if (getDns() != null) {
                                getDns().startAnnouncer();
                            }
                        }
                        this._info.setNeedTextAnnouncing(false);
                    }
                } finally {
                    unlock();
                }
            }
        }

        @Override // javax.jmdns.impl.DNSStatefulObject.DefaultImplementation
        public void setDns(JmDNSImpl dns) {
            super.setDns(dns);
        }
    }

    public ServiceInfoImpl(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, String text) {
        this(decodeQualifiedNameMap(type, name, subtype), port, weight, priority, persistent, (byte[]) null);
        this._server = text;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(text.length());
            writeUTF(out, text);
            this._text = out.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException("unexpected exception: " + e);
        }
    }

    public ServiceInfoImpl(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, Map<String, ?> props) {
        this(decodeQualifiedNameMap(type, name, subtype), port, weight, priority, persistent, textFromProperties(props));
    }

    public ServiceInfoImpl(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, byte[] text) {
        this(decodeQualifiedNameMap(type, name, subtype), port, weight, priority, persistent, text);
    }

    public ServiceInfoImpl(Map<ServiceInfo.Fields, String> qualifiedNameMap, int port, int weight, int priority, boolean persistent, Map<String, ?> props) {
        this(qualifiedNameMap, port, weight, priority, persistent, textFromProperties(props));
    }

    ServiceInfoImpl(Map<ServiceInfo.Fields, String> qualifiedNameMap, int port, int weight, int priority, boolean persistent, String text) {
        this(qualifiedNameMap, port, weight, priority, persistent, (byte[]) null);
        this._server = text;
        try {
            ByteArrayOutputStream out = new ByteArrayOutputStream(text.length());
            writeUTF(out, text);
            this._text = out.toByteArray();
        } catch (IOException e) {
            throw new RuntimeException("unexpected exception: " + e);
        }
    }

    ServiceInfoImpl(Map<ServiceInfo.Fields, String> qualifiedNameMap, int port, int weight, int priority, boolean persistent, byte[] text) {
        Map<ServiceInfo.Fields, String> map = checkQualifiedNameMap(qualifiedNameMap);
        this._domain = map.get(ServiceInfo.Fields.Domain);
        this._protocol = map.get(ServiceInfo.Fields.Protocol);
        this._application = map.get(ServiceInfo.Fields.Application);
        this._name = map.get(ServiceInfo.Fields.Instance);
        this._subtype = map.get(ServiceInfo.Fields.Subtype);
        this._port = port;
        this._weight = weight;
        this._priority = priority;
        this._text = text;
        setNeedTextAnnouncing(false);
        this._state = new ServiceInfoState(this);
        this._persistent = persistent;
        this._ipv4Addresses = Collections.synchronizedSet(new LinkedHashSet());
        this._ipv6Addresses = Collections.synchronizedSet(new LinkedHashSet());
    }

    ServiceInfoImpl(ServiceInfo info) {
        this._ipv4Addresses = Collections.synchronizedSet(new LinkedHashSet());
        this._ipv6Addresses = Collections.synchronizedSet(new LinkedHashSet());
        if (info != null) {
            this._domain = info.getDomain();
            this._protocol = info.getProtocol();
            this._application = info.getApplication();
            this._name = info.getName();
            this._subtype = info.getSubtype();
            this._port = info.getPort();
            this._weight = info.getWeight();
            this._priority = info.getPriority();
            this._text = info.getTextBytes();
            this._persistent = info.isPersistent();
            Inet6Address[] ipv6Addresses = info.getInet6Addresses();
            for (Inet6Address address : ipv6Addresses) {
                this._ipv6Addresses.add(address);
            }
            Inet4Address[] ipv4Addresses = info.getInet4Addresses();
            for (Inet4Address address2 : ipv4Addresses) {
                this._ipv4Addresses.add(address2);
            }
        }
        this._state = new ServiceInfoState(this);
    }

    public static Map<ServiceInfo.Fields, String> decodeQualifiedNameMap(String type, String name, String subtype) {
        Map<ServiceInfo.Fields, String> qualifiedNameMap = decodeQualifiedNameMapForType(type);
        qualifiedNameMap.put(ServiceInfo.Fields.Instance, name);
        qualifiedNameMap.put(ServiceInfo.Fields.Subtype, subtype);
        return checkQualifiedNameMap(qualifiedNameMap);
    }

    public static Map<ServiceInfo.Fields, String> decodeQualifiedNameMapForType(String type) {
        int index;
        String casePreservedType = type;
        String aType = type.toLowerCase();
        String application = aType;
        String protocol = "";
        String subtype = "";
        String name = "";
        String domain = "";
        if (aType.contains("in-addr.arpa") || aType.contains("ip6.arpa")) {
            int index2 = aType.contains("in-addr.arpa") ? aType.indexOf("in-addr.arpa") : aType.indexOf("ip6.arpa");
            name = removeSeparators(casePreservedType.substring(0, index2));
            domain = casePreservedType.substring(index2);
            application = "";
        } else if (!aType.contains("_") && aType.contains(".")) {
            int index3 = aType.indexOf(46);
            name = removeSeparators(casePreservedType.substring(0, index3));
            domain = removeSeparators(casePreservedType.substring(index3));
            application = "";
        } else {
            if ((!aType.startsWith("_") || aType.startsWith("_services")) && (index = aType.indexOf(46)) > 0) {
                name = casePreservedType.substring(0, index);
                if (index + 1 < aType.length()) {
                    aType = aType.substring(index + 1);
                    casePreservedType = casePreservedType.substring(index + 1);
                }
            }
            int index4 = aType.lastIndexOf("._");
            if (index4 > 0) {
                int start = index4 + 2;
                int end = aType.indexOf(46, start);
                protocol = casePreservedType.substring(start, end);
            }
            if (protocol.length() > 0) {
                int index5 = aType.indexOf("_" + protocol.toLowerCase() + ".");
                int start2 = index5 + protocol.length() + 2;
                int end2 = aType.length() - (aType.endsWith(".") ? 1 : 0);
                domain = casePreservedType.substring(start2, end2);
                application = casePreservedType.substring(0, index5 - 1);
            }
            int index6 = application.toLowerCase().indexOf("._sub");
            if (index6 > 0) {
                int start3 = index6 + 5;
                subtype = removeSeparators(application.substring(0, index6));
                application = application.substring(start3);
            }
        }
        Map<ServiceInfo.Fields, String> qualifiedNameMap = new HashMap<>(5);
        qualifiedNameMap.put(ServiceInfo.Fields.Domain, removeSeparators(domain));
        qualifiedNameMap.put(ServiceInfo.Fields.Protocol, protocol);
        qualifiedNameMap.put(ServiceInfo.Fields.Application, removeSeparators(application));
        qualifiedNameMap.put(ServiceInfo.Fields.Instance, name);
        qualifiedNameMap.put(ServiceInfo.Fields.Subtype, subtype);
        return qualifiedNameMap;
    }

    protected static Map<ServiceInfo.Fields, String> checkQualifiedNameMap(Map<ServiceInfo.Fields, String> qualifiedNameMap) {
        Map<ServiceInfo.Fields, String> checkedQualifiedNameMap = new HashMap<>(5);
        String domain = qualifiedNameMap.containsKey(ServiceInfo.Fields.Domain) ? qualifiedNameMap.get(ServiceInfo.Fields.Domain) : "local";
        if (domain == null || domain.length() == 0) {
            domain = "local";
        }
        checkedQualifiedNameMap.put(ServiceInfo.Fields.Domain, removeSeparators(domain));
        String protocol = qualifiedNameMap.containsKey(ServiceInfo.Fields.Protocol) ? qualifiedNameMap.get(ServiceInfo.Fields.Protocol) : "tcp";
        if (protocol == null || protocol.length() == 0) {
            protocol = "tcp";
        }
        checkedQualifiedNameMap.put(ServiceInfo.Fields.Protocol, removeSeparators(protocol));
        String application = qualifiedNameMap.containsKey(ServiceInfo.Fields.Application) ? qualifiedNameMap.get(ServiceInfo.Fields.Application) : "";
        if (application == null || application.length() == 0) {
            application = "";
        }
        checkedQualifiedNameMap.put(ServiceInfo.Fields.Application, removeSeparators(application));
        String instance = qualifiedNameMap.containsKey(ServiceInfo.Fields.Instance) ? qualifiedNameMap.get(ServiceInfo.Fields.Instance) : "";
        if (instance == null || instance.length() == 0) {
            instance = "";
        }
        checkedQualifiedNameMap.put(ServiceInfo.Fields.Instance, removeSeparators(instance));
        String subtype = qualifiedNameMap.containsKey(ServiceInfo.Fields.Subtype) ? qualifiedNameMap.get(ServiceInfo.Fields.Subtype) : "";
        if (subtype == null || subtype.length() == 0) {
            subtype = "";
        }
        checkedQualifiedNameMap.put(ServiceInfo.Fields.Subtype, removeSeparators(subtype));
        return checkedQualifiedNameMap;
    }

    private static String removeSeparators(String name) {
        if (name == null) {
            return "";
        }
        String newName = name.trim();
        if (newName.startsWith(".")) {
            newName = newName.substring(1);
        }
        if (newName.startsWith("_")) {
            newName = newName.substring(1);
        }
        if (newName.endsWith(".")) {
            newName = newName.substring(0, newName.length() - 1);
        }
        return newName;
    }

    @Override // javax.jmdns.ServiceInfo
    public String getType() {
        String domain = getDomain();
        String protocol = getProtocol();
        String application = getApplication();
        return (application.length() > 0 ? "_" + application + "." : "") + (protocol.length() > 0 ? "_" + protocol + "." : "") + domain + ".";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getTypeWithSubtype() {
        String subtype = getSubtype();
        return (subtype.length() > 0 ? "_" + subtype.toLowerCase() + "._sub." : "") + getType();
    }

    @Override // javax.jmdns.ServiceInfo
    public String getName() {
        return this._name != null ? this._name : "";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getKey() {
        if (this._key == null) {
            this._key = getQualifiedName().toLowerCase();
        }
        return this._key;
    }

    void setName(String name) {
        this._name = name;
        this._key = null;
    }

    @Override // javax.jmdns.ServiceInfo
    public String getQualifiedName() {
        String domain = getDomain();
        String protocol = getProtocol();
        String application = getApplication();
        String instance = getName();
        return (instance.length() > 0 ? instance + "." : "") + (application.length() > 0 ? "_" + application + "." : "") + (protocol.length() > 0 ? "_" + protocol + "." : "") + domain + ".";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getServer() {
        return this._server != null ? this._server : "";
    }

    void setServer(String server) {
        this._server = server;
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public String getHostAddress() {
        String[] names = getHostAddresses();
        return names.length > 0 ? names[0] : "";
    }

    @Override // javax.jmdns.ServiceInfo
    public String[] getHostAddresses() {
        Inet4Address[] ip4Aaddresses = getInet4Addresses();
        Inet6Address[] ip6Aaddresses = getInet6Addresses();
        String[] names = new String[ip4Aaddresses.length + ip6Aaddresses.length];
        for (int i = 0; i < ip4Aaddresses.length; i++) {
            names[i] = ip4Aaddresses[i].getHostAddress();
        }
        for (int i2 = 0; i2 < ip6Aaddresses.length; i2++) {
            names[i2 + ip4Aaddresses.length] = "[" + ip6Aaddresses[i2].getHostAddress() + "]";
        }
        return names;
    }

    void addAddress(Inet4Address addr) {
        this._ipv4Addresses.add(addr);
    }

    void addAddress(Inet6Address addr) {
        this._ipv6Addresses.add(addr);
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public InetAddress getAddress() {
        return getInetAddress();
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public InetAddress getInetAddress() {
        InetAddress[] addresses = getInetAddresses();
        if (addresses.length > 0) {
            return addresses[0];
        }
        return null;
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public Inet4Address getInet4Address() {
        Inet4Address[] addresses = getInet4Addresses();
        if (addresses.length > 0) {
            return addresses[0];
        }
        return null;
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public Inet6Address getInet6Address() {
        Inet6Address[] addresses = getInet6Addresses();
        if (addresses.length > 0) {
            return addresses[0];
        }
        return null;
    }

    @Override // javax.jmdns.ServiceInfo
    public InetAddress[] getInetAddresses() {
        List<InetAddress> aList = new ArrayList<>(this._ipv4Addresses.size() + this._ipv6Addresses.size());
        aList.addAll(this._ipv4Addresses);
        aList.addAll(this._ipv6Addresses);
        return (InetAddress[]) aList.toArray(new InetAddress[aList.size()]);
    }

    @Override // javax.jmdns.ServiceInfo
    public Inet4Address[] getInet4Addresses() {
        return (Inet4Address[]) this._ipv4Addresses.toArray(new Inet4Address[this._ipv4Addresses.size()]);
    }

    @Override // javax.jmdns.ServiceInfo
    public Inet6Address[] getInet6Addresses() {
        return (Inet6Address[]) this._ipv6Addresses.toArray(new Inet6Address[this._ipv6Addresses.size()]);
    }

    @Override // javax.jmdns.ServiceInfo
    public int getPort() {
        return this._port;
    }

    @Override // javax.jmdns.ServiceInfo
    public int getPriority() {
        return this._priority;
    }

    @Override // javax.jmdns.ServiceInfo
    public int getWeight() {
        return this._weight;
    }

    @Override // javax.jmdns.ServiceInfo
    public byte[] getTextBytes() {
        return (this._text == null || this._text.length <= 0) ? DNSRecord.EMPTY_TXT : this._text;
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public String getTextString() {
        Map<String, byte[]> properties = getProperties();
        Iterator i$ = properties.keySet().iterator();
        if (i$.hasNext()) {
            String key = i$.next();
            byte[] value = properties.get(key);
            if (value != null && value.length > 0) {
                return key + "=" + new String(value);
            }
            return key;
        }
        return "";
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public String getURL() {
        return getURL("http");
    }

    @Override // javax.jmdns.ServiceInfo
    public String[] getURLs() {
        return getURLs("http");
    }

    @Override // javax.jmdns.ServiceInfo
    @Deprecated
    public String getURL(String protocol) {
        String[] urls = getURLs(protocol);
        return urls.length > 0 ? urls[0] : protocol + "://null:" + getPort();
    }

    @Override // javax.jmdns.ServiceInfo
    public String[] getURLs(String protocol) {
        InetAddress[] addresses = getInetAddresses();
        String[] urls = new String[addresses.length];
        for (int i = 0; i < addresses.length; i++) {
            String url = protocol + "://" + addresses[i].getHostAddress() + ":" + getPort();
            String path = getPropertyString("path");
            if (path != null) {
                if (path.indexOf("://") >= 0) {
                    url = path;
                } else {
                    url = url + (path.startsWith("/") ? path : "/" + path);
                }
            }
            urls[i] = url;
        }
        return urls;
    }

    @Override // javax.jmdns.ServiceInfo
    public synchronized byte[] getPropertyBytes(String name) {
        return getProperties().get(name);
    }

    @Override // javax.jmdns.ServiceInfo
    public synchronized String getPropertyString(String name) {
        byte[] data = getProperties().get(name);
        if (data == null) {
            return null;
        }
        if (data == NO_VALUE) {
            return "true";
        }
        return readUTF(data, 0, data.length);
    }

    @Override // javax.jmdns.ServiceInfo
    public Enumeration<String> getPropertyNames() {
        Map<String, byte[]> properties = getProperties();
        Collection<String> names = properties != null ? properties.keySet() : Collections.emptySet();
        return new Vector(names).elements();
    }

    @Override // javax.jmdns.ServiceInfo
    public String getApplication() {
        return this._application != null ? this._application : "";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getDomain() {
        return this._domain != null ? this._domain : "local";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getProtocol() {
        return this._protocol != null ? this._protocol : "tcp";
    }

    @Override // javax.jmdns.ServiceInfo
    public String getSubtype() {
        return this._subtype != null ? this._subtype : "";
    }

    @Override // javax.jmdns.ServiceInfo
    public Map<ServiceInfo.Fields, String> getQualifiedNameMap() {
        Map<ServiceInfo.Fields, String> map = new HashMap<>(5);
        map.put(ServiceInfo.Fields.Domain, getDomain());
        map.put(ServiceInfo.Fields.Protocol, getProtocol());
        map.put(ServiceInfo.Fields.Application, getApplication());
        map.put(ServiceInfo.Fields.Instance, getName());
        map.put(ServiceInfo.Fields.Subtype, getSubtype());
        return map;
    }

    static void writeUTF(OutputStream out, String str) throws IOException {
        int len = str.length();
        for (int i = 0; i < len; i++) {
            int c = str.charAt(i);
            if (c >= 1 && c <= 127) {
                out.write(c);
            } else if (c > 2047) {
                out.write(224 | ((c >> 12) & 15));
                out.write(128 | ((c >> 6) & 63));
                out.write(128 | ((c >> 0) & 63));
            } else {
                out.write(192 | ((c >> 6) & 31));
                out.write(128 | ((c >> 0) & 63));
            }
        }
    }

    String readUTF(byte[] data, int off, int len) {
        int offset = off;
        StringBuffer buf = new StringBuffer();
        int end = offset + len;
        while (offset < end) {
            int i = offset;
            offset++;
            int ch = data[i] & 255;
            switch (ch >> 4) {
                case 0:
                case 1:
                case 2:
                case 3:
                case 4:
                case 5:
                case 6:
                case 7:
                    break;
                case 8:
                case 9:
                case DNSConstants.PROBE_THROTTLE_COUNT /* 10 */:
                case 11:
                default:
                    if (offset + 1 >= len) {
                        return null;
                    }
                    offset++;
                    ch = ((ch & 63) << 4) | (data[offset] & 15);
                    break;
                case 12:
                case 13:
                    if (offset >= len) {
                        return null;
                    }
                    offset++;
                    ch = ((ch & 31) << 6) | (data[offset] & 63);
                    break;
                case 14:
                    if (offset + 2 >= len) {
                        return null;
                    }
                    int offset2 = offset + 1;
                    int i2 = ((ch & 15) << 12) | ((data[offset] & 63) << 6);
                    offset = offset2 + 1;
                    ch = i2 | (data[offset2] & 63);
                    break;
            }
            buf.append((char) ch);
        }
        return buf.toString();
    }

    /* JADX WARN: Code restructure failed: missing block: B:14:0x003e, code lost:
    
        r0.clear();
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    synchronized java.util.Map<java.lang.String, byte[]> getProperties() {
        /*
            Method dump skipped, instructions count: 226
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: javax.jmdns.impl.ServiceInfoImpl.getProperties():java.util.Map");
    }

    @Override // javax.jmdns.impl.DNSListener
    public void updateRecord(DNSCache dnsCache, long now, DNSEntry rec) {
        JmDNSImpl dns;
        if ((rec instanceof DNSRecord) && !rec.isExpired(now)) {
            boolean serviceUpdated = false;
            switch (rec.getRecordType()) {
                case TYPE_A:
                    if (rec.getName().equalsIgnoreCase(getServer())) {
                        this._ipv4Addresses.add((Inet4Address) ((DNSRecord.Address) rec).getAddress());
                        serviceUpdated = true;
                        break;
                    }
                    break;
                case TYPE_AAAA:
                    if (rec.getName().equalsIgnoreCase(getServer())) {
                        this._ipv6Addresses.add((Inet6Address) ((DNSRecord.Address) rec).getAddress());
                        serviceUpdated = true;
                        break;
                    }
                    break;
                case TYPE_SRV:
                    if (rec.getName().equalsIgnoreCase(getQualifiedName())) {
                        DNSRecord.Service srv = (DNSRecord.Service) rec;
                        boolean serverChanged = this._server == null || !this._server.equalsIgnoreCase(srv.getServer());
                        this._server = srv.getServer();
                        this._port = srv.getPort();
                        this._weight = srv.getWeight();
                        this._priority = srv.getPriority();
                        if (serverChanged) {
                            this._ipv4Addresses.clear();
                            this._ipv6Addresses.clear();
                            for (DNSEntry entry : dnsCache.getDNSEntryList(this._server, DNSRecordType.TYPE_A, DNSRecordClass.CLASS_IN)) {
                                updateRecord(dnsCache, now, entry);
                            }
                            for (DNSEntry entry2 : dnsCache.getDNSEntryList(this._server, DNSRecordType.TYPE_AAAA, DNSRecordClass.CLASS_IN)) {
                                updateRecord(dnsCache, now, entry2);
                            }
                            break;
                        } else {
                            serviceUpdated = true;
                            break;
                        }
                    }
                    break;
                case TYPE_TXT:
                    if (rec.getName().equalsIgnoreCase(getQualifiedName())) {
                        DNSRecord.Text txt = (DNSRecord.Text) rec;
                        this._text = txt.getText();
                        serviceUpdated = true;
                        break;
                    }
                    break;
                case TYPE_PTR:
                    if (getSubtype().length() == 0 && rec.getSubtype().length() != 0) {
                        this._subtype = rec.getSubtype();
                        serviceUpdated = true;
                        break;
                    }
                    break;
            }
            if (serviceUpdated && hasData() && (dns = getDns()) != null) {
                ServiceEvent event = ((DNSRecord) rec).getServiceEvent(dns);
                dns.handleServiceResolved(new ServiceEventImpl(dns, event.getType(), event.getName(), this));
            }
            synchronized (this) {
                notifyAll();
            }
        }
    }

    @Override // javax.jmdns.ServiceInfo
    public synchronized boolean hasData() {
        return getServer() != null && hasInetAddress() && getTextBytes() != null && getTextBytes().length > 0;
    }

    private final boolean hasInetAddress() {
        return this._ipv4Addresses.size() > 0 || this._ipv6Addresses.size() > 0;
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean advanceState(DNSTask task) {
        return this._state.advanceState(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean revertState() {
        return this._state.revertState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean cancelState() {
        return this._state.cancelState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean closeState() {
        return this._state.closeState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean recoverState() {
        return this._state.recoverState();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public void removeAssociationWithTask(DNSTask task) {
        this._state.removeAssociationWithTask(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public void associateWithTask(DNSTask task, DNSState state) {
        this._state.associateWithTask(task, state);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAssociatedWithTask(DNSTask task, DNSState state) {
        return this._state.isAssociatedWithTask(task, state);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isProbing() {
        return this._state.isProbing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAnnouncing() {
        return this._state.isAnnouncing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isAnnounced() {
        return this._state.isAnnounced();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isCanceling() {
        return this._state.isCanceling();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isCanceled() {
        return this._state.isCanceled();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isClosing() {
        return this._state.isClosing();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean isClosed() {
        return this._state.isClosed();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean waitForAnnounced(long timeout) {
        return this._state.waitForAnnounced(timeout);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean waitForCanceled(long timeout) {
        return this._state.waitForCanceled(timeout);
    }

    public int hashCode() {
        return getQualifiedName().hashCode();
    }

    public boolean equals(Object obj) {
        return (obj instanceof ServiceInfoImpl) && getQualifiedName().equals(((ServiceInfoImpl) obj).getQualifiedName());
    }

    @Override // javax.jmdns.ServiceInfo
    public String getNiceTextString() {
        StringBuffer buf = new StringBuffer();
        int i = 0;
        int len = getTextBytes().length;
        while (true) {
            if (i >= len) {
                break;
            }
            if (i >= 200) {
                buf.append("...");
                break;
            }
            int ch = getTextBytes()[i] & 255;
            if (ch < 32 || ch > 127) {
                buf.append("\\0");
                buf.append(Integer.toString(ch, 8));
            } else {
                buf.append((char) ch);
            }
            i++;
        }
        return buf.toString();
    }

    @Override // javax.jmdns.ServiceInfo
    /* renamed from: clone */
    public ServiceInfoImpl mo4clone() {
        ServiceInfoImpl serviceInfo = new ServiceInfoImpl(getQualifiedNameMap(), this._port, this._weight, this._priority, this._persistent, this._text);
        Inet6Address[] ipv6Addresses = getInet6Addresses();
        for (Inet6Address address : ipv6Addresses) {
            serviceInfo._ipv6Addresses.add(address);
        }
        Inet4Address[] ipv4Addresses = getInet4Addresses();
        for (Inet4Address address2 : ipv4Addresses) {
            serviceInfo._ipv4Addresses.add(address2);
        }
        return serviceInfo;
    }

    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("[" + getClass().getSimpleName() + "@" + System.identityHashCode(this) + " ");
        buf.append("name: '");
        buf.append((getName().length() > 0 ? getName() + "." : "") + getTypeWithSubtype());
        buf.append("' address: '");
        InetAddress[] addresses = getInetAddresses();
        if (addresses.length > 0) {
            for (InetAddress address : addresses) {
                buf.append(address);
                buf.append(':');
                buf.append(getPort());
                buf.append(' ');
            }
        } else {
            buf.append("(null):");
            buf.append(getPort());
        }
        buf.append("' status: '");
        buf.append(this._state.toString());
        buf.append(isPersistent() ? "' is persistent," : "',");
        buf.append(" has ");
        buf.append(hasData() ? "" : "NO ");
        buf.append("data");
        if (getTextBytes().length > 0) {
            Map<String, byte[]> properties = getProperties();
            if (!properties.isEmpty()) {
                buf.append("\n");
                for (String key : properties.keySet()) {
                    buf.append("\t" + key + ": " + new String(properties.get(key)) + "\n");
                }
            } else {
                buf.append(" empty");
            }
        }
        buf.append(']');
        return buf.toString();
    }

    public Collection<DNSRecord> answers(boolean unique, int ttl, HostInfo localHost) {
        List<DNSRecord> list = new ArrayList<>();
        if (getSubtype().length() > 0) {
            list.add(new DNSRecord.Pointer(getTypeWithSubtype(), DNSRecordClass.CLASS_IN, false, ttl, getQualifiedName()));
        }
        list.add(new DNSRecord.Pointer(getType(), DNSRecordClass.CLASS_IN, false, ttl, getQualifiedName()));
        list.add(new DNSRecord.Service(getQualifiedName(), DNSRecordClass.CLASS_IN, unique, ttl, this._priority, this._weight, this._port, localHost.getName()));
        list.add(new DNSRecord.Text(getQualifiedName(), DNSRecordClass.CLASS_IN, unique, ttl, getTextBytes()));
        return list;
    }

    @Override // javax.jmdns.ServiceInfo
    public void setText(byte[] text) throws IllegalStateException {
        synchronized (this) {
            this._text = text;
            this._props = null;
            setNeedTextAnnouncing(true);
        }
    }

    @Override // javax.jmdns.ServiceInfo
    public void setText(Map<String, ?> props) throws IllegalStateException {
        setText(textFromProperties(props));
    }

    void _setText(byte[] text) {
        this._text = text;
        this._props = null;
    }

    private static byte[] textFromProperties(Map<String, ?> props) {
        byte[] text = null;
        if (props != null) {
            try {
                ByteArrayOutputStream out = new ByteArrayOutputStream(DNSConstants.FLAGS_RD);
                for (String key : props.keySet()) {
                    Object val = props.get(key);
                    ByteArrayOutputStream out2 = new ByteArrayOutputStream(100);
                    writeUTF(out2, key);
                    if (val != null) {
                        if (val instanceof String) {
                            out2.write(61);
                            writeUTF(out2, (String) val);
                        } else if (val instanceof byte[]) {
                            byte[] bval = (byte[]) val;
                            if (bval.length > 0) {
                                out2.write(61);
                                out2.write(bval, 0, bval.length);
                            } else {
                                val = null;
                            }
                        } else {
                            throw new IllegalArgumentException("invalid property value: " + val);
                        }
                    }
                    byte[] data = out2.toByteArray();
                    if (data.length > 255) {
                        throw new IOException("Cannot have individual values larger that 255 chars. Offending value: " + key + (val != null ? "" : "=" + val));
                    }
                    out.write((byte) data.length);
                    out.write(data, 0, data.length);
                }
                text = out.toByteArray();
            } catch (IOException e) {
                throw new RuntimeException("unexpected exception: " + e);
            }
        }
        return (text == null || text.length <= 0) ? DNSRecord.EMPTY_TXT : text;
    }

    public void setDns(JmDNSImpl dns) {
        this._state.setDns(dns);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public JmDNSImpl getDns() {
        return this._state.getDns();
    }

    @Override // javax.jmdns.ServiceInfo
    public boolean isPersistent() {
        return this._persistent;
    }

    public void setNeedTextAnnouncing(boolean needTextAnnouncing) {
        this._needTextAnnouncing = needTextAnnouncing;
        if (this._needTextAnnouncing) {
            this._state.setTask(null);
        }
    }

    public boolean needTextAnnouncing() {
        return this._needTextAnnouncing;
    }

    Delegate getDelegate() {
        return this._delegate;
    }

    void setDelegate(Delegate delegate) {
        this._delegate = delegate;
    }
}
