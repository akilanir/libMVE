package org.acra.util;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import javax.net.ssl.X509TrustManager;

/* loaded from: acra-4.5.0.jar:org/acra/util/NaiveTrustManager.class */
class NaiveTrustManager implements X509TrustManager {
    NaiveTrustManager() {
    }

    @Override // javax.net.ssl.X509TrustManager
    public X509Certificate[] getAcceptedIssuers() {
        return new X509Certificate[0];
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkClientTrusted(X509Certificate[] x509CertificateArray, String string) throws CertificateException {
    }

    @Override // javax.net.ssl.X509TrustManager
    public void checkServerTrusted(X509Certificate[] x509CertificateArray, String string) throws CertificateException {
    }
}
