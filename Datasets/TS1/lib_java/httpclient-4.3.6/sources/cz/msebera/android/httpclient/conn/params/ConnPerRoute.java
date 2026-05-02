package cz.msebera.android.httpclient.conn.params;

import cz.msebera.android.httpclient.conn.routing.HttpRoute;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/params/ConnPerRoute.class */
public interface ConnPerRoute {
    int getMaxForRoute(HttpRoute httpRoute);
}
