package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpConnection;
import cz.msebera.android.httpclient.config.ConnectionConfig;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/HttpConnectionFactory.class */
public interface HttpConnectionFactory<T, C extends HttpConnection> {
    C create(T t, ConnectionConfig connectionConfig);
}
