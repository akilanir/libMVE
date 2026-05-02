package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;
import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/ContextAwareAuthScheme.class */
public interface ContextAwareAuthScheme extends AuthScheme {
    Header authenticate(Credentials credentials, HttpRequest httpRequest, HttpContext httpContext) throws AuthenticationException;
}
