package com.squareup.okhttp;

import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.Request;
import com.squareup.okhttp.internal.ConnectionSpecSelector;
import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.Version;
import com.squareup.okhttp.internal.framed.FramedConnection;
import com.squareup.okhttp.internal.http.FramedTransport;
import com.squareup.okhttp.internal.http.HttpConnection;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.HttpTransport;
import com.squareup.okhttp.internal.http.RouteException;
import com.squareup.okhttp.internal.http.Transport;
import com.squareup.okhttp.internal.tls.OkHostnameVerifier;
import java.io.IOException;
import java.net.Proxy;
import java.net.Socket;
import java.net.UnknownServiceException;
import java.security.cert.X509Certificate;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import okio.BufferedSink;
import okio.BufferedSource;

/* loaded from: okhttp-2.6.0.jar:com/squareup/okhttp/Connection.class */
public final class Connection {
    private final ConnectionPool pool;
    private final Route route;
    private Socket socket;
    private Handshake handshake;
    private Protocol protocol;
    private HttpConnection httpConnection;
    private FramedConnection framedConnection;
    private long idleStartTimeNs;
    private int recycleCount;
    private Object owner;

    public Connection(ConnectionPool pool, Route route) {
        this.pool = pool;
        this.route = route;
    }

    Object getOwner() {
        Object obj;
        synchronized (this.pool) {
            obj = this.owner;
        }
        return obj;
    }

    void setOwner(Object owner) {
        if (isFramed()) {
            return;
        }
        synchronized (this.pool) {
            if (this.owner != null) {
                throw new IllegalStateException("Connection already has an owner!");
            }
            this.owner = owner;
        }
    }

    boolean clearOwner() {
        synchronized (this.pool) {
            if (this.owner == null) {
                return false;
            }
            this.owner = null;
            return true;
        }
    }

    void closeIfOwnedBy(Object owner) throws IOException {
        if (isFramed()) {
            throw new IllegalStateException();
        }
        synchronized (this.pool) {
            if (this.owner != owner) {
                return;
            }
            this.owner = null;
            if (this.socket != null) {
                this.socket.close();
            }
        }
    }

    void connect(int connectTimeout, int readTimeout, int writeTimeout, List<ConnectionSpec> connectionSpecs, boolean connectionRetryEnabled) throws RouteException {
        if (this.protocol != null) {
            throw new IllegalStateException("already connected");
        }
        RouteException routeException = null;
        ConnectionSpecSelector connectionSpecSelector = new ConnectionSpecSelector(connectionSpecs);
        Proxy proxy = this.route.getProxy();
        Address address = this.route.getAddress();
        if (this.route.address.getSslSocketFactory() == null && !connectionSpecs.contains(ConnectionSpec.CLEARTEXT)) {
            throw new RouteException(new UnknownServiceException("CLEARTEXT communication not supported: " + connectionSpecs));
        }
        while (this.protocol == null) {
            try {
                this.socket = (proxy.type() == Proxy.Type.DIRECT || proxy.type() == Proxy.Type.HTTP) ? address.getSocketFactory().createSocket() : new Socket(proxy);
                connectSocket(connectTimeout, readTimeout, writeTimeout, connectionSpecSelector);
            } catch (IOException e) {
                Util.closeQuietly(this.socket);
                this.socket = null;
                this.handshake = null;
                this.protocol = null;
                this.httpConnection = null;
                this.framedConnection = null;
                if (routeException == null) {
                    routeException = new RouteException(e);
                } else {
                    routeException.addConnectException(e);
                }
                if (!connectionRetryEnabled || !connectionSpecSelector.connectionFailed(e)) {
                    throw routeException;
                }
            }
        }
    }

