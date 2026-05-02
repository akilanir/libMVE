package okhttp3;

import java.net.Proxy;
import java.net.ProxySelector;
import java.util.List;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLSocketFactory;
import okhttp3.HttpUrl;
import okhttp3.internal.Util;

/* loaded from: okhttp-3.2.0.jar:okhttp3/Address.class */
public final class Address {
    final HttpUrl url;
    final Dns dns;
    final SocketFactory socketFactory;
    final Authenticator proxyAuthenticator;
    final List<Protocol> protocols;
    final List<ConnectionSpec> connectionSpecs;
    final ProxySelector proxySelector;
    final Proxy proxy;
    final SSLSocketFactory sslSocketFactory;
    final HostnameVerifier hostnameVerifier;
    final CertificatePinner certificatePinner;

    public Address(String uriHost, int uriPort, Dns dns, SocketFactory socketFactory, SSLSocketFactory sslSocketFactory, HostnameVerifier hostnameVerifier, CertificatePinner certificatePinner, Authenticator proxyAuthenticator, Proxy proxy, List<Protocol> protocols, List<ConnectionSpec> connectionSpecs, ProxySelector proxySelector) {
        this.url = new HttpUrl.Builder().scheme(sslSocketFactory != null ? "https" : "http").host(uriHost).port(uriPort).build();
        if (dns == null) {
            throw new IllegalArgumentException("dns == null");
        }
        this.dns = dns;
        if (socketFactory == null) {
            throw new IllegalArgumentException("socketFactory == null");
        }
        this.socketFactory = socketFactory;
        if (proxyAuthenticator == null) {
            throw new IllegalArgumentException("proxyAuthenticator == null");
        }
        this.proxyAuthenticator = proxyAuthenticator;
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

    public HttpUrl url() {
        return this.url;
    }

    public Dns dns() {
        return this.dns;
    }

    public SocketFactory socketFactory() {
        return this.socketFactory;
    }

    public Authenticator proxyAuthenticator() {
        return this.proxyAuthenticator;
    }

    public List<Protocol> protocols() {
        return this.protocols;
    }

    public List<ConnectionSpec> connectionSpecs() {
        return this.connectionSpecs;
    }

    public ProxySelector proxySelector() {
        return this.proxySelector;
    }

    public Proxy proxy() {
        return this.proxy;
    }

    public SSLSocketFactory sslSocketFactory() {
        return this.sslSocketFactory;
    }

    public HostnameVerifier hostnameVerifier() {
        return this.hostnameVerifier;
    }

    public CertificatePinner certificatePinner() {
        return this.certificatePinner;
    }

    public boolean equals(Object other) {
        if (other instanceof Address) {
            Address that = (Address) other;
            return this.url.equals(that.url) && this.dns.equals(that.dns) && this.proxyAuthenticator.equals(that.proxyAuthenticator) && this.protocols.equals(that.protocols) && this.connectionSpecs.equals(that.connectionSpecs) && this.proxySelector.equals(that.proxySelector) && Util.equal(this.proxy, that.proxy) && Util.equal(this.sslSocketFactory, that.sslSocketFactory) && Util.equal(this.hostnameVerifier, that.hostnameVerifier) && Util.equal(this.certificatePinner, that.certificatePinner);
        }
        return false;
    }

    public int hashCode() {
        int result = (31 * 17) + this.url.hashCode();
        return (31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * ((31 * result) + this.dns.hashCode())) + this.proxyAuthenticator.hashCode())) + this.protocols.hashCode())) + this.connectionSpecs.hashCode())) + this.proxySelector.hashCode())) + (this.proxy != null ? this.proxy.hashCode() : 0))) + (this.sslSocketFactory != null ? this.sslSocketFactory.hashCode() : 0))) + (this.hostnameVerifier != null ? this.hostnameVerifier.hashCode() : 0))) + (this.certificatePinner != null ? this.certificatePinner.hashCode() : 0);
    }
}
