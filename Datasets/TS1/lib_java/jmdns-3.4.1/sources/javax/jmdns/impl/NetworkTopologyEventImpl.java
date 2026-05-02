package javax.jmdns.impl;

import java.net.InetAddress;
import javax.jmdns.JmDNS;
import javax.jmdns.NetworkTopologyEvent;
import javax.jmdns.NetworkTopologyListener;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/NetworkTopologyEventImpl.class */
public class NetworkTopologyEventImpl extends NetworkTopologyEvent implements Cloneable {
    private static final long serialVersionUID = 1445606146153550463L;
    private final InetAddress _inetAddress;

    public NetworkTopologyEventImpl(JmDNS jmDNS, InetAddress inetAddress) {
        super(jmDNS);
        this._inetAddress = inetAddress;
    }

    NetworkTopologyEventImpl(NetworkTopologyListener jmmDNS, InetAddress inetAddress) {
        super(jmmDNS);
        this._inetAddress = inetAddress;
    }

    @Override // javax.jmdns.NetworkTopologyEvent
    public JmDNS getDNS() {
        if (getSource() instanceof JmDNS) {
            return (JmDNS) getSource();
        }
        return null;
    }

    @Override // javax.jmdns.NetworkTopologyEvent
    public InetAddress getInetAddress() {
        return this._inetAddress;
    }

    @Override // java.util.EventObject
    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("[" + getClass().getSimpleName() + "@" + System.identityHashCode(this) + " ");
        buf.append("\n\tinetAddress: '");
        buf.append(getInetAddress());
        buf.append("']");
        return buf.toString();
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public NetworkTopologyEventImpl m32clone() throws CloneNotSupportedException {
        return new NetworkTopologyEventImpl(getDNS(), getInetAddress());
    }
}
