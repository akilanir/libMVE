package cz.msebera.android.httpclient;

import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/HttpResponseFactory.class */
public interface HttpResponseFactory {
    HttpResponse newHttpResponse(ProtocolVersion protocolVersion, int i, HttpContext httpContext);

    HttpResponse newHttpResponse(StatusLine statusLine, HttpContext httpContext);
}
