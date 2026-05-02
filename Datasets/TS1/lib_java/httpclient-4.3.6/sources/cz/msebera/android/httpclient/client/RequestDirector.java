package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpException;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.io.IOException;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/RequestDirector.class */
public interface RequestDirector {
    HttpResponse execute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws HttpException, IOException;
}
