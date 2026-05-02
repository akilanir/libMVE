package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.Header;
import cz.msebera.android.httpclient.HttpRequest;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/AuthScheme.class */
public interface AuthScheme {
    void processChallenge(Header header) throws MalformedChallengeException;

    String getSchemeName();

    String getParameter(String str);

    String getRealm();

    boolean isConnectionBased();

    boolean isComplete();

    @Deprecated
    Header authenticate(Credentials credentials, HttpRequest httpRequest) throws AuthenticationException;
}