    private void connectSocket(int connectTimeout, int readTimeout, int writeTimeout, ConnectionSpecSelector connectionSpecSelector) throws IOException {
        this.socket.setSoTimeout(readTimeout);
        Platform.get().connectSocket(this.socket, this.route.getSocketAddress(), connectTimeout);
        if (this.route.address.getSslSocketFactory() != null) {
            connectTls(readTimeout, writeTimeout, connectionSpecSelector);
        } else {
            this.protocol = Protocol.HTTP_1_1;
        }
        if (this.protocol == Protocol.SPDY_3 || this.protocol == Protocol.HTTP_2) {
            this.socket.setSoTimeout(0);
            this.framedConnection = new FramedConnection.Builder(this.route.address.uriHost, true, this.socket).protocol(this.protocol).build();
            this.framedConnection.sendConnectionPreface();
            return;
        }
        this.httpConnection = new HttpConnection(this.pool, this, this.socket);
    }

    private void connectTls(int readTimeout, int writeTimeout, ConnectionSpecSelector connectionSpecSelector) throws IOException {
        if (this.route.requiresTunnel()) {
            createTunnel(readTimeout, writeTimeout);
        }
        Address address = this.route.getAddress();
        SSLSocketFactory sslSocketFactory = address.getSslSocketFactory();
        try {
            try {
                SSLSocket sslSocket = (SSLSocket) sslSocketFactory.createSocket(this.socket, address.getUriHost(), address.getUriPort(), true);
                ConnectionSpec connectionSpec = connectionSpecSelector.configureSecureSocket(sslSocket);
                if (connectionSpec.supportsTlsExtensions()) {
                    Platform.get().configureTlsExtensions(sslSocket, address.getUriHost(), address.getProtocols());
                }
                sslSocket.startHandshake();
                Handshake unverifiedHandshake = Handshake.get(sslSocket.getSession());
                if (!address.getHostnameVerifier().verify(address.getUriHost(), sslSocket.getSession())) {
                    X509Certificate cert = (X509Certificate) unverifiedHandshake.peerCertificates().get(0);
                    throw new SSLPeerUnverifiedException("Hostname " + address.getUriHost() + " not verified:\n    certificate: " + CertificatePinner.pin(cert) + "\n    DN: " + cert.getSubjectDN().getName() + "\n    subjectAltNames: " + OkHostnameVerifier.allSubjectAltNames(cert));
                }
                address.getCertificatePinner().check(address.getUriHost(), unverifiedHandshake.peerCertificates());
                String maybeProtocol = connectionSpec.supportsTlsExtensions() ? Platform.get().getSelectedProtocol(sslSocket) : null;
                this.socket = sslSocket;
                this.handshake = unverifiedHandshake;
                this.protocol = maybeProtocol != null ? Protocol.get(maybeProtocol) : Protocol.HTTP_1_1;
                if (sslSocket != null) {
                    Platform.get().afterHandshake(sslSocket);
                }
                if (1 == 0) {
                    Util.closeQuietly((Socket) sslSocket);
                }
            } catch (AssertionError e) {
                if (!Util.isAndroidGetsocknameError(e)) {
                    throw e;
                }
                throw new IOException(e);
            }
        } catch (Throwable th) {
            if (0 != 0) {
                Platform.get().afterHandshake(null);
            }
            if (0 == 0) {
                Util.closeQuietly((Socket) null);
            }
            throw th;
        }
    }

