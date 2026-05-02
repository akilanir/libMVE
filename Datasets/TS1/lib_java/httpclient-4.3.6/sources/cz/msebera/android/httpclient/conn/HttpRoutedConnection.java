package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpInetConnection;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;
import javax.net.ssl.SSLSession;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/HttpRoutedConnection.class */
public interface HttpRoutedConnection extends HttpInetConnection {
    boolean isSecure();

    HttpRoute getRoute();

    SSLSession getSSLSession();
}
