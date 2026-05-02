package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpInetConnection;
import cz.msebera.android.httpclient.params.HttpParams;
import java.io.IOException;
import java.net.Socket;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/OperatedClientConnection.class */
public interface OperatedClientConnection extends HttpClientConnection, HttpInetConnection {
    HttpHost getTargetHost();

    boolean isSecure();

    Socket getSocket();

    void opening(Socket socket, HttpHost httpHost) throws IOException;

    void openCompleted(boolean z, HttpParams httpParams) throws IOException;

    void update(Socket socket, HttpHost httpHost, boolean z, HttpParams httpParams) throws IOException;
}
