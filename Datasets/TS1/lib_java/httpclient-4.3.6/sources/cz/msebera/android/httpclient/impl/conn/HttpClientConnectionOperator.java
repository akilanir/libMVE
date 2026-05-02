package cz.msebera.android.httpclient.impl.conn;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.protocol.HttpClientContext;
import cz.msebera.android.httpclient.config.Lookup;
import cz.msebera.android.httpclient.conn.DnsResolver;
import cz.msebera.android.httpclient.conn.ManagedHttpClientConnection;
import cz.msebera.android.httpclient.conn.SchemePortResolver;
import cz.msebera.android.httpclient.conn.UnsupportedSchemeException;
import cz.msebera.android.httpclient.conn.socket.ConnectionSocketFactory;
import cz.msebera.android.httpclient.conn.socket.LayeredConnectionSocketFactory;
import cz.msebera.android.httpclient.extras.HttpClientAndroidLog;
import cz.msebera.android.httpclient.protocol.HttpContext;
import cz.msebera.android.httpclient.util.Args;
import java.io.IOException;
import java.net.Socket;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/conn/HttpClientConnectionOperator.class */
class HttpClientConnectionOperator {
    static final String SOCKET_FACTORY_REGISTRY = "http.socket-factory-registry";
    public HttpClientAndroidLog log = new HttpClientAndroidLog(getClass());
    private final Lookup<ConnectionSocketFactory> socketFactoryRegistry;
    private final SchemePortResolver schemePortResolver;
    private final DnsResolver dnsResolver;

    HttpClientConnectionOperator(Lookup<ConnectionSocketFactory> socketFactoryRegistry, SchemePortResolver schemePortResolver, DnsResolver dnsResolver) {
        Args.notNull(socketFactoryRegistry, "Socket factory registry");
        this.socketFactoryRegistry = socketFactoryRegistry;
        this.schemePortResolver = schemePortResolver != null ? schemePortResolver : DefaultSchemePortResolver.INSTANCE;
        this.dnsResolver = dnsResolver != null ? dnsResolver : SystemDefaultDnsResolver.INSTANCE;
    }

    private Lookup<ConnectionSocketFactory> getSocketFactoryRegistry(HttpContext context) {
        Lookup<ConnectionSocketFactory> reg = (Lookup) context.getAttribute("http.socket-factory-registry");
        if (reg == null) {
            reg = this.socketFactoryRegistry;
        }
        return reg;
    }

    /* JADX WARN: Removed duplicated region for block: B:54:0x01b8  */
    /* JADX WARN: Removed duplicated region for block: B:66:0x01dd A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void connect(cz.msebera.android.httpclient.conn.ManagedHttpClientConnection r9, cz.msebera.android.httpclient.HttpHost r10, java.net.InetSocketAddress r11, int r12, cz.msebera.android.httpclient.config.SocketConfig r13, cz.msebera.android.httpclient.protocol.HttpContext r14) throws java.io.IOException {
        /*
            Method dump skipped, instructions count: 484
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: cz.msebera.android.httpclient.impl.conn.HttpClientConnectionOperator.connect(cz.msebera.android.httpclient.conn.ManagedHttpClientConnection, cz.msebera.android.httpclient.HttpHost, java.net.InetSocketAddress, int, cz.msebera.android.httpclient.config.SocketConfig, cz.msebera.android.httpclient.protocol.HttpContext):void");
    }

    public void upgrade(ManagedHttpClientConnection conn, HttpHost host, HttpContext context) throws IOException {
        HttpClientContext clientContext = HttpClientContext.adapt(context);
        Lookup<ConnectionSocketFactory> registry = getSocketFactoryRegistry(clientContext);
        ConnectionSocketFactory sf = registry.lookup(host.getSchemeName());
        if (sf == null) {
            throw new UnsupportedSchemeException(host.getSchemeName() + " protocol is not supported");
        }
        if (!(sf instanceof LayeredConnectionSocketFactory)) {
            throw new UnsupportedSchemeException(host.getSchemeName() + " protocol does not support connection upgrade");
        }
        LayeredConnectionSocketFactory lsf = (LayeredConnectionSocketFactory) sf;
        Socket sock = conn.getSocket();
        int port = this.schemePortResolver.resolve(host);
        conn.bind(lsf.createLayeredSocket(sock, host.getHostName(), port, context));
    }
}
