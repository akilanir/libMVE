package cz.msebera.android.httpclient.impl.client.cache;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.annotation.NotThreadSafe;
import cz.msebera.android.httpclient.client.methods.CloseableHttpResponse;
import cz.msebera.android.httpclient.util.Args;
import java.lang.reflect.Proxy;

@NotThreadSafe
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/impl/client/cache/Proxies.class */
class Proxies {
    Proxies() {
    }

    public static CloseableHttpResponse enhanceResponse(HttpResponse original) {
        Args.notNull(original, "HTTP response");
        if (original instanceof CloseableHttpResponse) {
            return (CloseableHttpResponse) original;
        }
        return (CloseableHttpResponse) Proxy.newProxyInstance(ResponseProxyHandler.class.getClassLoader(), new Class[]{CloseableHttpResponse.class}, new ResponseProxyHandler(original));
    }
}
