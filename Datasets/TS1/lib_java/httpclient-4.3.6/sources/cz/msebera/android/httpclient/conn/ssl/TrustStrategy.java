package cz.msebera.android.httpclient.conn.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/* loaded from: httpclient-4.3.6.jar:cz/msebera/android/httpclient/conn/ssl/TrustStrategy.class */
public interface TrustStrategy {
    boolean isTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException;
}
