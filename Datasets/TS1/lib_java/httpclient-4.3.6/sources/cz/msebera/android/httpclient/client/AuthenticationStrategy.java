package cz.msebera.android.httpclient.client;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpHost;
import cz.msebera.android.httpclient.HttpResponse;
import cz.msebera.android.httpclient.auth.AuthOption;
import cz.msebera.android.httpclient.auth.AuthScheme;
import cz.msebera.android.httpclient.auth.MalformedChallengeException;
import cz.msebera.android.httpclient.protocol.HttpContext;
import java.util.Map;
import java.util.Queue;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/AuthenticationStrategy.class */
public interface AuthenticationStrategy {
    boolean isAuthenticationRequested(HttpHost httpHost, HttpResponse httpResponse, HttpContext httpContext);

    Map<String, Header> getChallenges(HttpHost httpHost, HttpResponse httpResponse, HttpContext httpContext) throws MalformedChallengeException;

    Queue<AuthOption> select(Map<String, Header> map, HttpHost httpHost, HttpResponse httpResponse, HttpContext httpContext) throws MalformedChallengeException;

    void authSucceeded(HttpHost httpHost, AuthScheme authScheme, HttpContext httpContext);

    void authFailed(HttpHost httpHost, AuthScheme authScheme, HttpContext httpContext);
}
