package javax.jmdns.impl;

import java.util.EventListener;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;
import java.util.logging.Logger;
import javax.jmdns.ServiceEvent;
import javax.jmdns.ServiceInfo;
import javax.jmdns.ServiceListener;
import javax.jmdns.ServiceTypeListener;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ListenerStatus.class */
public class ListenerStatus<T extends EventListener> {
    public static final boolean SYNCHONEOUS = true;
    public static final boolean ASYNCHONEOUS = false;
    private final T _listener;
    private final boolean _synch;

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ListenerStatus$ServiceListenerStatus.class */
    public static class ServiceListenerStatus extends ListenerStatus<ServiceListener> {
        private static Logger logger = Logger.getLogger(ServiceListenerStatus.class.getName());
        private final ConcurrentMap<String, ServiceInfo> _addedServices;

        public ServiceListenerStatus(ServiceListener listener, boolean synch) {
            super(listener, synch);
            this._addedServices = new ConcurrentHashMap(32);
        }

        void serviceAdded(ServiceEvent event) {
            String qualifiedName = event.getName() + "." + event.getType();
            if (null == this._addedServices.putIfAbsent(qualifiedName, event.getInfo().mo4clone())) {
                getListener().serviceAdded(event);
                ServiceInfo info = event.getInfo();
                if (info != null && info.hasData()) {
                    getListener().serviceResolved(event);
                    return;
                }
                return;
            }
            logger.finer("Service Added called for a service already added: " + event);
        }

        void serviceRemoved(ServiceEvent event) {
            String qualifiedName = event.getName() + "." + event.getType();
            if (this._addedServices.remove(qualifiedName, this._addedServices.get(qualifiedName))) {
                getListener().serviceRemoved(event);
            } else {
                logger.finer("Service Removed called for a service already removed: " + event);
            }
        }

        synchronized void serviceResolved(ServiceEvent event) {
            ServiceInfo info = event.getInfo();
            if (info != null && info.hasData()) {
                String qualifiedName = event.getName() + "." + event.getType();
                ServiceInfo previousServiceInfo = this._addedServices.get(qualifiedName);
                if (!_sameInfo(info, previousServiceInfo)) {
                    if (null == previousServiceInfo) {
                        if (null == this._addedServices.putIfAbsent(qualifiedName, info.mo4clone())) {
                            getListener().serviceResolved(event);
                            return;
                        }
                        return;
                    } else {
                        if (this._addedServices.replace(qualifiedName, previousServiceInfo, info.mo4clone())) {
                            getListener().serviceResolved(event);
                            return;
                        }
                        return;
                    }
                }
                logger.finer("Service Resolved called for a service already resolved: " + event);
                return;
            }
            logger.warning("Service Resolved called for an unresolved event: " + event);
        }

        private static final boolean _sameInfo(ServiceInfo info, ServiceInfo lastInfo) {
            if (info == null || lastInfo == null || !info.equals(lastInfo)) {
                return false;
            }
            byte[] text = info.getTextBytes();
            byte[] lastText = lastInfo.getTextBytes();
            if (text.length != lastText.length) {
                return false;
            }
            for (int i = 0; i < text.length; i++) {
                if (text[i] != lastText[i]) {
                    return false;
                }
            }
            return true;
        }

        @Override // javax.jmdns.impl.ListenerStatus
        public String toString() {
            StringBuilder aLog = new StringBuilder(2048);
            aLog.append("[Status for ");
            aLog.append(getListener().toString());
            if (this._addedServices.isEmpty()) {
                aLog.append(" no type event ");
            } else {
                aLog.append(" (");
                for (String service : this._addedServices.keySet()) {
                    aLog.append(service + ", ");
                }
                aLog.append(") ");
            }
            aLog.append("]");
            return aLog.toString();
        }
    }

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/impl/ListenerStatus$ServiceTypeListenerStatus.class */
    public static class ServiceTypeListenerStatus extends ListenerStatus<ServiceTypeListener> {
        private static Logger logger = Logger.getLogger(ServiceTypeListenerStatus.class.getName());
        private final ConcurrentMap<String, String> _addedTypes;

        public ServiceTypeListenerStatus(ServiceTypeListener listener, boolean synch) {
            super(listener, synch);
            this._addedTypes = new ConcurrentHashMap(32);
        }

        void serviceTypeAdded(ServiceEvent event) {
            if (null == this._addedTypes.putIfAbsent(event.getType(), event.getType())) {
                getListener().serviceTypeAdded(event);
            } else {
                logger.finest("Service Type Added called for a service type already added: " + event);
            }
        }

        void subTypeForServiceTypeAdded(ServiceEvent event) {
            if (null == this._addedTypes.putIfAbsent(event.getType(), event.getType())) {
                getListener().subTypeForServiceTypeAdded(event);
            } else {
                logger.finest("Service Sub Type Added called for a service sub type already added: " + event);
            }
        }

        @Override // javax.jmdns.impl.ListenerStatus
        public String toString() {
            StringBuilder aLog = new StringBuilder(2048);
            aLog.append("[Status for ");
            aLog.append(getListener().toString());
            if (this._addedTypes.isEmpty()) {
                aLog.append(" no type event ");
            } else {
                aLog.append(" (");
                for (String type : this._addedTypes.keySet()) {
                    aLog.append(type + ", ");
                }
                aLog.append(") ");
            }
            aLog.append("]");
            return aLog.toString();
        }
    }

    public ListenerStatus(T listener, boolean synch) {
        this._listener = listener;
        this._synch = synch;
    }

    public T getListener() {
        return this._listener;
    }

    public boolean isSynchronous() {
        return this._synch;
    }

    public int hashCode() {
        return getListener().hashCode();
    }

    public boolean equals(Object obj) {
        return (obj instanceof ListenerStatus) && getListener().equals(((ListenerStatus) obj).getListener());
    }

    public String toString() {
        return "[Status for " + getListener().toString() + "]";
    }
}
