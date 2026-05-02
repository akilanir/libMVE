package com.squareup.okhttp;

import com.squareup.okhttp.Headers;
import com.squareup.okhttp.internal.Internal;
import com.squareup.okhttp.internal.InternalCache;
import com.squareup.okhttp.internal.Network;
import com.squareup.okhttp.internal.RouteDatabase;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.AuthenticatorAdapter;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.Transport;
import com.squareup.okhttp.internal.tls.OkHostnameVerifier;
import java.io.IOException;
import java.net.CookieHandler;
import java.net.Proxy;
import java.net.ProxySelector;
import java.security.GeneralSecurityException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.TimeUnit;
import javax.net.SocketFactory;
import javax.net.ssl.HostnameVerifier;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;

/* loaded from: okhttp-2.2.0.jar:com/squareup/okhttp/OkHttpClient.class */
public class OkHttpClient implements Cloneable {
    private static final List<Protocol> DEFAULT_PROTOCOLS = Util.immutableList(Protocol.HTTP_2, Protocol.SPDY_3, Protocol.HTTP_1_1);
    private static final List<ConnectionSpec> DEFAULT_CONNECTION_SPECS = Util.immutableList(ConnectionSpec.MODERN_TLS, ConnectionSpec.COMPATIBLE_TLS, ConnectionSpec.CLEARTEXT);
    private static SSLSocketFactory defaultSslSocketFactory;
    private final RouteDatabase routeDatabase;
    private Dispatcher dispatcher;
    private Proxy proxy;
    private List<Protocol> protocols;
    private List<ConnectionSpec> connectionSpecs;
    private final List<Interceptor> interceptors;
    private final List<Interceptor> networkInterceptors;
    private ProxySelector proxySelector;
    private CookieHandler cookieHandler;
    private InternalCache internalCache;
    private Cache cache;
    private SocketFactory socketFactory;
    private SSLSocketFactory sslSocketFactory;
    private HostnameVerifier hostnameVerifier;
    private CertificatePinner certificatePinner;
    private Authenticator authenticator;
    private ConnectionPool connectionPool;
    private Network network;
    private boolean followSslRedirects;
    private boolean followRedirects;
    private boolean retryOnConnectionFailure;
    private int connectTimeout;
    private int readTimeout;
    private int writeTimeout;

