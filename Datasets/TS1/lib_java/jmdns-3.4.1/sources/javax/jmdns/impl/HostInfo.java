package javax.jmdns.impl;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.jmdns.NetworkTopologyDiscovery;
import javax.jmdns.impl.DNSRecord;
import javax.jmdns.impl.DNSStatefulObject;
import javax.jmdns.impl.constants.DNSConstants;
import javax.jmdns.impl.constants.DNSRecordClass;
import javax.jmdns.impl.constants.DNSRecordType;
import javax.jmdns.impl.constants.DNSState;
import javax.jmdns.impl.tasks.DNSTask;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/HostInfo.class */
public class HostInfo implements DNSStatefulObject {
    private static Logger logger = Logger.getLogger(HostInfo.class.getName());
    protected String _name;
    protected InetAddress _address;
    protected NetworkInterface _interfaze;
    private final HostInfoState _state;
    private int hostNameCount;

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/HostInfo$HostInfoState.class */
    private static final class HostInfoState extends DNSStatefulObject.DefaultImplementation {
        private static final long serialVersionUID = -8191476803620402088L;

        public HostInfoState(JmDNSImpl dns) {
            setDns(dns);
        }
    }

    public static HostInfo newHostInfo(InetAddress address, JmDNSImpl dns, String jmdnsName) {
        String aName;
        InetAddress addr = address;
        try {
            if (addr == null) {
                String ip = System.getProperty("net.mdns.interface");
                if (ip != null) {
                    addr = InetAddress.getByName(ip);
                } else {
                    addr = InetAddress.getLocalHost();
                    if (addr.isLoopbackAddress()) {
                        InetAddress[] addresses = NetworkTopologyDiscovery.Factory.getInstance().getInetAddresses();
                        if (addresses.length > 0) {
                            addr = addresses[0];
                        }
                    }
                }
                aName = addr.getHostName();
                if (addr.isLoopbackAddress()) {
                    logger.warning("Could not find any address beside the loopback.");
                }
            } else {
                aName = addr.getHostName();
            }
            if (aName.contains("in-addr.arpa") || aName.equals(addr.getHostAddress())) {
                aName = (jmdnsName == null || jmdnsName.length() <= 0) ? addr.getHostAddress() : jmdnsName;
            }
        } catch (IOException e) {
            logger.log(Level.WARNING, "Could not intialize the host network interface on " + address + "because of an error: " + e.getMessage(), (Throwable) e);
            addr = loopbackAddress();
            aName = (jmdnsName == null || jmdnsName.length() <= 0) ? "computer" : jmdnsName;
        }
        HostInfo localhost = new HostInfo(addr, aName.replace('.', '-') + ".local.", dns);
        return localhost;
    }

    private static InetAddress loopbackAddress() {
        try {
            return InetAddress.getByName(null);
        } catch (UnknownHostException e) {
            return null;
        }
    }

    private HostInfo(InetAddress address, String name, JmDNSImpl dns) {
        this._state = new HostInfoState(dns);
        this._address = address;
        this._name = name;
        if (address != null) {
            try {
                this._interfaze = NetworkInterface.getByInetAddress(address);
            } catch (Exception exception) {
                logger.log(Level.SEVERE, "LocalHostInfo() exception ", (Throwable) exception);
            }
        }
    }

    public String getName() {
        return this._name;
    }

    public InetAddress getInetAddress() {
        return this._address;
    }

    Inet4Address getInet4Address() {
        if (getInetAddress() instanceof Inet4Address) {
            return (Inet4Address) this._address;
        }
        return null;
    }

    Inet6Address getInet6Address() {
        if (getInetAddress() instanceof Inet6Address) {
            return (Inet6Address) this._address;
        }
        return null;
    }

    public NetworkInterface getInterface() {
        return this._interfaze;
    }

    public boolean conflictWithRecord(DNSRecord.Address record) {
        DNSRecord.Address hostAddress = getDNSAddressRecord(record.getRecordType(), record.isUnique(), DNSConstants.DNS_TTL);
        return hostAddress != null && hostAddress.sameType(record) && hostAddress.sameName(record) && !hostAddress.sameValue(record);
    }

    synchronized String incrementHostName() {
        this.hostNameCount++;
        int plocal = this._name.indexOf(".local.");
        int punder = this._name.lastIndexOf(45);
        this._name = this._name.substring(0, punder == -1 ? plocal : punder) + "-" + this.hostNameCount + ".local.";
        return this._name;
    }

