package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.AuthenticationException;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.util.Map;

@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/AuthenticationHandler.class */
public interface AuthenticationHandler {
    boolean isAuthenticationRequested(HttpResponse httpResponse, HttpContext httpContext);

    Map<String, Header> getChallenges(HttpResponse httpResponse, HttpContext httpContext) throws MalformedChallengeException;

    AuthScheme selectScheme(Map<String, Header> map, HttpResponse httpResponse, HttpContext httpContext) throws AuthenticationException;
}
