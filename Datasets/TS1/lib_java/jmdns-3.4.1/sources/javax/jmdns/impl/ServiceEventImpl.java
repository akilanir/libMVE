package javax.jmdns.impl;

import javax.jmdns.JmDNS;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceInfo;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ServiceEventImpl.class */
public class ServiceEventImpl extends ServiceEvent {
    private static final long serialVersionUID = 7107973622016897488L;
    private final String _type;
    private final String _name;
    private final ServiceInfo _info;

    public ServiceEventImpl(JmDNSImpl jmDNS, String type, String name, ServiceInfo info) {
        super(jmDNS);
        this._type = type;
        this._name = name;
        this._info = info;
    }

    @Override // javax.jmdns.ServiceEvent
    public JmDNS getDNS() {
        return (JmDNS) getSource();
    }

    @Override // javax.jmdns.ServiceEvent
    public String getType() {
        return this._type;
    }

    @Override // javax.jmdns.ServiceEvent
    public String getName() {
        return this._name;
    }

    @Override // java.util.EventObject
    public String toString() {
        StringBuilder buf = new StringBuilder();
        buf.append("[" + getClass().getSimpleName() + "@" + System.identityHashCode(this) + " ");
        buf.append("\n\tname: '");
        buf.append(getName());
        buf.append("' type: '");
        buf.append(getType());
        buf.append("' info: '");
        buf.append(getInfo());
        buf.append("']");
        return buf.toString();
    }

    @Override // javax.jmdns.ServiceEvent
    public ServiceInfo getInfo() {
        return this._info;
    }

    @Override // javax.jmdns.ServiceEvent
    /* renamed from: clone */
    public ServiceEventImpl mo2clone() {
        ServiceInfoImpl newInfo = new ServiceInfoImpl(getInfo());
        return new ServiceEventImpl((JmDNSImpl) getDNS(), getType(), getName(), newInfo);
    }
}
