package cz.msebera.android.httpclient.conn.ssl;

import cz.msebera.android.httpclient.annotation.Immutable;
import javax.net.ssl.SSLException;

@Immutable
/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/BrowserCompatHostnameVerifier.class */
public class BrowserCompatHostnameVerifier extends AbstractVerifier {
    @Override // cz.msebera.android.httpclient.conn.ssl.X509HostnameVerifier
    public final void verify(String host, String[] cns, String[] subjectAlts) throws SSLException {
        verify(host, cns, subjectAlts, false);
    }

    @Override // cz.msebera.android.httpclient.conn.ssl.AbstractVerifier
    boolean validCountryWildcard(String cn) {
        return true;
    }

    public final String toString() {
        return "BROWSER_COMPATIBLE";
    }
}
