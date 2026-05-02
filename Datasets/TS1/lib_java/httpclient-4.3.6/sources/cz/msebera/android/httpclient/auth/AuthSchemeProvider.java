package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.protocol.HttpContext;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/AuthSchemeProvider.class */
public interface AuthSchemeProvider {
    AuthScheme create(HttpContext httpContext);
}