    static {
        Internal.instance = new Internal() { // from class: com.squareup.okhttp.OkHttpClient.1
            @Override // com.squareup.okhttp.internal.Internal
            public Transport newTransport(Connection connection, HttpEngine httpEngine) throws IOException {
                return connection.newTransport(httpEngine);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public boolean clearOwner(Connection connection) {
                return connection.clearOwner();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void closeIfOwnedBy(Connection connection, Object owner) throws IOException {
                connection.closeIfOwnedBy(owner);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public int recycleCount(Connection connection) {
                return connection.recycleCount();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void setProtocol(Connection connection, Protocol protocol) {
                connection.setProtocol(protocol);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void setOwner(Connection connection, HttpEngine httpEngine) {
                connection.setOwner(httpEngine);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public boolean isReadable(Connection pooled) {
                return pooled.isReadable();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void addLine(Headers.Builder builder, String line) {
                builder.addLine(line);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void setCache(OkHttpClient client, InternalCache internalCache) {
                client.setInternalCache(internalCache);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public InternalCache internalCache(OkHttpClient client) {
                return client.internalCache();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void recycle(ConnectionPool pool, Connection connection) {
                pool.recycle(connection);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public RouteDatabase routeDatabase(OkHttpClient client) {
                return client.routeDatabase();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public Network network(OkHttpClient client) {
                return client.network;
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void setNetwork(OkHttpClient client, Network network) {
                client.network = network;
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void connectAndSetOwner(OkHttpClient client, Connection connection, HttpEngine owner, Request request) throws IOException {
                connection.connectAndSetOwner(client, owner, request);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public Call newCall(OkHttpClient client, Request request) {
                return new Call(client, request);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public Response callGetResponse(Call call, boolean forWebSocket) throws IOException {
                return call.getResponse(call.originalRequest, forWebSocket);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void callEngineReleaseConnection(Call call) throws IOException {
                call.engine.releaseConnection();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public Connection callEngineGetConnection(Call call) {
                return call.engine.getConnection();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public boolean connectionClearOwner(Connection connection) {
                return connection.clearOwner();
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void connectionSetOwner(Connection connection, Object owner) {
                connection.setOwner(owner);
            }

            @Override // com.squareup.okhttp.internal.Internal
            public void connectionCloseIfOwnedBy(Connection connection, Object owner) throws IOException {
                connection.closeIfOwnedBy(owner);
            }
        };
    }

    public OkHttpClient() {
        this.interceptors = new ArrayList();
        this.networkInterceptors = new ArrayList();
        this.followSslRedirects = true;
        this.followRedirects = true;
        this.retryOnConnectionFailure = true;
        this.routeDatabase = new RouteDatabase();
        this.dispatcher = new Dispatcher();
    }

    private OkHttpClient(OkHttpClient okHttpClient) {
        this.interceptors = new ArrayList();
        this.networkInterceptors = new ArrayList();
        this.followSslRedirects = true;
        this.followRedirects = true;
        this.retryOnConnectionFailure = true;
        this.routeDatabase = okHttpClient.routeDatabase;
        this.dispatcher = okHttpClient.dispatcher;
        this.proxy = okHttpClient.proxy;
        this.protocols = okHttpClient.protocols;
        this.connectionSpecs = okHttpClient.connectionSpecs;
        this.interceptors.addAll(okHttpClient.interceptors);
        this.networkInterceptors.addAll(okHttpClient.networkInterceptors);
        this.proxySelector = okHttpClient.proxySelector;
        this.cookieHandler = okHttpClient.cookieHandler;
        this.cache = okHttpClient.cache;
        this.internalCache = this.cache != null ? this.cache.internalCache : okHttpClient.internalCache;
        this.socketFactory = okHttpClient.socketFactory;
        this.sslSocketFactory = okHttpClient.sslSocketFactory;
        this.hostnameVerifier = okHttpClient.hostnameVerifier;
        this.certificatePinner = okHttpClient.certificatePinner;
        this.authenticator = okHttpClient.authenticator;
        this.connectionPool = okHttpClient.connectionPool;
        this.network = okHttpClient.network;
        this.followSslRedirects = okHttpClient.followSslRedirects;
        this.followRedirects = okHttpClient.followRedirects;
        this.retryOnConnectionFailure = okHttpClient.retryOnConnectionFailure;
        this.connectTimeout = okHttpClient.connectTimeout;
        this.readTimeout = okHttpClient.readTimeout;
        this.writeTimeout = okHttpClient.writeTimeout;
    }

    public final void setConnectTimeout(long timeout, TimeUnit unit) {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout < 0");
        }
        if (unit == null) {
            throw new IllegalArgumentException("unit == null");
        }
        long millis = unit.toMillis(timeout);
        if (millis > 2147483647L) {
            throw new IllegalArgumentException("Timeout too large.");
        }
        this.connectTimeout = (int) millis;
    }

    public final int getConnectTimeout() {
        return this.connectTimeout;
    }

    public final void setReadTimeout(long timeout, TimeUnit unit) {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout < 0");
        }
        if (unit == null) {
            throw new IllegalArgumentException("unit == null");
        }
        long millis = unit.toMillis(timeout);
        if (millis > 2147483647L) {
            throw new IllegalArgumentException("Timeout too large.");
        }
        this.readTimeout = (int) millis;
    }

    public final int getReadTimeout() {
        return this.readTimeout;
    }

    public final void setWriteTimeout(long timeout, TimeUnit unit) {
        if (timeout < 0) {
            throw new IllegalArgumentException("timeout < 0");
        }
        if (unit == null) {
            throw new IllegalArgumentException("unit == null");
        }
        long millis = unit.toMillis(timeout);
        if (millis > 2147483647L) {
            throw new IllegalArgumentException("Timeout too large.");
        }
        this.writeTimeout = (int) millis;
    }

    public final int getWriteTimeout() {
        return this.writeTimeout;
    }

    public final OkHttpClient setProxy(Proxy proxy) {
        this.proxy = proxy;
        return this;
    }

    public final Proxy getProxy() {
        return this.proxy;
    }

    public final OkHttpClient setProxySelector(ProxySelector proxySelector) {
        this.proxySelector = proxySelector;
        return this;
    }

    public final ProxySelector getProxySelector() {
        return this.proxySelector;
    }

    public final OkHttpClient setCookieHandler(CookieHandler cookieHandler) {
        this.cookieHandler = cookieHandler;
        return this;
    }

    public final CookieHandler getCookieHandler() {
        return this.cookieHandler;
    }

    final void setInternalCache(InternalCache internalCache) {
        this.internalCache = internalCache;
        this.cache = null;
    }

    final InternalCache internalCache() {
        return this.internalCache;
    }

    public final OkHttpClient setCache(Cache cache) {
        this.cache = cache;
        this.internalCache = null;
        return this;
    }

    public final Cache getCache() {
        return this.cache;
    }

    public final OkHttpClient setSocketFactory(SocketFactory socketFactory) {
        this.socketFactory = socketFactory;
        return this;
    }

    public final SocketFactory getSocketFactory() {
        return this.socketFactory;
    }

    public final OkHttpClient setSslSocketFactory(SSLSocketFactory sslSocketFactory) {
        this.sslSocketFactory = sslSocketFactory;
        return this;
    }

    public final SSLSocketFactory getSslSocketFactory() {
        return this.sslSocketFactory;
    }

    public final OkHttpClient setHostnameVerifier(HostnameVerifier hostnameVerifier) {
        this.hostnameVerifier = hostnameVerifier;
        return this;
    }

    public final HostnameVerifier getHostnameVerifier() {
        return this.hostnameVerifier;
    }

    public final OkHttpClient setCertificatePinner(CertificatePinner certificatePinner) {
        this.certificatePinner = certificatePinner;
        return this;
    }

    public final CertificatePinner getCertificatePinner() {
        return this.certificatePinner;
    }

    public final OkHttpClient setAuthenticator(Authenticator authenticator) {
        this.authenticator = authenticator;
        return this;
    }

    public final Authenticator getAuthenticator() {
        return this.authenticator;
    }

    public final OkHttpClient setConnectionPool(ConnectionPool connectionPool) {
        this.connectionPool = connectionPool;
        return this;
    }

    public final ConnectionPool getConnectionPool() {
        return this.connectionPool;
    }

    public final OkHttpClient setFollowSslRedirects(boolean followProtocolRedirects) {
        this.followSslRedirects = followProtocolRedirects;
        return this;
    }

    public final boolean getFollowSslRedirects() {
        return this.followSslRedirects;
    }

    public final void setFollowRedirects(boolean followRedirects) {
        this.followRedirects = followRedirects;
    }

    public final boolean getFollowRedirects() {
        return this.followRedirects;
    }

    public final void setRetryOnConnectionFailure(boolean retryOnConnectionFailure) {
        this.retryOnConnectionFailure = retryOnConnectionFailure;
    }

    public final boolean getRetryOnConnectionFailure() {
        return this.retryOnConnectionFailure;
    }

    final RouteDatabase routeDatabase() {
        return this.routeDatabase;
    }

    public final OkHttpClient setDispatcher(Dispatcher dispatcher) {
        if (dispatcher == null) {
            throw new IllegalArgumentException("dispatcher == null");
        }
        this.dispatcher = dispatcher;
        return this;
    }

    public final Dispatcher getDispatcher() {
        return this.dispatcher;
    }

    public final OkHttpClient setProtocols(List<Protocol> protocols) {
        List<Protocol> protocols2 = Util.immutableList(protocols);
        if (!protocols2.contains(Protocol.HTTP_1_1)) {
            throw new IllegalArgumentException("protocols doesn't contain http/1.1: " + protocols2);
        }
        if (protocols2.contains(Protocol.HTTP_1_0)) {
            throw new IllegalArgumentException("protocols must not contain http/1.0: " + protocols2);
        }
        if (protocols2.contains(null)) {
            throw new IllegalArgumentException("protocols must not contain null");
        }
        this.protocols = Util.immutableList(protocols2);
        return this;
    }

    public final List<Protocol> getProtocols() {
        return this.protocols;
    }

    public final OkHttpClient setConnectionSpecs(List<ConnectionSpec> connectionSpecs) {
        this.connectionSpecs = Util.immutableList(connectionSpecs);
        return this;
    }

    public final List<ConnectionSpec> getConnectionSpecs() {
        return this.connectionSpecs;
    }

    public List<Interceptor> interceptors() {
        return this.interceptors;
    }

    public List<Interceptor> networkInterceptors() {
        return this.networkInterceptors;
    }

    public Call newCall(Request request) {
        return new Call(this, request);
    }

    public OkHttpClient cancel(Object tag) {
        getDispatcher().cancel(tag);
        return this;
    }

    final OkHttpClient copyWithDefaults() {
        OkHttpClient result = new OkHttpClient(this);
        if (result.proxySelector == null) {
            result.proxySelector = ProxySelector.getDefault();
        }
        if (result.cookieHandler == null) {
            result.cookieHandler = CookieHandler.getDefault();
        }
        if (result.socketFactory == null) {
            result.socketFactory = SocketFactory.getDefault();
        }
        if (result.sslSocketFactory == null) {
            result.sslSocketFactory = getDefaultSSLSocketFactory();
        }
        if (result.hostnameVerifier == null) {
            result.hostnameVerifier = OkHostnameVerifier.INSTANCE;
        }
        if (result.certificatePinner == null) {
            result.certificatePinner = CertificatePinner.DEFAULT;
        }
        if (result.authenticator == null) {
            result.authenticator = AuthenticatorAdapter.INSTANCE;
        }
        if (result.connectionPool == null) {
            result.connectionPool = ConnectionPool.getDefault();
        }
        if (result.protocols == null) {
            result.protocols = DEFAULT_PROTOCOLS;
        }
        if (result.connectionSpecs == null) {
            result.connectionSpecs = DEFAULT_CONNECTION_SPECS;
        }
        if (result.network == null) {
            result.network = Network.DEFAULT;
        }
        return result;
    }

    private synchronized SSLSocketFactory getDefaultSSLSocketFactory() {
        if (defaultSslSocketFactory == null) {
            try {
                SSLContext sslContext = SSLContext.getInstance("TLS");
                sslContext.init(null, null, null);
                defaultSslSocketFactory = sslContext.getSocketFactory();
            } catch (GeneralSecurityException e) {
                throw new AssertionError();
            }
        }
        return defaultSslSocketFactory;
    }

    /* renamed from: clone, reason: merged with bridge method [inline-methods] */
    public final OkHttpClient m9clone() {
        try {
            return (OkHttpClient) super.clone();
        } catch (CloneNotSupportedException e) {
            throw new AssertionError();
        }
    }
}
