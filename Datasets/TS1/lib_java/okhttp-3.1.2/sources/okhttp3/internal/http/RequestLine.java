package okhttp3.internal.http;

import java.net.Proxy;
import okhttp3.HttpUrl;
import okhttp3.Request;

/* loaded from: okhttp-3.1.2.jar:okhttp3/internal/http/RequestLine.class */
public final class RequestLine {
    private RequestLine() {
    }

    static String get(Request request, Proxy.Type proxyType) {
        StringBuilder result = new StringBuilder();
        result.append(request.method());
        result.append(' ');
        if (includeAuthorityInRequestLine(request, proxyType)) {
            result.append(request.url());
        } else {
            result.append(requestPath(request.url()));
        }
        result.append(" HTTP/1.1");
        return result.toString();
    }

    private static boolean includeAuthorityInRequestLine(Request request, Proxy.Type proxyType) {
        return !request.isHttps() && proxyType == Proxy.Type.HTTP;
    }

    public static String requestPath(HttpUrl url) {
        String path = url.encodedPath();
        String query = url.encodedQuery();
        return query != null ? path + '?' + query : path;
    }
}
