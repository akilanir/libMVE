package cz.msebera.android.httpclient.auth;

import cz.msebera.android.httpclient.annotation.Immutable;
import cz.msebera.android.httpclient.util.Args;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/auth/AuthOption.class */
public final class AuthOption {
    private final AuthScheme authScheme;
    private final Credentials creds;

    public AuthOption(AuthScheme authScheme, Credentials creds) {
        Args.notNull(authScheme, "Auth scheme");
        Args.notNull(creds, "User credentials");
        this.authScheme = authScheme;
        this.creds = creds;
    }

    public AuthScheme getAuthScheme() {
        return this.authScheme;
    }

    public Credentials getCredentials() {
        return this.creds;
    }

    public String toString() {
        return this.authScheme.toString();
    }
}
