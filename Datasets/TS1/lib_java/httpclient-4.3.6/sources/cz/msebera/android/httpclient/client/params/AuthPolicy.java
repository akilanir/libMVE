package cz.msebera.android.httpclient.client.params;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
@Deprecated
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/client/params/AuthPolicy.class */
public final class AuthPolicy {
    public static final String NTLM = "NTLM";
    public static final String DIGEST = "Digest";
    public static final String BASIC = "Basic";
    public static final String SPNEGO = "negotiate";
    public static final String KERBEROS = "Kerberos";

    private AuthPolicy() {
    }
}
