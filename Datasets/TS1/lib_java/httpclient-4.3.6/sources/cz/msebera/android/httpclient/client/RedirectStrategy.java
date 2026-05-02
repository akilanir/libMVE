package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.client.methods.HttpUriRequest;
import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/RedirectStrategy.class */
public interface RedirectStrategy {
    boolean isRedirected(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws ProtocolException;

    HttpUriRequest getRedirect(HttpRequest httpRequest, HttpResponse httpResponse, HttpContext httpContext) throws ProtocolException;
}
