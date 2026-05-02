package cz.msebera.android.httpclient.conn.scheme;

import cz.msebera.android.httpclient.conn.ConnectTimeoutException;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/SchemeLayeredSocketFactoryAdaptor2.class */
class SchemeLayeredSocketFactoryAdaptor2 implements SchemeLayeredSocketFactory {
    private final LayeredSchemeSocketFactory factory;

    SchemeLayeredSocketFactoryAdaptor2(LayeredSchemeSocketFactory factory) {
        this.factory = factory;
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.SchemeSocketFactory
    public Socket createSocket(HttpParams params) throws IOException {
        return this.factory.createSocket(params);
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.SchemeSocketFactory
    public Socket connectSocket(Socket sock, InetSocketAddress remoteAddress, InetSocketAddress localAddress, HttpParams params) throws IOException, UnknownHostException, ConnectTimeoutException {
        return this.factory.connectSocket(sock, remoteAddress, localAddress, params);
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.SchemeSocketFactory
    public boolean isSecure(Socket sock) throws IllegalArgumentException {
        return this.factory.isSecure(sock);
    }

    @Override // cz.msebera.android.httpclient.conn.scheme.SchemeLayeredSocketFactory
    public Socket createLayeredSocket(Socket socket, String target, int port, HttpParams params) throws IOException, UnknownHostException {
        return this.factory.createLayeredSocket(socket, target, port, true);
    }
}
