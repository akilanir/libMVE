package cz.msebera.android.httpclient.client.config;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/config/AuthSchemes.class */
public final class AuthSchemes {
    public static final String BASIC = "Basic";
    public static final String DIGEST = "Digest";
    public static final String NTLM = "NTLM";
    public static final String SPNEGO = "negotiate";
    public static final String KERBEROS = "Kerberos";

    private AuthSchemes() {
    }
}
