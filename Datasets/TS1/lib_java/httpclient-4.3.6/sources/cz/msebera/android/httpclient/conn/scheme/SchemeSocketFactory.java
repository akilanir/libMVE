package cz.msebera.android.httpclient.conn.scheme;

import cz.msebera.android.httpclient.conn.ConnectTimeoutException;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.net.Socket;
import java.net.UnknownHostException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/SchemeSocketFactory.class */
public interface SchemeSocketFactory {
    Socket createSocket(HttpParams httpParams) throws IOException;

    Socket connectSocket(Socket socket, InetSocketAddress inetSocketAddress, InetSocketAddress inetSocketAddress2, HttpParams httpParams) throws IOException, UnknownHostException, ConnectTimeoutException;

    boolean isSecure(Socket socket) throws IllegalArgumentException;
}
