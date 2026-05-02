package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.Address;
import com.squareup.okhttp.CertificatePinner;
import com.squareup.okhttp.Connection;
import com.squareup.okhttp.ConnectionPool;
import com.squareup.okhttp.ConnectionSpec;
import com.squareup.okhttp.OkHttpClient;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.Route;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.Network;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import java.io.IOException;
import java.net.InetAddress;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.SocketAddress;
import java.net.SocketException;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.NoSuchElementException;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLHandshakeException;
import javax.net.ssl.SSLProtocolException;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/internal/http/RouteSelector.class */
public final class RouteSelector {
    private final Address address;
    private final URI uri;
    private final Network network;
    private final OkHttpClient client;
    private final ConnectionPool pool;
    private final RouteDatabase routeDatabase;
    private final Request request;
    private Proxy lastProxy;
    private InetSocketAddress lastInetSocketAddress;
    private ConnectionSpec lastSpec;
    private int nextProxyIndex;
    private int nextInetSocketAddressIndex;
    private int nextSpecIndex;
    private List<Proxy> proxies = Collections.emptyList();
    private List<InetSocketAddress> inetSocketAddresses = Collections.emptyList();
    private List<ConnectionSpec> connectionSpecs = Collections.emptyList();
    private final List<Route> postponedRoutes = new ArrayList();

    private RouteSelector(Address address, URI uri, OkHttpClient client, Request request) {
        this.address = address;
        this.uri = uri;
        this.client = client;
        this.pool = client.getConnectionPool();
        this.routeDatabase = Internal.instance.routeDatabase(client);
        this.network = Internal.instance.network(client);
        this.request = request;
        resetNextProxy(uri, address.getProxy());
    }

    public static RouteSelector get(Request request, OkHttpClient client) throws IOException {
        String uriHost = request.url().getHost();
        if (uriHost == null || uriHost.length() == 0) {
            throw new UnknownHostException(request.url().toString());
        }
        SSLSocketFactory sslSocketFactory = null;
        HostnameVerifier hostnameVerifier = null;
        CertificatePinner certificatePinner = null;
        if (request.isHttps()) {
            sslSocketFactory = client.getSslSocketFactory();
            hostnameVerifier = client.getHostnameVerifier();
            certificatePinner = client.getCertificatePinner();
        }
        Address address = new Address(uriHost, Util.getEffectivePort(request.url()), client.getSocketFactory(), sslSocketFactory, hostnameVerifier, certificatePinner, client.getAuthenticator(), client.getProxy(), client.getProtocols(), client.getConnectionSpecs(), client.getProxySelector());
        return new RouteSelector(address, request.uri(), client, request);
    }

    public boolean hasNext() {
        return hasNextConnectionSpec() || hasNextInetSocketAddress() || hasNextProxy() || hasNextPostponed();
    }

    public Connection next(HttpEngine owner) throws IOException {
        Connection connection = nextUnconnected();
        Internal.instance.connectAndSetOwner(this.client, connection, owner, this.request);
        return connection;
    }

    Connection nextUnconnected() throws IOException {
        Connection pooled;
        while (true) {
            pooled = this.pool.get(this.address);
            if (pooled != null) {
                if (this.request.method().equals("GET") || Internal.instance.isReadable(pooled)) {
                    break;
                }
                pooled.getSocket().close();
            } else {
                if (!hasNextConnectionSpec()) {
                    if (!hasNextInetSocketAddress()) {
                        if (!hasNextProxy()) {
                            if (!hasNextPostponed()) {
                                throw new NoSuchElementException();
                            }
                            return new Connection(this.pool, nextPostponed());
                        }
                        this.lastProxy = nextProxy();
                    }
                    this.lastInetSocketAddress = nextInetSocketAddress();
                }
                this.lastSpec = nextConnectionSpec();
                boolean shouldSendTlsFallbackIndicator = shouldSendTlsFallbackIndicator(this.lastSpec);
                Route route = new Route(this.address, this.lastProxy, this.lastInetSocketAddress, this.lastSpec, shouldSendTlsFallbackIndicator);
                if (this.routeDatabase.shouldPostpone(route)) {
                    this.postponedRoutes.add(route);
                    return nextUnconnected();
                }
                return new Connection(this.pool, route);
            }
        }
        return pooled;
    }

    private boolean shouldSendTlsFallbackIndicator(ConnectionSpec connectionSpec) {
        return connectionSpec != this.connectionSpecs.get(0) && connectionSpec.isTls();
    }

