package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.HttpConnection;
import java.io.IOException;
import java.net.Socket;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpConnectionFactory.class */
public interface HttpConnectionFactory<T extends HttpConnection> {
    T createConnection(Socket socket) throws IOException;
}
