package com.squareup.okhttp.internal.http;

import com.squareup.okhttp.HttpUrl;
import com.squareup.okhttp.Protocol;
import com.squareup.okhttp.Request;
import java.net.Proxy;

/* loaded from: okhttp-2.5.0.jar:com/squareup/okhttp/internal/http/RequestLine.class */
public final class RequestLine {
    private RequestLine() {
    }

    static String get(Request request, Proxy.Type proxyType, Protocol protocol) {
        StringBuilder result = new StringBuilder();
        result.append(request.method());
        result.append(' ');
        if (includeAuthorityInRequestLine(request, proxyType)) {
            result.append(request.httpUrl());
        } else {
            result.append(requestPath(request.httpUrl()));
        }
        result.append(' ');
        result.append(version(protocol));
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

    public static String version(Protocol protocol) {
        return protocol == Protocol.HTTP_1_0 ? "HTTP/1.0" : "HTTP/1.1";
    }
}