    boolean shouldIgnorePacket(DatagramPacket packet) {
        InetAddress from;
        boolean result = false;
        if (getInetAddress() != null && (from = packet.getAddress()) != null) {
            if (from.isLinkLocalAddress() && !getInetAddress().isLinkLocalAddress()) {
                result = true;
            }
            if (from.isLoopbackAddress() && !getInetAddress().isLoopbackAddress()) {
                result = true;
            }
        }
        return result;
    }

    DNSRecord.Address getDNSAddressRecord(DNSRecordType type, boolean unique, int ttl) {
        switch (type) {
            case TYPE_A:
                return getDNS4AddressRecord(unique, ttl);
            case TYPE_A6:
            case TYPE_AAAA:
                return getDNS6AddressRecord(unique, ttl);
            default:
                return null;
        }
    }

    private DNSRecord.Address getDNS4AddressRecord(boolean unique, int ttl) {
        if ((getInetAddress() instanceof Inet4Address) || ((getInetAddress() instanceof Inet6Address) && ((Inet6Address) getInetAddress()).isIPv4CompatibleAddress())) {
            return new DNSRecord.IPv4Address(getName(), DNSRecordClass.CLASS_IN, unique, ttl, getInetAddress());
        }
        return null;
    }

    private DNSRecord.Address getDNS6AddressRecord(boolean unique, int ttl) {
        if (getInetAddress() instanceof Inet6Address) {
            return new DNSRecord.IPv6Address(getName(), DNSRecordClass.CLASS_IN, unique, ttl, getInetAddress());
        }
        return null;
    }

    DNSRecord.Pointer getDNSReverseAddressRecord(DNSRecordType type, boolean unique, int ttl) {
        switch (type) {
            case TYPE_A:
                return getDNS4ReverseAddressRecord(unique, ttl);
            case TYPE_A6:
            case TYPE_AAAA:
                return getDNS6ReverseAddressRecord(unique, ttl);
            default:
                return null;
        }
    }

    private DNSRecord.Pointer getDNS4ReverseAddressRecord(boolean unique, int ttl) {
        if (getInetAddress() instanceof Inet4Address) {
            return new DNSRecord.Pointer(getInetAddress().getHostAddress() + ".in-addr.arpa.", DNSRecordClass.CLASS_IN, unique, ttl, getName());
        }
        if ((getInetAddress() instanceof Inet6Address) && ((Inet6Address) getInetAddress()).isIPv4CompatibleAddress()) {
            byte[] rawAddress = getInetAddress().getAddress();
            String address = (rawAddress[12] & 255) + "." + (rawAddress[13] & 255) + "." + (rawAddress[14] & 255) + "." + (rawAddress[15] & 255);
            return new DNSRecord.Pointer(address + ".in-addr.arpa.", DNSRecordClass.CLASS_IN, unique, ttl, getName());
        }
        return null;
    }

    private DNSRecord.Pointer getDNS6ReverseAddressRecord(boolean unique, int ttl) {
        if (getInetAddress() instanceof Inet6Address) {
            return new DNSRecord.Pointer(getInetAddress().getHostAddress() + ".ip6.arpa.", DNSRecordClass.CLASS_IN, unique, ttl, getName());
        }
        return null;
    }

    public String toString() {
        StringBuilder buf = new StringBuilder(DNSConstants.FLAGS_AA);
        buf.append("local host info[");
        buf.append(getName() != null ? getName() : "no name");
        buf.append(", ");
        buf.append(getInterface() != null ? getInterface().getDisplayName() : "???");
        buf.append(":");
        buf.append(getInetAddress() != null ? getInetAddress().getHostAddress() : "no address");
        buf.append(", ");
        buf.append(this._state);
        buf.append("]");
        return buf.toString();
    }

    public Collection<DNSRecord> answers(boolean unique, int ttl) {
        List<DNSRecord> list = new ArrayList<>();
        DNSRecord answer = getDNS4AddressRecord(unique, ttl);
        if (answer != null) {
            list.add(answer);
        }
        DNSRecord answer2 = getDNS6AddressRecord(unique, ttl);
        if (answer2 != null) {
            list.add(answer2);
        }
        return list;
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public JmDNSImpl getDns() {
        return this._state.getDns();
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean advanceState(DNSTask task) {
        return this._state.advanceState(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public void removeAssociationWithTask(DNSTask task) {
        this._state.removeAssociationWithTask(task);
    }

    @Override // javax.jmdns.impl.DNSStatefulObject
    public boolean revertState() {
        return this._state.revertState();
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
        if (this._address == null) {
            return true;
        }
        return this._state.waitForCanceled(timeout);
    }
}
