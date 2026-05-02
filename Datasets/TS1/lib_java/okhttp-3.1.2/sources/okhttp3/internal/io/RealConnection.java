package okhttp3.internal.io;

import java.io.IOException;
import java.lang.ref.Reference;
import java.net.ConnectException;
import java.net.Proxy;
import java.net.Socket;
import java.net.SocketTimeoutException;
import java.net.UnknownServiceException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;
import javax.net.ssl.SSLPeerUnverifiedException;
import javax.net.ssl.SSLSocket;
import javax.net.ssl.SSLSocketFactory;
import okhttp3.Address;
import okhttp3.CertificatePinner;
import okhttp3.Connection;
import okhttp3.ConnectionSpec;
import okhttp3.Handshake;
import okhttp3.Protocol;
import okhttp3.Request;
import okhttp3.Route;
import okhttp3.internal.ConnectionSpecSelector;
import okhttp3.internal.Platform;
import okhttp3.internal.Util;
import okhttp3.internal.Version;
import okhttp3.internal.framed.ErrorCode;
import okhttp3.internal.framed.FramedConnection;
import okhttp3.internal.framed.FramedStream;
import okhttp3.internal.http.RouteException;
import okhttp3.internal.http.StreamAllocation;
import okhttp3.internal.tls.OkHostnameVerifier;
import okio.BufferedSink;
import okio.BufferedSource;
import okio.Okio;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/io/RealConnection.class */
public final class RealConnection extends FramedConnection.Listener implements Connection {
    private final Route route;
    private Socket rawSocket;
    public Socket socket;
    private Handshake handshake;
    private Protocol protocol;
    public volatile FramedConnection framedConnection;
    public int successCount;
    public BufferedSource source;
    public BufferedSink sink;
    public int allocationLimit;
    public boolean noNewStreams;
    public final List<Reference<StreamAllocation>> allocations = new ArrayList();
    public long idleAtNanos = Long.MAX_VALUE;

    public RealConnection(Route route) {
        this.route = route;
    }

