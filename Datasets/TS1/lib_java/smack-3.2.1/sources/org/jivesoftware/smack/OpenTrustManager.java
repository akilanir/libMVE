package org.jivesoftware.smack;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

/* loaded from: smack-3.2.1.jar:org/jivesoftware/smack/OpenTrustManager.class */
class OpenTrustManager implements X509TrustManager {
    @Override // javax.net.ssl.X509TrustManager
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkClientTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkServerTrusted(X509Certificate[] arg0, String arg1) throws CertificateException {
    }
}
