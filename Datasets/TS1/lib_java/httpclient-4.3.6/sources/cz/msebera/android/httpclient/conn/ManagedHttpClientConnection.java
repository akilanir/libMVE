package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpClientConnection;
import cz.msebera.android.httpclient.HttpInetConnection;
import java.io.IOException;
import java.net.Socket;
import javax.net.ssl.SSLSession;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ManagedHttpClientConnection.class */
public interface ManagedHttpClientConnection extends HttpClientConnection, HttpInetConnection {
    String getId();

    void bind(Socket socket) throws IOException;

    Socket getSocket();

    SSLSession getSSLSession();
}