    public void connectFailed(Connection connection, IOException failure) {
        if (Internal.instance.recycleCount(connection) > 0) {
            return;
        }
        Route failedRoute = connection.getRoute();
        if (failedRoute.getProxy().type() != Proxy.Type.DIRECT && this.address.getProxySelector() != null) {
            this.address.getProxySelector().connectFailed(this.uri, failedRoute.getProxy().address(), failure);
        }
        this.routeDatabase.failed(failedRoute);
        if (!(failure instanceof SSLHandshakeException) && !(failure instanceof SSLProtocolException)) {
            while (this.nextSpecIndex < this.connectionSpecs.size()) {
                List<ConnectionSpec> list = this.connectionSpecs;
                int i = this.nextSpecIndex;
                this.nextSpecIndex = i + 1;
                ConnectionSpec connectionSpec = list.get(i);
                boolean shouldSendTlsFallbackIndicator = shouldSendTlsFallbackIndicator(connectionSpec);
                Route toSuppress = new Route(this.address, this.lastProxy, this.lastInetSocketAddress, connectionSpec, shouldSendTlsFallbackIndicator);
                this.routeDatabase.failed(toSuppress);
            }
        }
    }

    private void resetNextProxy(URI uri, Proxy proxy) {
        if (proxy != null) {
            this.proxies = Collections.singletonList(proxy);
        } else {
            this.proxies = new ArrayList();
            List<Proxy> selectedProxies = this.client.getProxySelector().select(uri);
            if (selectedProxies != null) {
                this.proxies.addAll(selectedProxies);
            }
            this.proxies.removeAll(Collections.singleton(Proxy.NO_PROXY));
            this.proxies.add(Proxy.NO_PROXY);
        }
        this.nextProxyIndex = 0;
    }

    private boolean hasNextProxy() {
        return this.nextProxyIndex < this.proxies.size();
    }

    private Proxy nextProxy() throws IOException {
        if (!hasNextProxy()) {
            throw new SocketException("No route to " + this.address.getUriHost() + "; exhausted proxy configurations: " + this.proxies);
        }
        List<Proxy> list = this.proxies;
        int i = this.nextProxyIndex;
        this.nextProxyIndex = i + 1;
        Proxy result = list.get(i);
        resetNextInetSocketAddress(result);
        return result;
    }

    private void resetNextInetSocketAddress(Proxy proxy) throws UnknownHostException {
        String socketHost;
        int socketPort;
        this.inetSocketAddresses = new ArrayList();
        if (proxy.type() == Proxy.Type.DIRECT || proxy.type() == Proxy.Type.SOCKS) {
            socketHost = this.address.getUriHost();
            socketPort = Util.getEffectivePort(this.uri);
        } else {
            SocketAddress proxyAddress = proxy.address();
            if (!(proxyAddress instanceof InetSocketAddress)) {
                throw new IllegalArgumentException("Proxy.address() is not an InetSocketAddress: " + proxyAddress.getClass());
            }
            InetSocketAddress proxySocketAddress = (InetSocketAddress) proxyAddress;
            socketHost = getHostString(proxySocketAddress);
            socketPort = proxySocketAddress.getPort();
        }
        for (InetAddress inetAddress : this.network.resolveInetAddresses(socketHost)) {
            this.inetSocketAddresses.add(new InetSocketAddress(inetAddress, socketPort));
        }
        this.nextInetSocketAddressIndex = 0;
    }

    static String getHostString(InetSocketAddress socketAddress) {
        InetAddress address = socketAddress.getAddress();
        if (address == null) {
            return socketAddress.getHostName();
        }
        return address.getHostAddress();
    }

    private boolean hasNextInetSocketAddress() {
        return this.nextInetSocketAddressIndex < this.inetSocketAddresses.size();
    }

    private InetSocketAddress nextInetSocketAddress() throws IOException {
        if (!hasNextInetSocketAddress()) {
            throw new SocketException("No route to " + this.address.getUriHost() + "; exhausted inet socket addresses: " + this.inetSocketAddresses);
        }
        List<InetSocketAddress> list = this.inetSocketAddresses;
        int i = this.nextInetSocketAddressIndex;
        this.nextInetSocketAddressIndex = i + 1;
        InetSocketAddress result = list.get(i);
        resetConnectionSpecs();
        return result;
    }

    private void resetConnectionSpecs() {
        this.connectionSpecs = new ArrayList();
        List<ConnectionSpec> specs = this.address.getConnectionSpecs();
        int size = specs.size();
        for (int i = 0; i < size; i++) {
            ConnectionSpec spec = specs.get(i);
            if (this.request.isHttps() == spec.isTls()) {
                this.connectionSpecs.add(spec);
            }
        }
        this.nextSpecIndex = 0;
    }

    private boolean hasNextConnectionSpec() {
        return this.nextSpecIndex < this.connectionSpecs.size();
    }

    private ConnectionSpec nextConnectionSpec() throws IOException {
        if (!hasNextConnectionSpec()) {
            throw new SocketException("No route to " + this.address.getUriHost() + "; exhausted connection specs: " + this.connectionSpecs);
        }
        List<ConnectionSpec> list = this.connectionSpecs;
        int i = this.nextSpecIndex;
        this.nextSpecIndex = i + 1;
        return list.get(i);
    }

    private boolean hasNextPostponed() {
        return !this.postponedRoutes.isEmpty();
    }

    private Route nextPostponed() {
        return this.postponedRoutes.remove(0);
    }
}
