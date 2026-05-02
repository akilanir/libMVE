package javax.jmdns;

import java.util.EventObject;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/ServiceEvent.class */
public abstract class ServiceEvent extends EventObject implements Cloneable {
    private static final long serialVersionUID = -8558445644541006271L;

    public abstract JmDNS getDNS();

    public abstract String getType();

    public abstract String getName();

    public abstract ServiceInfo getInfo();

    public ServiceEvent(Object eventSource) {
        super(eventSource);
    }

    @Override // 
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public ServiceEvent mo2clone() {
        try {
            return (ServiceEvent) super.clone();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }
}
