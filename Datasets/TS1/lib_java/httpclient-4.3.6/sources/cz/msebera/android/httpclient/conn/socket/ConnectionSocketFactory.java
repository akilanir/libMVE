package cz.msebera.android.httpclient.conn.socket;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/socket/ConnectionSocketFactory.class */
public interface ConnectionSocketFactory {
    Socket createSocket(HttpContext httpContext) throws IOException;

    Socket connectSocket(int i, Socket socket, HttpHost httpHost, InetSocketAddress inetSocketAddress, InetSocketAddress inetSocketAddress2, HttpContext httpContext) throws IOException;
}
