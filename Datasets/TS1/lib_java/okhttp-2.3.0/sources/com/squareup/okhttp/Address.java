package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.net.Proxy;
import java.net.ProxySelector;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/Address.class */
public final class Address {
    final Proxy proxy;
    final String uriHost;
    final int uriPort;
    final SocketFactory socketFactory;
    final SSLSocketFactory sslSocketFactory;
    final HostnameVerifier hostnameVerifier;
    final CertificatePinner certificatePinner;
    final Authenticator authenticator;
    final List<Protocol> protocols;
    final List<ConnectionSpec> connectionSpecs;
    final ProxySelector proxySelector;

    public Address(String uriHost, int uriPort, SocketFactory socketFactory, SSLSocketFactory sslSocketFactory, HostnameVerifier hostnameVerifier, CertificatePinner certificatePinner, Authenticator authenticator, Proxy proxy, List<Protocol> protocols, List<ConnectionSpec> connectionSpecs, ProxySelector proxySelector) {
        if (uriHost == null) {
            throw new NullPointerException("uriHost == null");
        }
        if (uriPort <= 0) {
            throw new IllegalArgumentException("uriPort <= 0: " + uriPort);
        }
        if (authenticator == null) {
            throw new IllegalArgumentException("authenticator == null");
        }
        if (protocols == null) {
            throw new IllegalArgumentException("protocols == null");
        }
        if (proxySelector == null) {
            throw new IllegalArgumentException("proxySelector == null");
        }
        this.proxy = proxy;
        this.uriHost = uriHost;
        this.uriPort = uriPort;
        this.socketFactory = socketFactory;
        this.sslSocketFactory = sslSocketFactory;
        this.hostnameVerifier = hostnameVerifier;
        this.certificatePinner = certificatePinner;
        this.authenticator = authenticator;
        this.protocols = Util.immutableList(protocols);
        this.connectionSpecs = Util.immutableList(connectionSpecs);
        this.proxySelector = proxySelector;
    }

    public String getUriHost() {
        return this.uriHost;
    }

    public int getUriPort() {
        return this.uriPort;
    }

    public SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    public SSLSocketFactory getSslSocketFactory() {
        return this.sslSocketFactory;
    }

    public HostnameVerifier getHostnameVerifier() {
        return this.hostnameVerifier;
    }

    public Authenticator getAuthenticator() {
        return this.authenticator;
    }

    public List<Protocol> getProtocols() {
        return this.protocols;
    }

    public List<ConnectionSpec> getConnectionSpecs() {
        return this.connectionSpecs;
    }

    public Proxy getProxy() {
        return this.proxy;
    }

    public ProxySelector getProxySelector() {
        return this.proxySelector;
    }

    public boolean equals(Object other) {
        if (other instanceof Address) {
            Address that = (Address) other;
            return Util.equal(this.proxy, that.proxy) && this.uriHost.equals(that.uriHost) && this.uriPort == that.uriPort && Util.equal(this.sslSocketFactory, that.sslSocketFactory) && Util.equal(this.hostnameVerifier, that.hostnameVerifier) && Util.equal(this.certificatePinner, that.certificatePinner) && Util.equal(this.authenticator, that.authenticator) && Util.equal(this.protocols, that.protocols) && Util.equal(this.connectionSpecs, that.connectionSpecs) && Util.equal(this.proxySelector, that.proxySelector);
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + (this.proxy != null ? this.proxy.hashCode() : 0);
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + this.uriHost.hashCode())) + this.uriPort)) + (this.sslSocketFactory != null ? this.sslSocketFactory.hashCode() : 0))) + (this.hostnameVerifier != null ? this.hostnameVerifier.hashCode() : 0))) + (this.certificatePinner != null ? this.certificatePinner.hashCode() : 0))) + this.authenticator.hashCode())) + this.protocols.hashCode())) + this.connectionSpecs.hashCode())) + this.proxySelector.hashCode();
    }
}
