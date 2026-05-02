package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.conn.scheme.SchemeRegistry;
import cz.msebera.android.httpclient.params.HttpParams;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ClientConnectionManagerFactory.class */
public interface ClientConnectionManagerFactory {
    ClientConnectionManager newInstance(HttpParams httpParams, SchemeRegistry schemeRegistry);
}
