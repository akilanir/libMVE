package org.apache.http.ssl;

import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;

/* loaded from: httpcore-4.4.3.jar:org/apache/http/ssl/TrustStrategy.class */
public interface TrustStrategy {
    boolean isTrusted(X509Certificate[] x509CertificateArr, String str) throws CertificateException;
}
