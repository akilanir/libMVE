package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpRequestInterceptor.class */
public interface HttpRequestInterceptor {
    void process(HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException;
}