    public void connect(int connectTimeout, int readTimeout, int writeTimeout, List<ConnectionSpec> connectionSpecs, boolean connectionRetryEnabled) throws RouteException {
        if (this.protocol != null) {
            throw new IllegalStateException("already connected");
        }
        RouteException routeException = null;
        ConnectionSpecSelector connectionSpecSelector = new ConnectionSpecSelector(connectionSpecs);
        Proxy proxy = this.route.proxy();
        Address address = this.route.address();
        if (this.route.address().sslSocketFactory() == null && !connectionSpecs.contains(ConnectionSpec.CLEARTEXT)) {
            throw new RouteException(new UnknownServiceException("CLEARTEXT communication not supported: " + connectionSpecs));
        }
        while (this.protocol == null) {
            try {
                this.rawSocket = (proxy.type() == Proxy.Type.DIRECT || proxy.type() == Proxy.Type.HTTP) ? address.socketFactory().createSocket() : new Socket(proxy);
                connectSocket(connectTimeout, readTimeout, writeTimeout, connectionSpecSelector);
            } catch (IOException e) {
                Util.closeQuietly(this.socket);
                Util.closeQuietly(this.rawSocket);
                this.socket = null;
                this.rawSocket = null;
                this.source = null;
                this.sink = null;
                this.handshake = null;
                this.protocol = null;
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
        this.rawSocket.setSoTimeout(readTimeout);
        try {
            Platform.get().connectSocket(this.rawSocket, this.route.socketAddress(), connectTimeout);
            this.source = Okio.buffer(Okio.source(this.rawSocket));
            this.sink = Okio.buffer(Okio.sink(this.rawSocket));
            if (this.route.address().sslSocketFactory() != null) {
                connectTls(readTimeout, writeTimeout, connectionSpecSelector);
            } else {
                this.protocol = Protocol.HTTP_1_1;
                this.socket = this.rawSocket;
            }
            if (this.protocol == Protocol.SPDY_3 || this.protocol == Protocol.HTTP_2) {
                this.socket.setSoTimeout(0);
                FramedConnection framedConnection = new FramedConnection.Builder(true).socket(this.socket, this.route.address().url().host(), this.source, this.sink).protocol(this.protocol).listener(this).build();
                framedConnection.sendConnectionPreface();
                this.allocationLimit = framedConnection.maxConcurrentStreams();
                this.framedConnection = framedConnection;
                return;
            }
            this.allocationLimit = 1;
        } catch (ConnectException e) {
            throw new ConnectException("Failed to connect to " + this.route.socketAddress());
        }
    }

    private void connectTls(int readTimeout, int writeTimeout, ConnectionSpecSelector connectionSpecSelector) throws IOException {
        if (this.route.requiresTunnel()) {
            createTunnel(readTimeout, writeTimeout);
        }
        Address address = this.route.address();
        SSLSocketFactory sslSocketFactory = address.sslSocketFactory();
        try {
            try {
                SSLSocket sslSocket = (SSLSocket) sslSocketFactory.createSocket(this.rawSocket, address.url().host(), address.url().port(), true);
                ConnectionSpec connectionSpec = connectionSpecSelector.configureSecureSocket(sslSocket);
                if (connectionSpec.supportsTlsExtensions()) {
                    Platform.get().configureTlsExtensions(sslSocket, address.url().host(), address.protocols());
                }
                sslSocket.startHandshake();
                Handshake unverifiedHandshake = Handshake.get(sslSocket.getSession());
                if (!address.hostnameVerifier().verify(address.url().host(), sslSocket.getSession())) {
                    X509Certificate cert = (X509Certificate) unverifiedHandshake.peerCertificates().get(0);
                    throw new SSLPeerUnverifiedException("Hostname " + address.url().host() + " not verified:\n    certificate: " + CertificatePinner.pin(cert) + "\n    DN: " + cert.getSubjectDN().getName() + "\n    subjectAltNames: " + OkHostnameVerifier.allSubjectAltNames(cert));
                }
                address.certificatePinner().check(address.url().host(), unverifiedHandshake.peerCertificates());
                String maybeProtocol = connectionSpec.supportsTlsExtensions() ? Platform.get().getSelectedProtocol(sslSocket) : null;
                this.socket = sslSocket;
                this.source = Okio.buffer(Okio.source(this.socket));
                this.sink = Okio.buffer(Okio.sink(this.socket));
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
            Method dump skipped, instructions count: 327
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: okhttp3.internal.io.RealConnection.createTunnel(int, int):void");
    }

    private Request createTunnelRequest() throws IOException {
        return new Request.Builder().url(this.route.address().url()).header("Host", Util.hostHeader(this.route.address().url())).header("Proxy-Connection", "Keep-Alive").header("User-Agent", Version.userAgent()).build();
    }

    boolean isConnected() {
        return this.protocol != null;
    }

    @Override // okhttp3.Connection
    public Route route() {
        return this.route;
    }

    public void cancel() {
        Util.closeQuietly(this.rawSocket);
    }

    @Override // okhttp3.Connection
    public Socket socket() {
        return this.socket;
    }

    public boolean isHealthy(boolean doExtensiveChecks) {
        if (this.socket.isClosed() || this.socket.isInputShutdown() || this.socket.isOutputShutdown()) {
            return false;
        }
        if (this.framedConnection == null && doExtensiveChecks) {
            try {
                int readTimeout = this.socket.getSoTimeout();
                try {
                    this.socket.setSoTimeout(1);
                    if (this.source.exhausted()) {
                        return false;
                    }
                    this.socket.setSoTimeout(readTimeout);
                    return true;
                } finally {
                    this.socket.setSoTimeout(readTimeout);
                }
            } catch (SocketTimeoutException e) {
                return true;
            } catch (IOException e2) {
                return false;
            }
        }
        return true;
    }

    @Override // okhttp3.internal.framed.FramedConnection.Listener
    public void onStream(FramedStream stream) throws IOException {
        stream.close(ErrorCode.REFUSED_STREAM);
    }

    @Override // okhttp3.internal.framed.FramedConnection.Listener
    public void onSettings(FramedConnection connection) {
        this.allocationLimit = connection.maxConcurrentStreams();
    }

    @Override // okhttp3.Connection
    public Handshake handshake() {
        return this.handshake;
    }

    public boolean isMultiplexed() {
        return this.framedConnection != null;
    }

    @Override // okhttp3.Connection
    public Protocol protocol() {
        if (this.framedConnection == null) {
            return this.protocol != null ? this.protocol : Protocol.HTTP_1_1;
        }
        return this.framedConnection.getProtocol();
    }

    public String toString() {
        return "Connection{" + this.route.address().url().host() + ":" + this.route.address().url().port() + ", proxy=" + this.route.proxy() + " hostAddress=" + this.route.socketAddress() + " cipherSuite=" + (this.handshake != null ? this.handshake.cipherSuite() : "none") + " protocol=" + this.protocol + '}';
    }
}
