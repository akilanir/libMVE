package com.squareup.okhttp;

import com.squareup.okhttp.internal.Util;
import java.net.Proxy;
import java.net.ProxySelector;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Address.class */
public final class Address {
    final String uriHost;
    final int uriPort;
    final Dns dns;
    final SocketFactory socketFactory;
    final Authenticator authenticator;
    final List<Protocol> protocols;
    final List<ConnectionSpec> connectionSpecs;
    final ProxySelector proxySelector;
    final Proxy proxy;
    final SSLSocketFactory sslSocketFactory;
    final HostnameVerifier hostnameVerifier;
    final CertificatePinner certificatePinner;

    public Address(String uriHost, int uriPort, Dns dns, SocketFactory socketFactory, SSLSocketFactory sslSocketFactory, HostnameVerifier hostnameVerifier, CertificatePinner certificatePinner, Authenticator authenticator, Proxy proxy, List<Protocol> protocols, List<ConnectionSpec> connectionSpecs, ProxySelector proxySelector) {
        if (uriHost == null) {
            throw new NullPointerException("uriHost == null");
        }
        this.uriHost = uriHost;
        if (uriPort <= 0) {
            throw new IllegalArgumentException("uriPort <= 0: " + uriPort);
        }
        this.uriPort = uriPort;
        if (dns == null) {
            throw new IllegalArgumentException("dns == null");
        }
        this.dns = dns;
        if (socketFactory == null) {
            throw new IllegalArgumentException("socketFactory == null");
        }
        this.socketFactory = socketFactory;
        if (authenticator == null) {
            throw new IllegalArgumentException("authenticator == null");
        }
        this.authenticator = authenticator;
        if (protocols == null) {
            throw new IllegalArgumentException("protocols == null");
        }
        this.protocols = Util.immutableList(protocols);
        if (connectionSpecs == null) {
            throw new IllegalArgumentException("connectionSpecs == null");
        }
        this.connectionSpecs = Util.immutableList(connectionSpecs);
        if (proxySelector == null) {
            throw new IllegalArgumentException("proxySelector == null");
        }
        this.proxySelector = proxySelector;
        this.proxy = proxy;
        this.sslSocketFactory = sslSocketFactory;
        this.hostnameVerifier = hostnameVerifier;
        this.certificatePinner = certificatePinner;
    }

    public String getUriHost() {
        return this.uriHost;
    }

    public int getUriPort() {
        return this.uriPort;
    }

    public Dns getDns() {
        return this.dns;
    }

    public SocketFactory getSocketFactory() {
        return this.socketFactory;
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

    public ProxySelector getProxySelector() {
        return this.proxySelector;
    }

    public Proxy getProxy() {
        return this.proxy;
    }

    public SSLSocketFactory getSslSocketFactory() {
        return this.sslSocketFactory;
    }

    public HostnameVerifier getHostnameVerifier() {
        return this.hostnameVerifier;
    }

    public CertificatePinner getCertificatePinner() {
        return this.certificatePinner;
    }

    public boolean equals(Object other) {
        if (other instanceof Address) {
            Address that = (Address) other;
            return this.uriHost.equals(that.uriHost) && this.uriPort == that.uriPort && this.dns.equals(that.dns) && this.authenticator.equals(that.authenticator) && this.protocols.equals(that.protocols) && this.connectionSpecs.equals(that.connectionSpecs) && this.proxySelector.equals(that.proxySelector) && Util.equal(this.proxy, that.proxy) && Util.equal(this.sslSocketFactory, that.sslSocketFactory) && Util.equal(this.hostnameVerifier, that.hostnameVerifier) && Util.equal(this.certificatePinner, that.certificatePinner);
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + this.uriHost.hashCode();
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + this.uriPort)) + this.dns.hashCode())) + this.authenticator.hashCode())) + this.protocols.hashCode())) + this.connectionSpecs.hashCode())) + this.proxySelector.hashCode())) + (this.proxy != null ? this.proxy.hashCode() : 0))) + (this.sslSocketFactory != null ? this.sslSocketFactory.hashCode() : 0))) + (this.hostnameVerifier != null ? this.hostnameVerifier.hashCode() : 0))) + (this.certificatePinner != null ? this.certificatePinner.hashCode() : 0);
    }
}
