package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.ProtocolException;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.net.URI;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/RedirectHandler.class */
public interface RedirectHandler {
    boolean isRedirectRequested(HttpResponse httpResponse, HttpContext httpContext);

    URI getLocationURI(HttpResponse httpResponse, HttpContext httpContext) throws ProtocolException;
}