    /*  JADX ERROR: JadxRuntimeException in pass: RegionMakerVisitor
        jadx.core.utils.exceptions.JadxRuntimeException: Failed to find switch 'out' block (already processed)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.calcSwitchOut(SwitchRegionMaker.java:200)
        	at jadx.core.dex.visitors.regions.maker.SwitchRegionMaker.process(SwitchRegionMaker.java:61)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:112)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.LoopRegionMaker.process(LoopRegionMaker.java:103)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.traverse(RegionMaker.java:89)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeRegion(RegionMaker.java:66)
        	at jadx.core.dex.visitors.regions.maker.RegionMaker.makeMthRegion(RegionMaker.java:48)
        	at jadx.core.dex.visitors.regions.RegionMakerVisitor.visit(RegionMakerVisitor.java:25)
        */
    private void createTunnel(int r7, int r8) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 280
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.Connection.createTunnel(int, int):void");
    }

    private Request createTunnelRequest() throws IOException {
        HttpUrl tunnelUrl = new HttpUrl.Builder().scheme("https").host(this.route.address.uriHost).port(this.route.address.uriPort).build();
        return new Request.Builder().url(tunnelUrl).header("Host", Util.hostHeader(tunnelUrl)).header("Proxy-Connection", "Keep-Alive").header("User-Agent", Version.userAgent()).build();
    }

    void connectAndSetOwner(OkHttpClient client, Object owner) throws RouteException {
        setOwner(owner);
        if (!isConnected()) {
            List<ConnectionSpec> connectionSpecs = this.route.address.getConnectionSpecs();
            connect(client.getConnectTimeout(), client.getReadTimeout(), client.getWriteTimeout(), connectionSpecs, client.getRetryOnConnectionFailure());
            if (isFramed()) {
                client.getConnectionPool().share(this);
            }
            client.routeDatabase().connected(getRoute());
        }
        setTimeouts(client.getReadTimeout(), client.getWriteTimeout());
    }

    boolean isConnected() {
        return this.protocol != null;
    }

    public Route getRoute() {
        return this.route;
    }

    public Socket getSocket() {
        return this.socket;
    }

    BufferedSource rawSource() {
        if (this.httpConnection == null) {
            throw new UnsupportedOperationException();
        }
        return this.httpConnection.rawSource();
    }

    BufferedSink rawSink() {
        if (this.httpConnection == null) {
            throw new UnsupportedOperationException();
        }
        return this.httpConnection.rawSink();
    }

    boolean isAlive() {
        return (this.socket.isClosed() || this.socket.isInputShutdown() || this.socket.isOutputShutdown()) ? false : true;
    }

    boolean isReadable() {
        if (this.httpConnection != null) {
            return this.httpConnection.isReadable();
        }
        return true;
    }

    void resetIdleStartTime() {
        if (this.framedConnection != null) {
            throw new IllegalStateException("framedConnection != null");
        }
        this.idleStartTimeNs = System.nanoTime();
    }

    boolean isIdle() {
        return this.framedConnection == null || this.framedConnection.isIdle();
    }

    long getIdleStartTimeNs() {
        return this.framedConnection == null ? this.idleStartTimeNs : this.framedConnection.getIdleStartTimeNs();
    }

    public Handshake getHandshake() {
        return this.handshake;
    }

    Transport newTransport(HttpEngine httpEngine) throws IOException {
        return this.framedConnection != null ? new FramedTransport(httpEngine, this.framedConnection) : new HttpTransport(httpEngine, this.httpConnection);
    }

    boolean isFramed() {
        return this.framedConnection != null;
    }

    public Protocol getProtocol() {
        return this.protocol != null ? this.protocol : Protocol.HTTP_1_1;
    }

    void setTimeouts(int readTimeoutMillis, int writeTimeoutMillis) throws RouteException {
        if (this.protocol == null) {
            throw new IllegalStateException("not connected");
        }
        if (this.httpConnection != null) {
            try {
                this.socket.setSoTimeout(readTimeoutMillis);
                this.httpConnection.setTimeouts(readTimeoutMillis, writeTimeoutMillis);
            } catch (IOException e) {
                throw new RouteException(e);
            }
        }
    }

    void incrementRecycleCount() {
        this.recycleCount++;
    }

    int recycleCount() {
        return this.recycleCount;
    }

    public String toString() {
        return "Connection{" + this.route.address.uriHost + ":" + this.route.address.uriPort + ", proxy=" + this.route.proxy + " hostAddress=" + this.route.inetSocketAddress.getAddress().getHostAddress() + " cipherSuite=" + (this.handshake != null ? this.handshake.cipherSuite() : "none") + " protocol=" + this.protocol + '}';
    }
}
