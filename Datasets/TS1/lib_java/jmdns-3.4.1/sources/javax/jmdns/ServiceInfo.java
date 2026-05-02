package javax.jmdns;

import java.net.Inet4Address;
import java.net.Inet6Address;
import java.net.InetAddress;
import java.util.Enumeration;
import java.util.Map;
import javax.jmdns.impl.ServiceInfoImpl;

/* loaded from: jmdns-3.4.1.jar:javax/jmdns/ServiceInfo.class */
public abstract class ServiceInfo implements Cloneable {
    public static final byte[] NO_VALUE = new byte[0];

    /* loaded from: jmdns-3.4.1.jar:javax/jmdns/ServiceInfo$Fields.class */
    public enum Fields {
        Domain,
        Protocol,
        Application,
        Instance,
        Subtype
    }

    public abstract boolean hasData();

    public abstract String getType();

    public abstract String getTypeWithSubtype();

    public abstract String getName();

    public abstract String getKey();

    public abstract String getQualifiedName();

    public abstract String getServer();

    @Deprecated
    public abstract String getHostAddress();

    public abstract String[] getHostAddresses();

    @Deprecated
    public abstract InetAddress getAddress();

    @Deprecated
    public abstract InetAddress getInetAddress();

    @Deprecated
    public abstract Inet4Address getInet4Address();

    @Deprecated
    public abstract Inet6Address getInet6Address();

    public abstract InetAddress[] getInetAddresses();

    public abstract Inet4Address[] getInet4Addresses();

    public abstract Inet6Address[] getInet6Addresses();

    public abstract int getPort();

    public abstract int getPriority();

    public abstract int getWeight();

    public abstract byte[] getTextBytes();

    @Deprecated
    public abstract String getTextString();

    @Deprecated
    public abstract String getURL();

    public abstract String[] getURLs();

    @Deprecated
    public abstract String getURL(String str);

    public abstract String[] getURLs(String str);

    public abstract byte[] getPropertyBytes(String str);

    public abstract String getPropertyString(String str);

    public abstract Enumeration<String> getPropertyNames();

    public abstract String getNiceTextString();

    public abstract void setText(byte[] bArr) throws IllegalStateException;

    public abstract void setText(Map<String, ?> map) throws IllegalStateException;

    public abstract boolean isPersistent();

    public abstract String getDomain();

    public abstract String getProtocol();

    public abstract String getApplication();

    public abstract String getSubtype();

    public abstract Map<Fields, String> getQualifiedNameMap();

    public static ServiceInfo create(String type, String name, int port, String text) {
        return new ServiceInfoImpl(type, name, "", port, 0, 0, false, text);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, String text) {
        return new ServiceInfoImpl(type, name, subtype, port, 0, 0, false, text);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, String text) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, false, text);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, String text) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, false, text);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, Map<String, ?> props) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, false, props);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, Map<String, ?> props) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, false, props);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, byte[] text) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, false, text);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, byte[] text) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, false, text);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, boolean persistent, String text) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, persistent, text);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, String text) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, persistent, text);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, boolean persistent, Map<String, ?> props) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, persistent, props);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, Map<String, ?> props) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, persistent, props);
    }

    public static ServiceInfo create(String type, String name, int port, int weight, int priority, boolean persistent, byte[] text) {
        return new ServiceInfoImpl(type, name, "", port, weight, priority, persistent, text);
    }

    public static ServiceInfo create(String type, String name, String subtype, int port, int weight, int priority, boolean persistent, byte[] text) {
        return new ServiceInfoImpl(type, name, subtype, port, weight, priority, persistent, text);
    }

    public static ServiceInfo create(Map<Fields, String> qualifiedNameMap, int port, int weight, int priority, boolean persistent, Map<String, ?> props) {
        return new ServiceInfoImpl(qualifiedNameMap, port, weight, priority, persistent, props);
    }

    @Override // 
    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public ServiceInfo mo4clone() {
        try {
            return (ServiceInfo) super.clone();
        } catch (CloneNotSupportedException e) {
            return null;
        }
    }
}
