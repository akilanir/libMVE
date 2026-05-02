package com.squareup.okhttp;

import com.squareup.okhttp.Request;
import com.squareup.okhttp.internal.Platform;
import com.squareup.okhttp.internal.Util;
import com.squareup.okhttp.internal.http.HttpConnection;
import com.squareup.okhttp.internal.http.HttpEngine;
import com.squareup.okhttp.internal.http.HttpTransport;
import com.squareup.okhttp.internal.http.SpdyTransport;
import com.squareup.okhttp.internal.http.Transport;
import com.squareup.okhttp.internal.spdy.SpdyConnection;
import com.squareup.okhttp.internal.tls.OkHostnameVerifier;
import java.io.IOException;
import java.net.Proxy;
import java.net.Socket;
import java.net.URL;
import java.security.cert.X509Certificate;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSocket;

/* loaded from: okhttp-2.3.0.jar:com/squareup/okhttp/Connection.class */
public final class Connection {
    private final ConnectionPool pool;
    private final Route route;
    private Socket socket;
    private HttpConnection httpConnection;
    private SpdyConnection spdyConnection;
    private long idleStartTimeNs;
    private Handshake handshake;
    private int recycleCount;
    private Object owner;
    private boolean connected = false;
    private Protocol protocol = Protocol.HTTP_1_1;

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
        if (isSpdy()) {
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
        if (isSpdy()) {
            throw new IllegalStateException();
        }
        synchronized (this.pool) {
            if (this.owner != owner) {
                return;
            }
            this.owner = null;
            this.socket.close();
        }
    }

    void connect(int connectTimeout, int readTimeout, int writeTimeout, Request tunnelRequest) throws IOException {
        if (this.connected) {
            throw new IllegalStateException("already connected");
        }
        if (this.route.proxy.type() == Proxy.Type.DIRECT || this.route.proxy.type() == Proxy.Type.HTTP) {
            this.socket = this.route.address.socketFactory.createSocket();
        } else {
            this.socket = new Socket(this.route.proxy);
        }
        this.socket.setSoTimeout(readTimeout);
        Platform.get().connectSocket(this.socket, this.route.inetSocketAddress, connectTimeout);
        if (this.route.address.sslSocketFactory != null) {
            upgradeToTls(tunnelRequest, readTimeout, writeTimeout);
        } else {
            this.httpConnection = new HttpConnection(this.pool, this, this.socket);
        }
        this.connected = true;
    }

    void connectAndSetOwner(OkHttpClient client, Object owner, Request request) throws IOException {
        setOwner(owner);
        if (!isConnected()) {
            Request tunnelRequest = tunnelRequest(request);
            connect(client.getConnectTimeout(), client.getReadTimeout(), client.getWriteTimeout(), tunnelRequest);
            if (isSpdy()) {
                client.getConnectionPool().share(this);
            }
            client.routeDatabase().connected(getRoute());
        }
        setTimeouts(client.getReadTimeout(), client.getWriteTimeout());
    }

    private Request tunnelRequest(Request request) throws IOException {
        if (!this.route.requiresTunnel()) {
            return null;
        }
        String host = request.url().getHost();
        int port = Util.getEffectivePort(request.url());
        String authority = port == Util.getDefaultPort("https") ? host : host + ":" + port;
        Request.Builder result = new Request.Builder().url(new URL("https", host, port, "/")).header("Host", authority).header("Proxy-Connection", "Keep-Alive");
        String userAgent = request.header("User-Agent");
        if (userAgent != null) {
            result.header("User-Agent", userAgent);
        }
        String proxyAuthorization = request.header("Proxy-Authorization");
        if (proxyAuthorization != null) {
            result.header("Proxy-Authorization", proxyAuthorization);
        }
        return result.build();
    }

