package cz.msebera.android.httpclient.conn;

import cz.msebera.android.httpclient.HttpHost;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/SchemePortResolver.class */
public interface SchemePortResolver {
    int resolve(HttpHost httpHost) throws UnsupportedSchemeException;
}
