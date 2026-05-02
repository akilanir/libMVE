package cz.msebera.android.httpclient.protocol;

import cz.msebera.android.httpclient.HttpRequest;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/protocol/HttpRequestHandlerMapper.class */
public interface HttpRequestHandlerMapper {
    HttpRequestHandler lookup(HttpRequest httpRequest);
}
