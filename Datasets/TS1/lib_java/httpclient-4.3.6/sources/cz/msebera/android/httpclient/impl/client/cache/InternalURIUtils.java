package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.client.utils.URIUtils;
import cz.msebera.android.httpclient.conn.routing.RouteInfo;
import java.net.URI;
import java.net.URISyntaxException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/InternalURIUtils.class */
class InternalURIUtils {
    public static URI rewriteURIForRoute(URI uri, RouteInfo route) throws URISyntaxException {
        if (uri == null) {
            return null;
        }
        if (route.getProxyHost() != null && !route.isTunnelled()) {
            if (!uri.isAbsolute()) {
                HttpHost target = route.getTargetHost();
                return URIUtils.rewriteURI(uri, target, true);
            }
            return URIUtils.rewriteURI(uri);
        }
        if (uri.isAbsolute()) {
            return URIUtils.rewriteURI(uri, null, true);
        }
        return URIUtils.rewriteURI(uri);
    }

    private InternalURIUtils() {
    }
}
