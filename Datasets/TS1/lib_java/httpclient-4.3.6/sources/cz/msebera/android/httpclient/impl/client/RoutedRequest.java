package cz.msebera.android.httpclient.impl.client;

import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.conn.routing.HttpRoute;

@NotThreadSafe
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/RoutedRequest.class */
public class RoutedRequest {
    protected final RequestWrapper request;
    protected final HttpRoute route;

    public RoutedRequest(RequestWrapper req, HttpRoute route) {
        this.request = req;
        this.route = route;
    }

    public final RequestWrapper getRequest() {
        return this.request;
    }

    public final HttpRoute getRoute() {
        return this.route;
    }
}