    private void upgradeToTls(Request tunnelRequest, int readTimeout, int writeTimeout) throws IOException {
        String maybeProtocol;
        Platform platform = Platform.get();
        if (tunnelRequest != null) {
            makeTunnel(tunnelRequest, readTimeout, writeTimeout);
        }
        this.socket = this.route.address.sslSocketFactory.createSocket(this.socket, this.route.address.uriHost, this.route.address.uriPort, true);
        SSLSocket sslSocket = (SSLSocket) this.socket;
        this.route.connectionSpec.apply(sslSocket, this.route);
        try {
            sslSocket.startHandshake();
            if (this.route.connectionSpec.supportsTlsExtensions() && (maybeProtocol = platform.getSelectedProtocol(sslSocket)) != null) {
                this.protocol = Protocol.get(maybeProtocol);
            }
            this.handshake = Handshake.get(sslSocket.getSession());
            if (!this.route.address.hostnameVerifier.verify(this.route.address.uriHost, sslSocket.getSession())) {
                X509Certificate cert = (X509Certificate) sslSocket.getSession().getPeerCertificates()[0];
                throw new SSLPeerUnverifiedException("Hostname " + this.route.address.uriHost + " not verified:\n    certificate: " + CertificatePinner.pin(cert) + "\n    DN: " + cert.getSubjectDN().getName() + "\n    subjectAltNames: " + OkHostnameVerifier.allSubjectAltNames(cert));
            }
            this.route.address.certificatePinner.check(this.route.address.uriHost, this.handshake.peerCertificates());
            if (this.protocol == Protocol.SPDY_3 || this.protocol == Protocol.HTTP_2) {
                sslSocket.setSoTimeout(0);
                this.spdyConnection = new SpdyConnection.Builder(this.route.address.getUriHost(), true, this.socket).protocol(this.protocol).build();
                this.spdyConnection.sendConnectionPreface();
                return;
            }
            this.httpConnection = new HttpConnection(this.pool, this, this.socket);
        } finally {
            platform.afterHandshake(sslSocket);
        }
    }

    boolean isConnected() {
        return this.connected;
    }

    public Route getRoute() {
        return this.route;
    }

    public Socket getSocket() {
        return this.socket;
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
        if (this.spdyConnection != null) {
            throw new IllegalStateException("spdyConnection != null");
        }
        this.idleStartTimeNs = System.nanoTime();
    }

    boolean isIdle() {
        return this.spdyConnection == null || this.spdyConnection.isIdle();
    }

    long getIdleStartTimeNs() {
        return this.spdyConnection == null ? this.idleStartTimeNs : this.spdyConnection.getIdleStartTimeNs();
    }

    public Handshake getHandshake() {
        return this.handshake;
    }

    Transport newTransport(HttpEngine httpEngine) throws IOException {
        return this.spdyConnection != null ? new SpdyTransport(httpEngine, this.spdyConnection) : new HttpTransport(httpEngine, this.httpConnection);
    }

    boolean isSpdy() {
        return this.spdyConnection != null;
    }

    public Protocol getProtocol() {
        return this.protocol;
    }

    void setProtocol(Protocol protocol) {
        if (protocol == null) {
            throw new IllegalArgumentException("protocol == null");
        }
        this.protocol = protocol;
    }

    void setTimeouts(int readTimeoutMillis, int writeTimeoutMillis) throws IOException {
        if (!this.connected) {
            throw new IllegalStateException("setTimeouts - not connected");
        }
        if (this.httpConnection != null) {
            this.socket.setSoTimeout(readTimeoutMillis);
            this.httpConnection.setTimeouts(readTimeoutMillis, writeTimeoutMillis);
        }
    }

    void incrementRecycleCount() {
        this.recycleCount++;
    }

    int recycleCount() {
        return this.recycleCount;
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
    private void makeTunnel(com.squareup.okhttp.Request r7, int r8, int r9) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 272
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.squareup.okhttp.Connection.makeTunnel(com.squareup.okhttp.Request, int, int):void");
    }

    public String toString() {
        return "Connection{" + this.route.address.uriHost + ":" + this.route.address.uriPort + ", proxy=" + this.route.proxy + " hostAddress=" + this.route.inetSocketAddress.getAddress().getHostAddress() + " cipherSuite=" + (this.handshake != null ? this.handshake.cipherSuite() : "none") + " protocol=" + this.protocol + '}';
    }
}
