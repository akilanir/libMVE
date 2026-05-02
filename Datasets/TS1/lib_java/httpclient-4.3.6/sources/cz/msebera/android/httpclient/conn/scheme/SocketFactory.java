package cz.msebera.android.httpclient.conn.scheme;

import cz.msebera.android.httpclient.conn.ConnectTimeoutException;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.net.InetAddress;
import java.net.Socket;
import java.net.UnknownHostException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/scheme/SocketFactory.class */
public interface SocketFactory {
    Socket createSocket() throws IOException;

    Socket connectSocket(Socket socket, String str, int i, InetAddress inetAddress, int i2, HttpParams httpParams) throws IOException, UnknownHostException, ConnectTimeoutException;

    boolean isSecure(Socket socket) throws IllegalArgumentException;
}
