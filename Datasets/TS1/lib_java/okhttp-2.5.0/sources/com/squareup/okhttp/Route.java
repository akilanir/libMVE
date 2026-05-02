package com.squareup.okhttp;

import java.net.InetSocketAddress;
import java.net.Proxy;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/Route.class */
public final class Route {
    final Address address;
    final Proxy proxy;
    final InetSocketAddress inetSocketAddress;

    public Route(Address address, Proxy proxy, InetSocketAddress inetSocketAddress) {
        if (address == null) {
            throw new NullPointerException("address == null");
        }
        if (proxy == null) {
            throw new NullPointerException("proxy == null");
        }
        if (inetSocketAddress == null) {
            throw new NullPointerException("inetSocketAddress == null");
        }
        this.address = address;
        this.proxy = proxy;
        this.inetSocketAddress = inetSocketAddress;
    }

    public Address getAddress() {
        return this.address;
    }

    public Proxy getProxy() {
        return this.proxy;
    }

    public InetSocketAddress getSocketAddress() {
        return this.inetSocketAddress;
    }

    public boolean requiresTunnel() {
        return this.address.sslSocketFactory != null && this.proxy.type() == Proxy.Type.HTTP;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Route) {
            Route other = (Route) obj;
            return this.address.equals(other.address) && this.proxy.equals(other.proxy) && this.inetSocketAddress.equals(other.inetSocketAddress);
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + this.address.hashCode();
        return (31 * ((31 * result) + this.proxy.hashCode())) + this.inetSocketAddress.hashCode();
    }
}
