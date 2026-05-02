package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.util.Args;
import java.net.InetAddress;
import java.net.InetSocketAddress;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/HttpInetSocketAddress.class */
public class HttpInetSocketAddress extends InetSocketAddress {
    private static final long serialVersionUID = -6650701828361907957L;
    private final HttpHost httphost;

    public HttpInetSocketAddress(HttpHost httphost, InetAddress addr, int port) {
        super(addr, port);
        Args.notNull(httphost, "HTTP host");
        this.httphost = httphost;
    }

    public HttpHost getHttpHost() {
        return this.httphost;
    }

    @Override // java.net.InetSocketAddress
    public String toString() {
        return this.httphost.getHostName() + ":" + getPort();
    }
}
