package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.annotation.Immutable;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/AllowAllHostnameVerifier.class */
public class AllowAllHostnameVerifier extends AbstractVerifier {
    @Override // cz.msebera.android.httpclient.conn.ssl.X509HostnameVerifier
    public final void verify(String host, String[] cns, String[] subjectAlts) {
    }

    public final String toString() {
        return "ALLOW_ALL";
    }
}
