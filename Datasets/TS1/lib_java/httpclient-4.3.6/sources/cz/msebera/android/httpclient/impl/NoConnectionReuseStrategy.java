package cz.msebera.android.httpclient.impl;

import cz.msebera.android.httpclient.ConnectionReuseStrategy;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.protocol.HttpContext;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/NoConnectionReuseStrategy.class */
public class NoConnectionReuseStrategy implements ConnectionReuseStrategy {
    public static final NoConnectionReuseStrategy INSTANCE = new NoConnectionReuseStrategy();

    @Override // cz.msebera.android.httpclient.ConnectionReuseStrategy
    public boolean keepAlive(HttpResponse response, HttpContext context) {
        return false;
    }
}
