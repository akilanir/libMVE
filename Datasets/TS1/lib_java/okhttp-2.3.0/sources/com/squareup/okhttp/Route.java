package com.squareup.okhttp;

import java.net.InetSocketAddress;
import java.net.Proxy;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/Route.class */
public final class Route {
    final Address address;
    final Proxy proxy;
    final InetSocketAddress inetSocketAddress;
    final ConnectionSpec connectionSpec;
    final boolean shouldSendTlsFallbackIndicator;

    public Route(Address address, Proxy proxy, InetSocketAddress inetSocketAddress, ConnectionSpec connectionSpec) {
        this(address, proxy, inetSocketAddress, connectionSpec, false);
    }

    public Route(Address address, Proxy proxy, InetSocketAddress inetSocketAddress, ConnectionSpec connectionSpec, boolean shouldSendTlsFallbackIndicator) {
        if (address == null) {
            throw new NullPointerException("address == null");
        }
        if (proxy == null) {
            throw new NullPointerException("proxy == null");
        }
        if (inetSocketAddress == null) {
            throw new NullPointerException("inetSocketAddress == null");
        }
        if (connectionSpec == null) {
            throw new NullPointerException("connectionConfiguration == null");
        }
        this.address = address;
        this.proxy = proxy;
        this.inetSocketAddress = inetSocketAddress;
        this.connectionSpec = connectionSpec;
        this.shouldSendTlsFallbackIndicator = shouldSendTlsFallbackIndicator;
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

    public ConnectionSpec getConnectionSpec() {
        return this.connectionSpec;
    }

    public boolean getShouldSendTlsFallbackIndicator() {
        return this.shouldSendTlsFallbackIndicator;
    }

    public boolean requiresTunnel() {
        return this.address.sslSocketFactory != null && this.proxy.type() == Proxy.Type.HTTP;
    }

    public boolean equals(Object obj) {
        if (obj instanceof Route) {
            Route other = (Route) obj;
            return this.address.equals(other.address) && this.proxy.equals(other.proxy) && this.inetSocketAddress.equals(other.inetSocketAddress) && this.connectionSpec.equals(other.connectionSpec) && this.shouldSendTlsFallbackIndicator == other.shouldSendTlsFallbackIndicator;
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + this.address.hashCode();
        return (31 * ((31 * ((31 * ((31 * result) + this.proxy.hashCode())) + this.inetSocketAddress.hashCode())) + this.connectionSpec.hashCode())) + (this.shouldSendTlsFallbackIndicator ? 1 : 0);
    }
}
