package cz.msebera.android.httpclient.conn.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/TrustSelfSignedStrategy.class */
public class TrustSelfSignedStrategy implements TrustStrategy {
    @Override // cz.msebera.android.httpclient.conn.ssl.TrustStrategy
    public boolean isTrusted(X509Certificate[] chain, String authType) throws CertificateException {
        return chain.length == 1;
    }
}
