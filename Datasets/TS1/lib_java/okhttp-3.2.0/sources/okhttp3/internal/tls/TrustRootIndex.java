package okhttp3.internal.tls;

import java.security.cert.X509Certificate;

/* loaded from: okhttp-3.2.0.jar:okhttp3/internal/tls/TrustRootIndex.class */
public interface TrustRootIndex {
    X509Certificate findByIssuerAndSignature(X509Certificate x509Certificate);
}
